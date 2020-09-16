@echo 0ff


rem --> Obtain Admin Permission (Code provided by Eneerge sites.google.com/site/eneerge/scripts/batchgotadmin)
:: BatchGotAdmin
:-------------------------------------
rem  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

rem --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

echo Setting up Run at Logon...

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
SCHTASKS /CREATE /SC DAILY /TN "Theme Changer\Light Theme" /TR "%filepath%\Source\Scripts\changeLight.bat" /ST %arr[0]% /DU 00:30 /K
SCHTASKS /CREATE /SC DAILY /TN "Theme Changer\Dark Theme" /TR "%filepath%\Source\Scripts\changeDark.bat" /ST %arr[1]% /DU 00:30 /K

rem --> Setup Change on Logon (Requires Admin)
cd Source
call "setup.bat"

endlocal