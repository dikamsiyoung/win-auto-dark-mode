@echo off

rem --> Obtain shortened filepath
for %%A in ("%cd%") do set "filepath=%%~sA"

rem --> Replace scripts with original version
cd Scripts\Origin
type "autoChange.bat" > %filepath%\Scripts\Batch\autoChange.bat
type "changeLight.bat" > %filepath%\Scripts\Batch\changeLight.bat
type "changeDark.bat" > %filepath%\Scripts\Batch\changeDark.bat