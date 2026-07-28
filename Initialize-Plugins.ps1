# List of PowerShell plugins/modules to manage
$pluginList = @(
    "PSReadLine",
    "posh-git"
)

# Function to initialize and ensure plugins are installed and imported
function Initialize-Plugin {
    param (
        [string[]]$Plugins = $pluginList,
        [string]$Source = "PSGallery"
    )
    foreach ($plugin in $Plugins) {
        if (-not (Get-Module -ListAvailable -Name $plugin)) {
            Write-Output "$plugin not found, installing..."
            Install-Module $plugin -Scope CurrentUser -Force
            Import-Module $plugin
        }
        else {
            Import-Module $plugin
        }
    }
}

# Function to check if plugins are loaded successfully
function Get-Plugin {
    param (
        [string[]]$Plugins = $pluginList
    )
    foreach ($plugin in $Plugins) {
        if (Get-Module -ListAvailable -Name $plugin) {
            Write-Output "Plugin $plugin is successfully imported"
        }
    }
}

Initialize-Plugin -Plugins $pluginList
