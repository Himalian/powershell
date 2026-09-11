
function Enable-Proxy
{
	$env:HTTPS_PROXY="127.0.0.1:2080"
	$env:HTTP_PROXY="127.0.0.1:2080"
}

function Disable-Proxy
{
	$env:HTTPS_PROXY = ""
	$env:HTTP_PROXY = ""
}

function bwn
{
	$env:BW_SESSION = (bw unlock --raw --passwordenv BW_PASSWORD)
	Write-Output "BitWarden session unlocked"

}

function expo
{ 
	if ($env:OS -eq "Windows_NT")
	{
		Start-Process .
	}
}
