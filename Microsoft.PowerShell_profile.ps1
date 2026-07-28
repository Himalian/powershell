$profilePath = Split-Path -Parent $PROFILE
$modules = @(
    "Initialize-Zoxide.ps1",
    "Set-Environment.ps1",
    "Initialize-Plugins.ps1",
    "Set-Alias.ps1",
    "Set-Keymaps.ps1"
)

# Import profile modules using dot-sourcing
function Import-ProfileModules {
    foreach ($module in $modules) {
        $fullPath = Join-Path $profilePath $module
        if (Test-Path $fullPath) {
            . $fullPath
        }
        else {
            Write-Warning "Profile script not found: $fullPath"
        }
    }
}

Import-ProfileModules

# Initialize oh-my-posh prompt
oh-my-posh init pwsh --eval | Invoke-Expression
