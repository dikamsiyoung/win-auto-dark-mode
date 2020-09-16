@echo off

rem --> Obtain shortened filepath
for %%A in ("%cd%") do set "filepath=%%~sA"

rem --> Replace scripts with original version
cd Scripts\Origin
type "autoChange.bat" > %filepath%\Scripts\autoChange.bat
type "changeLight.bat" > %filepath%\Scripts\changeLight.bat
type "changeDark.bat" > %filepath%\Scripts\changeDark.bat