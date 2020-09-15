@echo off

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