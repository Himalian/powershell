# Set prediction source to history
Set-PSReadLineOption -PredictionSource History

# Move cursor to the end of line when searching history
Set-PSReadLineOption -HistorySearchCursorMovesToEnd

# Set Tab key for menu completion and Intellisense
Set-PSReadLineKeyHandler -Key "Tab" -Function MenuComplete

# Set Ctrl+d to exit PowerShell
Set-PSReadLineKeyHandler -Key "Ctrl+d" -Function ViExit

# Set Ctrl+z to undo
Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo

# Set UpArrow to search history backward
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward

# Set DownArrow to search history forward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
