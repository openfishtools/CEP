@echo off
setlocal
title OpenFishTools - Fast Deploy

set "SOURCE=%~dp0..\.."
for %%I in ("%SOURCE%") do set "SOURCE=%%~fI"

set "TARGET=%APPDATA%\Adobe\CEP\extensions\OpenFishTools"
set "OLD_ADMIN_DIR=%ProgramFiles(x86)%\Common Files\Adobe\CEP\extensions\OpenFishTools"

echo ========================================
echo   OpenFishTools - Ultra Fast Deploy
echo ========================================
echo Source: %SOURCE%
echo Target: %TARGET%
echo.

:: Check for old installation in system/admin AE folder
if exist "%OLD_ADMIN_DIR%" (
    echo [!] Old OpenFishTools installation found in admin folder:
    echo     %OLD_ADMIN_DIR%
    choice /C YN /M "Delete old installation from admin folder (will request Admin permission)?"
    if not errorlevel 2 (
        powershell -NoProfile -Command "Start-Process cmd -Verb RunAs -Wait -WindowStyle Hidden -ArgumentList '/c rmdir /s /q ""%OLD_ADMIN_DIR%""'" >nul 2>&1
    )
    echo.
)

:: Ensure PlayerDebugMode is enabled (HKCU - no admin required)
for %%i in (7 8 9 10 11 12 13 14 15 16) do (
    reg add "HKCU\Software\Adobe\CSXS.%%i" /v "PlayerDebugMode" /t REG_SZ /d "1" /f >nul 2>&1
    reg add "HKCU\Software\Wow6432Node\Adobe\CSXS.%%i" /v "PlayerDebugMode" /t REG_SZ /d "1" /f >nul 2>&1
)

if not exist "%APPDATA%\Adobe\CEP\extensions" (
    mkdir "%APPDATA%\Adobe\CEP\extensions" 2>nul
)

:: Sync directories using robocopy (Multi-threaded & ultra-fast)
robocopy "%SOURCE%\CSXS" "%TARGET%\CSXS" /E /IS /IT /MT:8 /NJH /NJS /NDL /NC /NS >nul
robocopy "%SOURCE%\client" "%TARGET%\client" /E /IS /IT /MT:8 /NJH /NJS /NDL /NC /NS >nul
robocopy "%SOURCE%\host" "%TARGET%\host" /E /IS /IT /MT:8 /NJH /NJS /NDL /NC /NS >nul

if exist "%SOURCE%\data" (
    robocopy "%SOURCE%\data" "%TARGET%\data" /E /IS /IT /MT:8 /NJH /NJS /NDL /NC /NS >nul
)

if exist "%SOURCE%\Logo.svg" (
    copy /y "%SOURCE%\Logo.svg" "%TARGET%\Logo.svg" >nul 2>&1
)

if exist "%SOURCE%\.debug" (
    copy /y "%SOURCE%\.debug" "%TARGET%\.debug" >nul 2>&1
)

echo [OK] Fast deploy completed successfully!
echo Reload the OpenFishTools panel in After Effects to apply.
echo.
timeout /t 2 >nul
exit /b 0
