@echo off
setlocal

:: --------------------------------------------
:: OpenFishTools - User CEP Deploy (No Admin)
:: --------------------------------------------

set "SOURCE=%~dp0..\.."
for %%I in ("%SOURCE%") do set "SOURCE=%%~fI"

set "TARGET=%APPDATA%\Adobe\CEP\extensions\OpenFishTools"
set "OLD_ADMIN_DIR=%ProgramFiles(x86)%\Common Files\Adobe\CEP\extensions\OpenFishTools"

echo ========================================
echo   OpenFishTools - User CEP Deploy
echo ========================================
echo.

:: Check for old installation in system/admin AE folder
if exist "%OLD_ADMIN_DIR%" (
    echo [!] Old OpenFishTools installation found in admin folder:
    echo     %OLD_ADMIN_DIR%
    echo.
    choice /C YN /M "Delete old installation from admin folder (will request Admin permission)?"
    if not errorlevel 2 (
        echo     Requesting administrator permission to remove old admin folder...
        powershell -NoProfile -Command "Start-Process cmd -Verb RunAs -Wait -WindowStyle Hidden -ArgumentList '/c rmdir /s /q ""%OLD_ADMIN_DIR%""'" >nul 2>&1
        if exist "%OLD_ADMIN_DIR%" (
            echo     [WARNING] Could not remove old admin folder automatically.
        ) else (
            echo     [OK] Old admin folder removed.
        )
    ) else (
        echo     Skipped removing old admin folder.
    )
    echo.
)

:: 1. PlayerDebugMode for CEP 7-16 (CC 2017 - CC 2027+, HKCU only - No Admin)
echo [1/3] Enabling PlayerDebugMode (HKCU)...
for %%i in (7 8 9 10 11 12 13 14 15 16) do (
    reg add "HKCU\Software\Adobe\CSXS.%%i" /v "PlayerDebugMode" /t REG_SZ /d "1" /f >nul 2>&1
    reg add "HKCU\Software\Wow6432Node\Adobe\CSXS.%%i" /v "PlayerDebugMode" /t REG_SZ /d "1" /f >nul 2>&1
)
echo       [OK] PlayerDebugMode enabled for CSXS 7-16.
echo.

:: 2. Cleanup old user folder
echo [2/3] Cleaning old user version...
if exist "%TARGET%" (
    rd /s /q "%TARGET%" 2>nul
)
echo       [OK] Cleanup completed.
echo.

:: 3. Deploy fresh files to User CEP
echo [3/3] Copying files to User CEP...
if not exist "%APPDATA%\Adobe\CEP\extensions" (
    mkdir "%APPDATA%\Adobe\CEP\extensions" 2>nul
)
mkdir "%TARGET%" 2>nul

xcopy "%SOURCE%\CSXS" "%TARGET%\CSXS\" /E /I /Y /Q >nul
xcopy "%SOURCE%\client" "%TARGET%\client\" /E /I /Y /Q >nul
xcopy "%SOURCE%\host" "%TARGET%\host\" /E /I /Y /Q >nul

if exist "%SOURCE%\data" (
    xcopy "%SOURCE%\data" "%TARGET%\data\" /E /I /Y /Q >nul
)

if exist "%SOURCE%\Logo.svg" (
    copy /y "%SOURCE%\Logo.svg" "%TARGET%\Logo.svg" >nul 2>&1
)

if exist "%SOURCE%\.debug" (
    copy /y "%SOURCE%\.debug" "%TARGET%\.debug" >nul 2>&1
)

echo       [OK] All files successfully deployed!
echo.
echo ========================================
echo   Deploy Complete!
echo   Location: %TARGET%
echo ========================================
echo.
echo Launch Adobe After Effects and open:
echo   Window ^> Extensions ^> Fish Tools
echo.
pause
exit /b 0
