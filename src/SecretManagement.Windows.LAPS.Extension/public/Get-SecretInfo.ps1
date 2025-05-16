function Get-SecretInfo {
    [CmdletBinding()]
    param (
        [string] $Filter,
        [string] $VaultName,
        [hashtable] $AdditionalParameters
    )

    ## TODO: Domains/Forests in VaultParameters, AAD

    $results = @()

    $domain = [System.DirectoryServices.ActiveDirectory.Domain]::GetComputerDomain().Name

    $searchFilter = if (-not[string]::IsNullOrEmpty($Filter)) {
        'objectClass -eq "computer" -and name -like "' + $Filter + '"'
    }
    else {
        '*'
    }

    $computer = Get-ADComputer -Filter $searchFilter

    foreach ($_computer in $computer) {
        $results += Get-LapsADPassword -Identity $_computer.Name
    }

    $results | ForEach-Object {
        $metadata = [Ordered]@{
            'Account' = $PSItem.Account
            'Domain' = $domain
            'PasswordUpdateTime' = $PSItem.PasswordUpdateTime
            'ExpirationTimestamp' = $PSItem.ExpirationTimestamp
        }

        return @(,[Microsoft.PowerShell.SecretManagement.SecretInformation]::new(
            $PSItem.ComputerName,
            [Microsoft.PowerShell.SecretManagement.SecretType]::PSCredential,
            $VaultName,
            $metadata))
    } 
}