@echo 0ff

setlocal enableextensions enabledelayedexpansion

rem --> Obtain preferred time from file
set /a count = 1
set /a list
echo %cd%
for /f %%a in ('type "set_preferred_time.txt" ^| findstr /R "[0-9]" set_preferred_time.txt') do (
  set /a count += 1
  set "list=!List! %%a"
)

rem --> Store time values inside array
set /a count = -1
for %%I in (%list%) do (
    set /a count += 1
    call set "arr[%%count%%]=%%~I"
)

rem --> Obtain shortened filepath
for %%A in ("%cd%") do set "filepath=%%~sA"

cls

rem --> Create Tasks for Light and Dark Theme
SCHTASKS /CREATE /SC DAILY /TN "Theme Changer\Light Theme" /TR "%filepath%\Source\changeLight.bat" /ST %arr[0]% /DU 00:30 /K
SCHTASKS /CREATE /SC DAILY /TN "Theme Changer\Dark Theme" /TR "%filepath%\Source\changeDark.bat" /ST %arr[1]% /DU 00:30 /K

rem --> Setup Change on Logon (Requires Admin)
cd Source
call "setup.bat"

endlocal