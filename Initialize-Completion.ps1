$TempPath = Join-Path $env:TEMP "pwsh_completions"
if( -not (Test-Path $TempPath))
{
	New-Item -ItemType Directory $TempPath | Out-Null
}

function Complete
{
	param(
		[string] $command
	)
	$CommandName = ($command).Split(" ")[0].ToString()
	$CompletionScriptPath = (Join-Path $TempPath "$CommandName.ps1")
	Write-Debug "Script path: $CompletionScriptPath"
	if ( -not (Test-Path $CompletionScriptPath))
	{
		if ($CommandName -eq "dotnet")
  {
			[System.Console]::OutputEncoding = [System.Text.Encoding]::UTF8
			(Invoke-Expression $command).Replace('“', "'").Replace('”', "'") | Out-File $CompletionScriptPath
		} else
		{
			Invoke-Expression $command | Out-File $CompletionScriptPath
		}
		Write-Debug "Completion Script Path: $CompletionScriptPath"
		return $CompletionScriptPath
	} else
	{
		# last edit date > 7 => generate a new script
		if( ((Get-Date).AddDays(-7) -gt (Get-Item $CompletionScriptPath).LastWriteTime) -eq $true )
		{
			Invoke-Expression $command | Out-File $CompletionScriptPath
			Write-Debug "Completion Script Path: $CompletionScriptPath"
			return $CompletionScriptPath
		} else
		{
			Write-Debug "Completion Script Path: $CompletionScriptPath"
			return $CompletionScriptPath
		}
 }
}

foreach ($c in @(
		"chezmoi completion powershell",
		"gh completion -s powershell",
		"dotnet completions script pwsh"
	))
{
	Write-Debug "Loading completion script for '$c'"
	. (Complete $c)
}
