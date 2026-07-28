# Initialize zoxide if command exists
if (Get-Command zoxide -ErrorAction SilentlyContinue) {
    Invoke-Expression ((&zoxide init powershell) -join "`n")
}

# Override cd alias with zoxide
Set-Alias -Name cd -Value __zoxide_z -Option AllScope -Scope Global -Force
