$TempPath = Join-Path $env:TEMP "pwsh_completions"
if( -not (Test-Path $TempPath))
{
	New-Item -ItemType Directory $TempPath | Out-Null
}

function GenerateCompleteScript
{
	# param ([string]$commandName,[string]$outputPath)
	param ([string]$command,[string]$outputPath)
	$CommandName = ($command).Split(" ")[0].ToString()
	# if( Get-Command $CommandName){}
	if ($CommandName -eq "dotnet")
	{
		[System.Console]::OutputEncoding = [System.Text.Encoding]::UTF8
		(Invoke-Expression $command).Replace('“', "'").Replace('”', "'") | Out-File $outputPath -Force -Encoding utf8NoBOM
	} else
	{
		Invoke-Expression $command | Out-File $outputPath -Force -Encoding utf8NoBOM
	}
	Write-Debug "Completion Script Path: $outputPath"
}

function Complete
{
	param(
		[string] $command
	)
	$CompletionScriptPath = (Join-Path $TempPath "$($command.Trim().Split(" ")[0]).ps1")
	Write-Debug "Script path: $CompletionScriptPath"
	# not exist => generate
	if ( -not (Test-Path $CompletionScriptPath))
	{
		GenerateCompleteScript -command $command -outputPath $CompletionScriptPath
	} else
	{
		# exist but last modify date > 7 => generate and override
		if( ((Get-Date).AddDays(-7) -gt (Get-Item $CompletionScriptPath).LastWriteTime) -eq $true )
		{
			GenerateCompleteScript -command $command -outputPath $CompletionScriptPath
		} else
		{
			Write-Debug "Completion Script Path: $CompletionScriptPath"
		}
 }
	return $CompletionScriptPath
}

foreach ($c in @(
		"chezmoi completion powershell",
		"gh completion -s powershell",
		"dotnet completions script pwsh",
		"jj util completion power-shell"
	))
{
	Write-Debug "Loading completion script for '$c'"
	. (Complete $c)
}
