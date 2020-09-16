@echo off

rem --> Obtain shortened filepath
for %%A in ("%cd%") do set "filepath=%%~sA"

rem --> Replace vbs scripts with original version
cd Scripts\Origin
type "autoChange.vbs" > %filepath%\Scripts\autoChange.vbs
type "startDarkMode.vbs" > %filepath%\Scripts\startDarkMode.vbs
type "startLightMode.vbs" > %filepath%\Scripts\startLightMode.vbs

rem --> Replace batch scripts with original version
cd Batch
type "changeLight.bat" > %filepath%\Scripts\Batch\changeLight.bat
type "changeDark.bat" > %filepath%\Scripts\Batch\changeDark.bat
type "autoChange.bat" > %filepath%\Scripts\Batch\autoChange.bat

