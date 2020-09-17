Dim filepath 
filepath = "C:\Users\kboyz\OneDrive\Desktop\Career\DATASC~1\HOMEPR~1\DARKTH~1\AUTO-D~1\Source\Scripts\Batch\changeLight.bat" 

Set WshShell = CreateObject("WScript.Shell" ) 
WshShell.Run chr(34) & filepath & Chr(34), 0 
Set WshShell = Nothing