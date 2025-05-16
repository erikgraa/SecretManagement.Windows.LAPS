function Get-Secret {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [string] $Name,
        [string] $VaultName,
        [hashtable] $AdditionalParameters
    )

    ## TODO: Domains/Forests in VaultParameters, AAD

    try {
        $secret = Get-LapsAdPassword -Identity $Name -ErrorAction Stop

        [System.Management.Automation.PSCredential]::new($secret.Account, $secret.Password)
    }
    catch {
        Write-Debug ("Cannot find computer with name '{0}'" -f $Name)        
    }
}