@echo off

rem --> Delete all tasks
SCHTASKS /DELETE /TN "Theme Changer\Light Theme"
SCHTASKS /DELETE /TN "Theme Changer\Dark Theme"
SCHTASKS /DELETE /TN "Theme Changer\Change at log in"

rem --> Clean up old location in autoChange.bat
cd Source
call "reset.bat"

echo Auto-dark-mode has been uninstalled.

pause