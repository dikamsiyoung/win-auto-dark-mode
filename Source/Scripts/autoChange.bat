@echo off

cd ..
set /a count = 1
set "list"
setlocal enabledelayedexpansion
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

cd Source\Scripts
For /f "tokens=1-2 delims=/:" %%a in ("%arr[0]%") do (set morning=%%a%%b)
For /f "tokens=1-2 delims=/:" %%a in ("%arr[1]%") do (set /a evening=%%a%%b)
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set /a ctime=%%a%%b)

if /I "%ctime%" GEQ "%morning%" (
   if /I "%ctime%" LSS "%evening%" (
   call changeLight.bat
   echo Light Theme
   ) else (
      call changeDark.bat
      echo Dark Theme
   )
) else (
   call changeDark.bat
   echo Dark Theme
)

endlocal
