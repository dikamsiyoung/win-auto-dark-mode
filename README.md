# Windows Dark Mode Changer
Turns on light or dark theme depending on the time of day. 
It creates new Windows Tasks which runs the edits the Windows theme registry at 7am for light theme and 8pm for dark theme.

It's a quick and easy way for people who don't want to install additional applications on their PCs.

## How to use
 - Open *install.bat* and edit the start time (after '/ST') of both Light and Dark theme to your preference.
 - Run *install.bat*. That's all.
 - To manually change the theme, run *changeLight.bat* or *changeDark.bat*
 
## Note
 To view the tasks after installation, go Task Scheduler, expand the Task Scheduler Library, under which you should see 'Theme Changer'
 
 You can set the tasks to 'Run as soon as possible when start is missed' in the Settings submenu.
 
 
