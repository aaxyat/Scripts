@echo off
setlocal

set "baseDir=%LOCALAPPDATA%"
set "prefix=fPoeSmoother.exe"

for /r "%baseDir%" /d %%A in ("%prefix%*") do (
    echo Taking ownership of: "%%~fA"
    takeown /F "%%~fA" /R /D Y >nul
    echo Changing permissions for: "%%~fA"
    icacls "%%~fA" /grant:r "%username%":F /T /C /Q >nul
    echo Deleting: "%%~fA"
    rd /s /q "%%~fA"
)

echo Searching for: fPoeSmoother.exe
for /f "delims=" %%A in ('dir "E:\POE Files\FREE_PoeSmoother*" /b /ad-h /o-d') do (
    set "exePath=E:\POE Files\%%A\fPoeSmoother.exe"
    goto :break
)
:break
echo Running: %exePath%
start "" "%exePath%"

endlocal
