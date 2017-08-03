function Get-USCitizenCapability {
    <#
    .SYNOPSIS
        A brief description of the function or script.

    .DESCRIPTION
        A longer description.

    .PARAMETER FirstParameter
        Description of each of the parameters

    .PARAMETER SecondParameter
        Description of each of the parameters

    .INPUTS
        Description of objects that can be piped to the script

    .OUTPUTS
        Description of objects that are output by the script

    .EXAMPLE
        Example of how to run the script

    .LINK
        Links to further documentation

    .NOTES
        Detail on what the script does, if this is needed

    #>
    [CmdletBinding()]
    [OutputType([bool])]
    param (
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        [string]
        $Password
    )
    begin {
        Set-StrictMode -Version Latest
        $ErrorActionPreference = "Stop"
    }
    process {
        $Hash = Get-FileHash -

        $Capabilities = @{
            MilitaryService = $false
            DrinkAlcohol = $false
            Vote = $false
        }

        if ($Age -ge 18) {
            $Capabilities['MilitaryService'] = $true
            $Capabilities['Vote'] = $true
        }

        New-Object -Property $Capabilities -TypeName psobject
    }
}