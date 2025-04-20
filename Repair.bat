@echo off
color 0A
title System Health Check Menu - by Harshal

:MENU
cls
echo ====================================================
echo              SYSTEM HEALTH CHECK MENU
echo ====================================================
echo.
echo  1. Run System File Checker (sfc /scannow)
echo  2. Run DISM RestoreHealth
echo  3. Run CHKDSK on C: Drive (requires reboot)
echo  4. Run ALL (SFC + DISM + CHKDSK)
echo  5. Exit
echo.
set /p choice=Select an option [1-5]: 

if "%choice%"=="1" goto SFC
if "%choice%"=="2" goto DISM
if "%choice%"=="3" goto CHKDSK
if "%choice%"=="4" goto ALL
if "%choice%"=="5" exit
goto MENU

:SFC
echo Running System File Checker...
sfc /scannow
echo.
pause
goto MENU

:DISM
echo Running DISM RestoreHealth...
DISM /Online /Cleanup-Image /RestoreHealth
echo.
pause
goto MENU

:CHKDSK
echo Scheduling CHKDSK on C: drive...
echo You might be prompted to restart the system.
chkdsk C: /f /r
echo.
pause
goto MENU

:ALL
echo Running SFC, DISM, and CHKDSK one after another...
echo.
echo >>> Running SFC...
sfc /scannow
echo.
echo >>> Running DISM...
DISM /Online /Cleanup-Image /RestoreHealth
echo.
echo >>> Scheduling CHKDSK on C:...
chkdsk C: /f /r
echo.
pause
goto MENU
