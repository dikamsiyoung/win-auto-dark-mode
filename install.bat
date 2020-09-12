@echo 0ff

SCHTASKS /CREATE /SC DAILY /TN "Theme Changer\Light Theme" /TR "%CD%\Source\changeLight.bat" /ST 07:00 /DU 00:30 /K
SCHTASKS /CREATE /SC DAILY /TN "Theme Changer\Dark Theme" /TR "%CD%\Source\changeDark.bat" /ST 20:00 /DU 00:30 /K

echo Auto-dark-mode has been installed successfully!

pause