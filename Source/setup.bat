@echo off

rem --> Obtain shortened filepath
for %%A in ("%cd%") do set "filepath=%%~sA"
  
rem --> Create Auto Change task
SCHTASKS /CREATE /TN "Theme Changer\Change at log in" /TR "%filepath%\Scripts\autoChange.bat" /SC ONLOGON /ru %username% /it

rem --> Clear old address in autoChange.bat
call "reset.bat"

cd ..

rem --> Copy current address to autoChange.bat because it runs as Admin
echo rem "Batch is called with Admin rights and needs to be routed back to Source folder" > dir.txt
echo cd %filepath% >> dir.txt
type autoChange.bat >> dir.txt
del /f autoChange.bat
type dir.txt > autoChange.bat
del /f dir.txt

echo Auto-dark-mode has been installed successfully!

endlocal

pause