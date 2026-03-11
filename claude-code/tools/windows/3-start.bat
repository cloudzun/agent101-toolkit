@echo off
chcp 65001 >nul 2>&1
setlocal enabledelayedexpansion
cls
echo ========================================================
echo.
echo   Claude Code - Step 3: Start
echo.
echo ========================================================
echo.

:: Workspace selection
set "DEFAULT_WORKSPACE=%USERPROFILE%\my-first-project"

echo Workspace Setup
echo.
echo   A "workspace" is the folder where Claude Code writes code for you.
echo   All generated files will be saved here.
echo   Each project should have its own workspace.
echo.
echo   Default: %DEFAULT_WORKSPACE%
echo.
set /p custom_workspace="   Press Enter for default, or type a custom path: "

if "!custom_workspace!"=="" (
    set "WORKSPACE=%DEFAULT_WORKSPACE%"
) else (
    set "WORKSPACE=!custom_workspace!"
)

if not exist "!WORKSPACE!" mkdir "!WORKSPACE!"
echo.
echo [OK] Workspace ready: !WORKSPACE!
echo.
echo ========================================================
echo   Starting Claude Code...
echo   Workspace: !WORKSPACE!
echo.
echo   You can chat with it in Chinese!
echo   Try: "help me build a snake game web page"
echo ========================================================
echo.

pushd "!WORKSPACE!"
call claude
popd
pause
