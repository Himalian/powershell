# Set environment variables
$env:HTTPS_PROXY = "http://127.0.0.1:2080"
$env:EDITOR = "nvim"
$env:LANG = "zh_CN.UTF-8"
$env:SHELL = "pwsh"
$env:BW_PASSWORD = (age --decrypt -i ~/.age/main ~/.secrets/bw_password.age)

