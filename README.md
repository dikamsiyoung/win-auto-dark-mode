# Auto Dark Mode
Turns on light or dark theme depending on the time of day.  
This script creates new Windows Tasks which edits Windows theme registry for light theme at 7am and at 8pm for dark theme.

## Importance
Light theme conserves battery life in the day with minimal brightness required to read screen contents while dark theme protects the eyes at night with lesser white screens.
Auto Dark Mode is a quick and easy way to automate the process of switching between light and dark theme in a minimal way without additional third-party applications.

## How to use
 - Download the zip and extract it to a location on your PC. The scripts need to remain in that location after installation.
 - Edit *set_preferred_time* for your desired Light and Dark mode timing.
 - Run *install.bat*. That's all.
 
## Note
 - To view the tasks after installation, go Task Scheduler, expand the Task Scheduler Library, under which you should see 'Theme Changer'
 - You can set each task to 'Run as soon as possible when start is missed' in the 'Properties' windows
 - When changing the time, run the installer again to update the setting in Task Scheduler
 
 
