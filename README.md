# SecretManagement.Windows.LAPS

[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/erikgraa/SecretManagement.Windows.LAPS/refs/heads/main/LICENSE)
![PowerShell Gallery Downloads](https://img.shields.io/powershellgallery/dt/SecretManagement.Windows.LAPS)
![PowerShell Gallery Version](https://img.shields.io/powershellgallery/v/SecretManagement.Windows.LAPS?color=green)

> This PowerShell module is a Microsoft.PowerShell.SecretManagement extension for Windows LAPS passwords available in [the PowerShell Gallery](https://www.powershellgallery.com/packages/SecretManagement.Windows.LAPS).

> [!TIP]  
> Read the related blog post at https://blog.graa.dev/Vault-LAPS

## 📄 Prerequisites

### PowerShell version

> [!NOTE]  
> This module should support both Windows PowerShell version 5.1 and PowerShell 7, but testing has been done on PowerShell `7.5.1`

### Microsoft.PowerShell.SecretManagement

Make sure that the requisite `Microsoft.PowerShell.SecretManagement` module is installed.

```powershell
Install-Module -Name Microsoft.PowerShell.SecretManagement
```

## 📦 Installation

Install the Windows LAPS extension that is published to the PowerShell Gallery:

```powershell
Install-Module -Name SecretManagement.Windows.LAPS -AllowClobber
```

## 🔧 Usage

### Register vault

> [!IMPORTANT]  
> At present secrets are only pulled from the current computer's domain

```powershell
$vaultName = 'LAPS'
$module = 'SecretManagement.Windows.LAPS'

Register-SecretVault -Name $vaultName -Module $module
```

Optionally set this vault as the default one.

```powershell
Set-SecretVaultDefault -Name 'LAPS'
```

### Authenticating

Authentication is done using the logged-in user's credentials.

### Retrieve secret info

Retrieve information about every secret:

```powershell
Get-SecretInfo -Vault 'LAPS'
```

Filter by computer name:

```powershell
Get-SecretInfo -Vault 'LAPS' -Name 'computer'
```

### Retrieve secret

Retrieve a secret by specifying the secret name:

```powershell
Get-Secret -Vault 'LAPS' -Name 'computer'
```

## 🙌 Contributing

Any contributions are welcome and appreciated!

Please do so by forking the project and opening a pull request!

## ✨ Credits

> [!NOTE]  
> This module is not supported by Microsoft in any way.