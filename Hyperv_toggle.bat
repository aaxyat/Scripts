@echo off
:: Check if the script is running as administrator
NET SESSION >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo This script must be run as an administrator! 
    :: Try to relaunch the script with administrative privileges
    powershell -Command "Start-Process cmd -ArgumentList '/C %~f0' -Verb RunAs"
    EXIT /B
)

:: Check if Hyper-V is enabled
FOR /F "tokens=* USEBACKQ" %%F IN (`powershell.exe "(Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V).State"`) DO (
    SET "hyperVStatus=%%F"
)
echo Current status of Hyper-V: %hyperVStatus%

:: Ask the user if they want to toggle the status
SET /P _input=Do you want to toggle the status of Hyper-V? [Y/N] 
IF /I "%_input%"=="Y" (
    IF "%hyperVStatus%"=="Enabled" (
        :: Disable Hyper-V
        powershell.exe "Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -NoRestart"
    ) ELSE (
        :: Enable Hyper-V
        powershell.exe "Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -NoRestart"
    )
    :: Restart the system
    shutdown.exe /r /t 0
) ELSE IF /I "%_input%"=="N" (
    :: Stop the script
    echo Stopping the script as per user's request.
    PAUSE
)
