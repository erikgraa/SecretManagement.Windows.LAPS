function Test-SecretVault {
    [CmdletBinding()]
    param (
        [string] $VaultName,
        [hashtable] $AdditionalParameters
    )

    try {
        [System.DirectoryServices.ActiveDirectory.Domain]::GetComputerDomain().Name

        foreach ($_domain in $AdditionalParameters.Domain) {
            Get-ADDomain -Server $_domain
        }

        foreach ($_domain in $AdditionalParameters.Forest) {
            Get-ADDomain -Server $_domain
        }        
    }
    catch {
        throw $_
    }        
}