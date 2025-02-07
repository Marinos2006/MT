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
if /i "%username%"=="Admin" (
    if /i "%password%"=="Admin" (
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

if /i "%choice%"=="1" (
    cls
    echo Running Windows Activation Command...
    powershell -Command "irm https://get.activated.win | iex"
    pause
    goto main_menu
)

if /i "%choice%"=="2" (
    cls
    echo You are about to apply FPS Boost Tweaks.
    echo WARNING: These tweaks will modify your system settings.
    echo.
    set /p confirm=Are you sure you want to proceed? (y/n): 
    
    if /i "%confirm%"=="y" (
        echo Starting tweaks application...
        
        REM Create a system restore point
        echo Creating a system restore point...
        wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "FPS Boost Tweaks Pre-Application", 100, 7
        
        REM Open a second window to show logs
        start cmd /k "echo Applying FPS Boost Tweaks... && ^
        echo Disabling Xbox Game Bar... && ^
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d 0 /f && ^
        reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f && ^
        echo Setting High Performance Power Plan... && ^
        powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 && ^
        echo Disabling Background Apps... && ^
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d 1 /f && ^
        echo Optimizing GPU Priority... && ^
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 4294967295 /f && ^
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f && ^
        echo Disabling Superfetch (SysMain)... && ^
        sc config SysMain start= disabled && ^
        sc stop SysMain && ^
        echo Disabling Windows Search... && ^
        sc config WSearch start= disabled && ^
        sc stop WSearch && ^
        echo Disabling Telemetry... && ^
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f && ^
        echo Disabling Cortana... && ^
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f && ^
        echo Optimizing Visual Effects for Performance... && ^
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d 2 /f && ^
        echo Disabling Mouse Acceleration... && ^
        reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f && ^
        reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f && ^
        reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f && ^
        echo Disabling Nagle's Algorithm... && ^
        reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TcpAckFrequency" /t REG_DWORD /d 1 /f && ^
        reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TCPNoDelay" /t REG_DWORD /d 1 /f && ^
        echo Disabling Windows Error Reporting... && ^
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f && ^
        echo Disabling Windows Tips and Tricks... && ^
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d 0 /f && ^
        echo Disabling OneDrive... && ^
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v "DisableFileSyncNGSC" /t REG_DWORD /d 1 /f && ^
        echo Disabling Windows Ink Workspace... && ^
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace" /v "AllowWindowsInkWorkspace" /t REG_DWORD /d 0 /f && ^
        echo Disabling Windows Notifications... && ^
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /t REG_DWORD /d 0 /f && ^
        echo Disabling Windows Animation Effects... && ^
        reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f && ^
        echo FPS Tweaks Applied Successfully! && ^
        timeout /t 3 >nul && ^
        exit"
        
        echo Tweaks are being applied in the background. Check the second window for details.
    ) else (
        echo Tweaks were not applied.
    )
    pause
    goto main_menu
)

if /i "%choice%"=="3" (
    goto apps_menu
)

if /i "%choice%"=="4" (
    cls
    powershell -Command "iwr -useb https://christitus.com/win | iex"
    echo Running Chris Titus Tool...
    pause
    goto main_menu
)

if /i "%choice%"=="0" (
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
echo 1) Word
echo 2) Excel
echo 3) PowerPoint
echo 0) Back to Main Menu
echo.
set /p appchoice=Enter your choice: 

if "%appchoice%"=="1" (
    start winword.exe
    goto apps_menu
)

if "%appchoice%"=="2" (
    start excel.exe
    goto apps_menu
)

if "%appchoice%"=="3" (
    start powerpnt.exe
    goto apps_menu
)

if "%appchoice%"=="0" (
    goto main_menu
)

echo Invalid choice, please try again.
pause
goto apps_menu
