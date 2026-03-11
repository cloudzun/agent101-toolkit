@echo off
chcp 65001 >nul 2>&1
cls
echo ========================================================
echo.
echo   OpenClaw - Step 2: Install OpenClaw
echo.
echo ========================================================
echo.
echo [WARNING] Security Notice
echo OpenClaw has permission to read, modify, and delete files on your computer.
echo Do NOT use this on a machine with company code or sensitive data!
echo Recommended: use on a personal computer or virtual machine.
echo.
echo ========================================================
echo.

set /p confirm="Understood the risks, continue? (type y and press Enter): "
if /i not "%confirm%"=="y" (
    echo Installation cancelled.
    pause
    exit /b
)

echo.
echo Installing OpenClaw (this may take 2-5 minutes)...
call npm install -g openclaw@latest --ignore-scripts
echo.

echo ========================================================
echo   [OK] OpenClaw installed successfully!
echo.
echo   Next: run "openclaw onboard" to configure.
echo   Follow the tutorial guide for step-by-step instructions.
echo ========================================================
pause
