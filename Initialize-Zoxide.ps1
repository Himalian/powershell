# Initialize zoxide if command exists
if (Get-Command zoxide -ErrorAction SilentlyContinue)
{
	Invoke-Expression (& { (zoxide init --hook pwd powershell | Out-String) })
}

# Override cd alias with zoxide
Set-Alias -Name cd -Value __zoxide_z -Option AllScope -Scope Global -Force
