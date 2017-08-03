#Requires -Version 3.0
function Optimize-PasswordDatabase {
    <#
    .SYNOPSIS
        Optimize the large password text file by breaking up into smaller files
    .DESCRIPTION
        Read the contents of the password file and sort each entry into a separate file by the first two (default) hex characters. Will create 256 smaller files which will allow for faster searching.
    .PARAMETER Path
        Location of password database file
    .PARAMETER OptimizationLevel
        Number of characters to sort by. Default is level 2 which will create 256 seperate files. Level 3 will create 4096 files. Anything higher than level 3 is NOT recommended.
    .INPUTS
        System.String
    .OUTPUTS
        None
    .EXAMPLE
        Optimize-PasswordDatabase -Path .\pwned-passwords-1.0.txt
    .LINK
        https://github.com/dzampino/posh-passwordcheck
    .NOTES
        N/A
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        [string]
        $Path,
        [Parameter(Mandatory=$false,
                   ValueFromPipelineByPropertyName=$true,
                   Position=1)]
        [ValidateRange(0,39)]
        [int]
        $OptimizationLevel = 2
    )
    begin {
        Set-StrictMode -Version Latest
        $ErrorActionPreference = 'Stop'
        try {
            if (!(Test-Path "$PSScriptRoot\db") {
                New-Item -Path $PSScriptRoot -Name db -ItemType Directory
            }
        }
        catch {
             Write-Error 'Unable to create db directory'
             Exit
        }
    }
    process {       
        $Passwords = New-Object System.IO.StreamReader -ArgumentList $Path
        while ($Line = $Passwords.ReadLine()) {
            # Code to read and separate data goes here
        }
    }
}