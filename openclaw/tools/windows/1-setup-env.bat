@echo off
chcp 65001 >nul 2>&1
cls
echo ========================================================
echo.
echo   OpenClaw - Step 1: Setup Environment
echo.
echo ========================================================
echo.

node -v >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Node.js is not installed.
    echo         Please download from https://nodejs.org/zh-cn/download/
    echo         After installing, close this window and run this script again.
    pause
    exit /b
)
for /f "tokens=*" %%v in ('node -v') do echo [OK] Node.js %%v

echo.
echo Configuring NPM mirror for China...
call npm config set registry https://registry.npmmirror.com/ >nul 2>&1
echo [OK] NPM registry set to npmmirror.com

echo.
echo Configuring Git HTTPS for China...
call git config --global url."https://github.com/".insteadOf "git@github.com:" >nul 2>&1
call git config --global url."https://github.com/".insteadOf "ssh://git@github.com/" >nul 2>&1
echo [OK] Git HTTPS configuration applied

echo.
echo ========================================================
echo   [OK] Environment ready! Proceed to the next step.
echo ========================================================
pause
