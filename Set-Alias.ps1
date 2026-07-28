# Default parameters for setting aliases
$DefaultParameters = @{
    Scope  = "Global"
    Option = "AllScope"
    Force  = $true
}

# Apply custom aliases
@(
    @{ Name = "which"; Value = "Get-Command" },
    @{ Name = "lgg"; Value = "lazygit" },
    @{ Name = "source"; Value = "Invoke-Expression" }
) | ForEach-Object {
    $Alias = $_
    Set-Alias @DefaultParameters @Alias
}
