@echo off

rem --> Obtain shortened filepath
for %%A in ("%cd%") do set "filepath=%%~sA"

rem --> Replace scripts with original version
cd Scripts\Origin
type "autoChange.bat" > %filepath%\Scripts\Batch\autoChange.bat
type "autoChange.vbs" > %filepath%\Scripts\autoChange.vbs
type "changeLight.bat" > %filepath%\Scripts\Batch\changeLight.bat
type "startLightMode.vbs" > %filepath%\Scripts\startLightMode.vbs
type "changeDark.bat" > %filepath%\Scripts\Batch\changeDark.bat
type "startDarkMode.vbs" > %filepath%\Scripts\startDarkMode.vbs
