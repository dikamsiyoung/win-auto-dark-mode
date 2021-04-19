# Auto Dark Mode
Turns on light or dark theme depending on the time of day.  
This script creates new Windows Tasks which edit Windows theme registry for light theme at 7am and at 8pm for dark theme.

## Importance
Light theme conserves battery life in the day with minimal brightness required to read screen contents while dark theme protects the eyes at night with lesser white screens.
Auto Dark Mode is a quick and easy way to automate the process of switching between light and dark theme in a minimal way without installing third-party applications.

## How to use
 - Download the zip and extract it to a location on your PC.
 - Edit *set_preferred_time* for your desired Light and Dark mode timing.
 - Run *install.bat* and that's all 🤗.
 - If you change the location of the folder, please re-run the installer to update the location in Windows Task Scheduler.
 
## Note
 - To view the tasks after installation, go Task Scheduler, expand the Task Scheduler Library, under which you should see 'Theme Changer'
 - You can set each task to 'Run as soon as possible when start is missed' in the 'Properties' windows
 - After changing the time in the script, run the installer again to update the setting in Task Scheduler

## Recognized Issues
 - Transition to any mode with Transparency on battery is buggy in Windows 10 (as of Build 1909)
 - You have to set each task in 'Theme Changer' folder to 'Run as soon as possible when start is missed'. No way to configure it from the BAT file.
 
 
