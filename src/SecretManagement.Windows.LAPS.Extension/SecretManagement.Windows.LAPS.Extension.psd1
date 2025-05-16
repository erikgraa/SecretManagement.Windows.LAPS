@{
    ModuleVersion = '0.2505.2'
    RootModule = '.\SecretManagement.Windows.LAPS.Extension.psm1'
    FunctionsToExport = @('Get-Secret', 'Get-SecretInfo', 'Remove-Secret', 'Set-Secret', 'Test-SecretVault')
}