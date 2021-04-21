# Auto Dark Mode
Turns on light or dark theme depending on the time of day.  
This script creates new Windows Tasks which edit Windows theme registry for light theme at 7am and at 8pm for dark theme.

## Importance
Light theme conserves battery life in the day with minimal brightness required to read screen contents while dark theme protects the eyes at night with lesser white screens.
Auto Dark Mode is a quick and easy way to automate the process of switching between light and dark theme in a minimal way without installing third-party applications.

## How to use
 - Download the zip and extract it to a location on your PC.
 - Edit *set_preferred_time* for your desired Light and Dark mode timing.
 - Run *install.bat* and that's all. You might want to make the few changes in the next section 😄.
 - If you change the location of the folder, please re-run the installer to update the location in Windows Task Scheduler.
 
## Note
 - To view the tasks after installation, go Task Scheduler, expand the Task Scheduler Library. You should see the **Theme Changer** folder.
 - You can set each task to _Run as soon as possible after a scheduled start is missed_ by checking the option in the **Settings** tab after double-clicking the particular task.
 - You can also uncheck the option to _Start task only if the computer is on AC power_ in the **Conditions** tab.
 - After changing the time in the script, run the installer again to update the setting in Task Scheduler. You may have to remake these changes for convenience.

## Recognized Issues
 - Transition to any mode while on battery with Transparency on is buggy in Windows 10 (as at Build 1909)
 - You have to set each task in **Theme Changer** folder to _Run as soon as possible after a scheduled start is missed_. No way to configure it from the BAT file.
 
 
