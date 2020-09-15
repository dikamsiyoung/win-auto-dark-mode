cd C:\Users\kboyz\OneDrive\Desktop\Career\DATASC~1\HOMEPR~1\DARKTH~1\AUTO-D~1\Source 
@echo off

cd ..
set /a count = 1
set "list"
setlocal enabledelayedexpansion

rem --> Extract preset time from file
for /f %%a in ('type "set_preferred_time.txt" ^| findstr /R "[0-9]" set_preferred_time.txt') do (
  set /a count += 1
  set "list=!List! %%a"
  echo !list!
  echo !count!
)
set /a count = -1
for %%I in (%list%) do (
    set /a count += 1
    call set "arr[%%count%%]=%%~I"
)

rem --> Transform preset time and current time into 24-hr format
cd Source\Scripts
set i=0
For /f "tokens=1-2 delims=/:" %%a in ("%arr[0]%") do (set morning=%%a%%b)
For /f "tokens=1-2 delims=/:" %%a in ("%arr[1]%") do (set /a evening=%%a%%b)
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set ctime=%%a%%b)

rem --> replace whitespace with 0
set ctime=%ctime: =0%

if /I "%ctime%" GEQ "%morning%" (
   if /I "%ctime%" LSS "%evening%" (
   call changeLight.bat
   echo Light Theme
   ) else (
      call changeDark.bat
      echo Dark Theme
      echo here
   )
) else (
   call changeDark.bat
   echo Dark Theme
)

endlocal
