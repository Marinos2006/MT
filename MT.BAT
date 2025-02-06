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
    echo Applying FPS Boost Tweaks...
    REM Disable Xbox Game Bar
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d 0 /f
    reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f
    
    REM Set High Performance Power Plan
    powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
    
    REM Disable Background Apps
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d 1 /f
    
    REM Optimize GPU Priority
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 4294967295 /f
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f
    
    echo FPS Tweaks Applied Successfully!
    pause
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
echo.
set /p apps_choice=Enter your choice: 

if "%apps_choice%"=="1" (
    cls
    echo Installing applications...
    REM Add commands to install your apps here
    pause
    goto apps_menu
)

if "%apps_choice%"=="2" (
    cls
    echo Uninstalling applications...
    REM Add commands to uninstall your apps here
    pause
    goto apps_menu
)

if "%apps_choice%"=="3" (
    goto main_menu
)

echo Invalid choice, please try again.
pause
goto apps_menu
