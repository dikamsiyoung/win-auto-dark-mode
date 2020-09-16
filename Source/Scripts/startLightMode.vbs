Set WshShell = CreateObject("WScript.Shell" ) 
WshShell.Run chr(34) & "Batch\changeLight.bat" & Chr(34), 0 
Set WshShell = Nothing