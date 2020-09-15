@echo off

rem --> Obtain shortened filepath
for %%A in ("%cd%") do set "filepath=%%~sA"

rem --> Replace autoChange.bat with original version
cd Scripts\Origin
type "autoChange.bat" > %filepath%\Scripts\autoChange.bat