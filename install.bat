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

rem --> Create Auto Change task
SCHTASKS /CREATE /TN "Theme Changer\Change at log in" /TR "%filepath%\Source\Scripts\autoChange.bat" /SC ONLOGON /ru %username% /it

rem --> Clear old address in autoChange.bat
cd Source
call "reset.bat"

cd ..

rem --> Copy current address to autoChange.bat because it runs as Admin
echo rem "Batch is called with Admin rights and needs to be routed back to Source folder" > dir.txt
echo cd %filepath% >> dir.txt
type autoChange.bat >> dir.txt
del /f autoChange.bat
type dir.txt > autoChange.bat
del /f dir.txt

rem --> Copy current address to changeLight.bat
echo rem "Batch is called with Admin rights and needs to be routed back to Source folder" > dir.txt
echo cd %filepath% >> dir.txt
type changeLight.bat >> dir.txt
del /f changeLight.bat
type dir.txt > changeLight.bat
del /f dir.txt

rem --> Copy current address to changeDark.bat
echo rem "Batch is called with Admin rights and needs to be routed back to Source folder" > dir.txt
echo cd %filepath% >> dir.txt
type changeDark.bat >> dir.txt
del /f changeDark.bat
type dir.txt > changeDark.bat
del /f dir.txt

echo Auto-dark-mode has been installed successfully!

endlocal

pause