@echo off
chcp 65001 >nul

:: Enable ANSI escape codes
REG ADD HKCU\CONSOLE /f /v VirtualTerminalLevel /t REG_DWORD /d 1

:: Check for administrator permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

:: If error level is not 0, request administrator privileges
if '%errorlevel%' NEQ '0' (
    echo Requesting administrator access...
    powershell -Command "Start-Process '%~dpnx0' -Verb RunAs"
    exit /b
)

Title KingMaref All In One Tool
mode con: cols=100 lines=35
color 0A

:: Login Section
:login_prompt
cls
echo ====================================================================================================
echo.                                                                                
echo    ███╗   ███╗██╗   ██╗██╗  ████████╗██╗    ████████╗ ██████╗  ██████╗ ██╗                       
echo    ████╗ ████║██║   ██║██║  ╚══██╔══╝██║    ╚══██╔══╝██╔═══██╗██╔═══██╗██║                       
echo    ██╔████╔██║██║   ██║██║     ██║   ██║       ██║   ██║   ██║██║   ██║██║                       
echo    ██║╚██╔╝██║██║   ██║██║     ██║   ██║       ██║   ██║   ██║██║   ██║██║                       
echo    ██║ ╚═╝ ██║╚██████╔╝███████╗██║   ██║       ██║   ╚██████╔╝╚██████╔╝███████╗                  
echo    ╚═╝     ╚═╝ ╚═════╝ ╚══════╝╚═╝   ╚═╝       ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝                  
                                                                                     
                                                                                       
echo    ██████╗ ██╗   ██╗    ██╗  ██╗██╗███╗   ██╗ ██████╗ ███╗   ███╗ █████╗ ██████╗ ███████╗███████╗
echo    ██╔══██╗╚██╗ ██╔╝    ██║ ██╔╝██║████╗  ██║██╔════╝ ████╗ ████║██╔══██╗██╔══██╗██╔════╝██╔════╝
echo    ██████╔╝ ╚████╔╝     █████╔╝ ██║██╔██╗ ██║██║  ███╗██╔████╔██║███████║██████╔╝█████╗  █████╗  
echo    ██╔══██╗  ╚██╔╝      ██╔═██╗ ██║██║╚██╗██║██║   ██║██║╚██╔╝██║██╔══██║██╔══██╗██╔══╝  ██╔══╝  
echo    ██████╔╝   ██║       ██║  ██╗██║██║ ╚████║╚██████╔╝██║ ╚═╝ ██║██║  ██║██║  ██║███████╗██║     
echo    ╚═════╝    ╚═╝       ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝   
echo.                                                                                  
echo ====================================================================================================
echo.
set /p username=Enter Username: 
for /f "delims=" %%p in ('powershell -Command "$p = Read-Host 'Enter Password' -AsSecureString; [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($p))"') do set password=%%p

:: Set your username and password here (case-sensitive)
mode con: cols=100 lines=35
if "%username%"=="Admin" (
    if "%password%"=="Admin" (
        goto main_menu
    ) else (
        echo Incorrect password! Access denied.
        pause
        goto login_prompt
    )
) else (
    echo Incorrect username! Access denied.
    pause
    goto login_prompt
)

:main_menu
cls
echo ====================================================================================================
echo.                                                                                
echo    ███╗   ███╗██╗   ██╗██╗  ████████╗██╗    ████████╗ ██████╗  ██████╗ ██╗                       
echo    ████╗ ████║██║   ██║██║  ╚══██╔══╝██║    ╚══██╔══╝██╔═══██╗██╔═══██╗██║                       
echo    ██╔████╔██║██║   ██║██║     ██║   ██║       ██║   ██║   ██║██║   ██║██║                       
echo    ██║╚██╔╝██║██║   ██║██║     ██║   ██║       ██║   ██║   ██║██║   ██║██║                       
echo    ██║ ╚═╝ ██║╚██████╔╝███████╗██║   ██║       ██║   ╚██████╔╝╚██████╔╝███████╗                  
echo    ╚═╝     ╚═╝ ╚═════╝ ╚══════╝╚═╝   ╚═╝       ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝                  
                                                                                     
                                                                                       
echo    ██████╗ ██╗   ██╗    ██╗  ██╗██╗███╗   ██╗ ██████╗ ███╗   ███╗ █████╗ ██████╗ ███████╗███████╗
echo    ██╔══██╗╚██╗ ██╔╝    ██║ ██╔╝██║████╗  ██║██╔════╝ ████╗ ████║██╔══██╗██╔══██╗██╔════╝██╔════╝
echo    ██████╔╝ ╚████╔╝     █████╔╝ ██║██╔██╗ ██║██║  ███╗██╔████╔██║███████║██████╔╝█████╗  █████╗  
echo    ██╔══██╗  ╚██╔╝      ██╔═██╗ ██║██║╚██╗██║██║   ██║██║╚██╔╝██║██╔══██║██╔══██╗██╔══╝  ██╔══╝  
echo    ██████╔╝   ██║       ██║  ██╗██║██║ ╚████║╚██████╔╝██║ ╚═╝ ██║██║  ██║██║  ██║███████╗██║     
echo    ╚═════╝    ╚═╝       ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  
echo.                                                                                  
echo ====================================================================================================
echo.
echo 1. Windows Activate, Office and Editions
echo 2. Boost FPS Tweaks
echo 3. APPS
echo 4. Chris Titus Tool
echo 0. EXIT
echo.
set /p choice=Enter your choice: 

if "%choice%"=="1" (
    cls
    echo Running Windows Activation Command...
    powershell -Command "irm https://get.activated.win | iex"
    pause
    goto main_menu
)

if "%choice%"=="2" (
cls
echo ==============================================
echo FPS Boost Tweaks Application
echo ==============================================
echo WARNING: This script will modify system settings.
echo A system restore point will be created automatically.
echo ==============================================
echo.

REM Prompt for user confirmation
:confirm
set /p apply_tweaks="Do you want to apply FPS boost tweaks? (Y/N): "
if /i "%apply_tweaks%"=="Y" goto apply_tweaks
if /i "%apply_tweaks%"=="N" (
    echo Tweaks were not applied. Exiting...
    pause
    goto end
)
echo Invalid input. Please confirm again!
goto confirm

:apply_tweaks
REM Create a System Restore Point
echo Creating a system restore point...
wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "FPS Boost Tweaks Restore Point", 100, 7
if %errorlevel% equ 0 (
    echo System restore point created successfully!
) else (
    echo Failed to create a system restore point. Proceed with caution.
)
echo.

REM Ensure Ultimate Performance power plan is available and active
echo Checking for Ultimate Performance power plan...
powercfg /list | find "Ultimate Performance" >nul 2>&1
if %errorlevel% equ 0 (
    echo Ultimate Performance plan is available.
) else (
    echo Ultimate Performance plan is not available. Adding it now...
    powercfg /duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1
    if %errorlevel% equ 0 (
        echo Ultimate Performance plan added successfully.
    ) else (
        echo Failed to add Ultimate Performance plan.
        echo This plan is only available on Windows 10/11 Pro for Workstations or Enterprise.
        pause
        goto end
    )
)

REM Set Ultimate Performance as the active power plan
echo Setting Ultimate Performance as the active power plan...
powercfg /setactive e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1
if %errorlevel% equ 0 (
    echo Ultimate Performance plan set successfully.
) else (
    echo Failed to set Ultimate Performance plan.
    echo Please check if your Windows edition supports Ultimate Performance.
    pause
    goto end
)

REM Verify the active power plan
for /f "tokens=*" %%i in ('powercfg /getactivescheme') do set activeScheme=%%i
echo Active Power Plan: %activeScheme%

if "%activeScheme%"=="Power Scheme GUID: e9a42b02-d5df-448d-aa00-03f14749eb61  (Ultimate Performance)" (
    echo Ultimate Performance power plan is now active.
) else (
    echo Failed to set Ultimate Performance power plan.
    echo Please ensure the Ultimate Performance plan is available on your system.
)

REM Apply FPS Boost Tweaks
echo Applying FPS Boost Tweaks...

REM Disable Xbox Game Bar
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f
echo - Disabled Xbox Game Bar and Game DVR.

REM Disable Background Apps
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d 1 /f
echo - Disabled background apps.

REM Optimize GPU Priority
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 4294967295 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f
echo - Optimized GPU priority for gaming.

REM Disable Nagle's Algorithm for Lower Latency
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TcpAckFrequency" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TCPNoDelay" /t REG_DWORD /d 1 /f
echo - Disabled Nagle's Algorithm for lower network latency.

REM Disable Mouse Acceleration for Better Precision
reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f
reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f
reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f
echo - Disabled mouse acceleration for better precision.

REM Disable Windows Animations and Visual Effects
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "DragFullWindows" /t REG_SZ /d "0" /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "UserPreferencesMask" /t REG_BINARY /d "90320780100000" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d 3 /f
echo - Disabled Windows animations and visual effects.

REM Optimize Processor Scheduling for Background Services
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 26 /f
echo - Optimized processor scheduling for background services.

REM Disable HPET (High Precision Event Timer) for Lower Latency
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time\TimeProviders\NtpClient" /v "Enabled" /t REG_DWORD /d 0 /f
bcdedit /deletevalue useplatformclock
echo - Disabled HPET for lower input latency.

REM Disable Core Parking for Better CPU Utilization
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMin" /t REG_DWORD /d 0 /f
echo - Disabled core parking for better CPU utilization.

REM Optimize Windows Search for Gaming
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Search" /v "SetupCompletedSuccessfully" /t REG_DWORD /d 0 /f
sc config "WSearch" start= disabled
echo - Disabled Windows Search to reduce background usage.

REM Display Summary of Applied Tweaks
echo.
echo ==============================================
echo FPS Boost Tweaks Applied Successfully!
echo ==============================================
echo Summary of Changes:
echo 1. Disabled Xbox Game Bar and Game DVR.
echo 2. Set power plan to Ultimate Performance.
echo 3. Disabled background apps.
echo 4. Optimized GPU priority for gaming.
echo 5. Disabled Nagle's Algorithm for lower network latency.
echo 6. Disabled mouse acceleration for better precision.
echo 7. Disabled Windows animations and visual effects.
echo 8. Optimized processor scheduling for background services.
echo 9. Disabled HPET for lower input latency.
echo 10. Disabled core parking for better CPU utilization.
echo 11. Disabled Windows Search to reduce background usage.
echo ==============================================
echo A system restore point was created before making changes.
echo You can revert to this restore point if needed.
echo ==============================================
echo.
pause
goto end

:end
goto main_menu
)

if "%choice%"=="3" (
    goto apps_menu
)

if "%choice%"=="4" (
    cls
    powershell -Command "iwr -useb https://christitus.com/win | iex"
    echo Running Chris Titus Tool...
    pause
    goto main_menu
)

if "%choice%"=="0" (
    cls
    echo Are you sure you want to exit? (y/n)
    set /p exit_confirm=Enter your choice: 
    if /i "%exit_confirm%"=="y" (
        exit
    ) else (
        goto main_menu
    )
    exit
)

echo Invalid choice, please try again.
pause
goto main_menu

:apps_menu
cls
echo ====================================================================================================
echo.                                                                                  
echo    ███╗   ███╗██╗   ██╗██╗  ████████╗██╗    ████████╗ ██████╗  ██████╗ ██╗                       
echo    ████╗ ████║██║   ██║██║  ╚══██╔══╝██║    ╚══██╔══╝██╔═══██╗██╔═══██╗██║                       
echo    ██╔████╔██║██║   ██║██║     ██║   ██║       ██║   ██║   ██║██║   ██║██║                       
echo    ██║╚██╔╝██║██║   ██║██║     ██║   ██║       ██║   ██║   ██║██║   ██║██║                       
echo    ██║ ╚═╝ ██║╚██████╔╝███████╗██║   ██║       ██║   ╚██████╔╝╚██████╔╝███████╗                  
echo    ╚═╝     ╚═╝ ╚═════╝ ╚══════╝╚═╝   ╚═╝       ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝                  
                                                                                     
                                                                                       
echo    ██████╗ ██╗   ██╗    ██╗  ██╗██╗███╗   ██╗ ██████╗ ███╗   ███╗ █████╗ ██████╗ ███████╗███████╗
echo    ██╔══██╗╚██╗ ██╔╝    ██║ ██╔╝██║████╗  ██║██╔════╝ ████╗ ████║██╔══██╗██╔══██╗██╔════╝██╔════╝
echo    ██████╔╝ ╚████╔╝     █████╔╝ ██║██╔██╗ ██║██║  ███╗██╔████╔██║███████║██████╔╝█████╗  █████╗  
echo    ██╔══██╗  ╚██╔╝      ██╔═██╗ ██║██║╚██╗██║██║   ██║██║╚██╔╝██║██╔══██║██╔══██╗██╔══╝  ██╔══╝  
echo    ██████╔╝   ██║       ██║  ██╗██║██║ ╚████║╚██████╔╝██║ ╚═╝ ██║██║  ██║██║  ██║███████╗██║     
echo    ╚═════╝    ╚═╝       ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  
echo.                                                                                  
echo ====================================================================================================
echo.
echo 1. Install Applications
echo 2. Uninstall Applications
echo 3. Exit to Main Menu
echo 1) Word
echo 2) Excel
echo 3) PowerPoint
echo 0) Back to Main Menu
echo.
set /p apps_choice=Enter your choice: 
set /p appchoice=Enter your choice: 

if "%apps_choice%"=="1" (
    cls
    echo Installing applications...
    REM Add commands to install your apps here
    pause
if "%appchoice%"=="1" (
    start winword.exe
    goto apps_menu
)

if "%apps_choice%"=="2" (
    cls
    echo Uninstalling applications...
    REM Add commands to uninstall your apps here
    pause
if "%appchoice%"=="2" (
    start excel.exe
    goto apps_menu
)
if "%appchoice%"=="3" (
    start powerpnt.exe
    goto apps_menu
)

if "%apps_choice%"=="3" (
if "%appchoice%"=="0" (
    goto main_menu
)

echo Invalid choice, please try again.
pause
goto apps_menu
