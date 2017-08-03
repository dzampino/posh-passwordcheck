#Requires -Version 3.0
function Compare-HackedPasswords {
    <#
    .SYNOPSIS
        Tests a password to see if it has been previously hacked

    .DESCRIPTION
        Creates a SHA1 of a string and compares it to Troy Hunt's list of exposed passwords found here: https://haveibeenpwned.com/Passwords

    .PARAMETER Password
        Password string to be checked

    .PARAMETER PasswordDatabasePath
        Location of password database file

    .INPUTS
        System.String

    .OUTPUTS
        System.Boolean

    .EXAMPLE
        Compare-HackedPasswords -Password 'pa$$word'

    .LINK
        https://github.com/dzampino/posh-passwordcheck

    .NOTES
        To-do: 
        Optimize search (possibly by optimizing database)
        Security considerations?
        Accept SHA1 hash directly as well as string
    #>
    [CmdletBinding()]
    [OutputType([bool])]
    param (
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        [string]
        $Password,
        [Parameter(Mandatory=$false,
                   Position=1)]
        [string]
        $PasswordDatabasePath = "$PSScriptRoot\pwned-passwords-1.0.txt"
    )
    begin {
        Set-StrictMode -Version Latest
        $ErrorActionPreference = 'Stop'
        $Result = $false
    }
    process {
        $StringBuilder = New-Object System.Text.StringBuilder 
        [System.Security.Cryptography.HashAlgorithm]::Create('SHA1').ComputeHash([System.Text.Encoding]::UTF8.GetBytes($Password)) |
            ForEach-Object { 
                [Void]$StringBuilder.Append($_.ToString('x2')) 
            }
        $Password = $null # Void out user's password since it's no longer used
        $Hash = $StringBuilder.ToString()
        $Hash = $Hash.ToUpper()        
        $Passwords = New-Object System.IO.StreamReader -ArgumentList $PasswordDatabasePath
        while ($Line = $Passwords.ReadLine()) {
            if ($Line -eq $Hash) {
                $Result = $true
                Break
            }
        }
    }    
    end {        
        $Hash = $null        
        $Result
    }
}