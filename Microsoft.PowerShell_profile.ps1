$ProfilePath = Split-Path -Parent $PROFILE
$modules = @(
	"Initialize-Zoxide.ps1"
	"Initialize-Plugins.ps1"
	".\Initialize-Completion.ps1"
	"Set-Environment.ps1"
	"Set-Keymaps.ps1"
	"Set-Function.ps1"
	"Set-Alias.ps1"
)

# Import profile modules using dot-sourcing
foreach ($module in $modules)
{
	$ModulePath = Join-Path $ProfilePath $module
	if (Test-Path $ModulePath)
	{
		. $ModulePath
	} else
	{
		Write-Warning "Profile script not found: $ModulePath"
	}
}



# Initialize oh-my-posh prompt
oh-my-posh init pwsh --eval | Invoke-Expression

