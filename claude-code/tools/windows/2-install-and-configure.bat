@echo off
chcp 65001 >nul 2>&1
cls
echo ========================================================
echo.
echo   Claude Code - Step 2: Install and Configure
echo.
echo ========================================================
echo.

:: Install Claude Code
echo Installing Claude Code (this may take 2-5 minutes)...
call npm install -g @anthropic-ai/claude-code --ignore-scripts
echo.

:: Ask for model provider
echo ========================================================
echo Select your AI provider:
echo.
echo   [1] DeepSeek
echo   [2] Kimi - China
echo   [3] Kimi - International
echo   [4] Zhipu GLM - China
echo   [5] Zhipu GLM - International
echo   [6] MiniMax - China
echo   [7] MiniMax - International
echo   [8] Qwen - China
echo   [9] Qwen - International
echo.
set /p provider="Enter number 1-9: "
echo.
set /p apikey="Paste your API Key: "

:: Setup variables
set "CLAUDE_DIR=%USERPROFILE%\.claude"
if not exist "%CLAUDE_DIR%" mkdir "%CLAUDE_DIR%"
set "SETTINGS=%CLAUDE_DIR%\settings.json"

:: Set provider-specific values
if "%provider%"=="1" (
    set "BASE_URL=https://api.deepseek.com/anthropic"
    set "TIMEOUT=600000"
    set "MODEL=deepseek-chat"
    set "FAST_MODEL=deepseek-chat"
    set "SONNET=deepseek-chat"
    set "OPUS=deepseek-chat"
    set "HAIKU=deepseek-chat"
    set "SUBAGENT="
    goto :write
)
if "%provider%"=="2" (
    set "BASE_URL=https://api.moonshot.cn/anthropic"
    set "TIMEOUT=3000000"
    set "MODEL=kimi-k2-thinking-turbo"
    set "FAST_MODEL=kimi-k2-thinking-turbo"
    set "SONNET=kimi-k2-thinking-turbo"
    set "OPUS=kimi-k2-thinking-turbo"
    set "HAIKU=kimi-k2-thinking-turbo"
    set "SUBAGENT=kimi-k2-thinking-turbo"
    goto :write
)
if "%provider%"=="3" (
    set "BASE_URL=https://api.moonshot.ai/anthropic"
    set "TIMEOUT=3000000"
    set "MODEL=kimi-k2-thinking-turbo"
    set "FAST_MODEL=kimi-k2-thinking-turbo"
    set "SONNET=kimi-k2-thinking-turbo"
    set "OPUS=kimi-k2-thinking-turbo"
    set "HAIKU=kimi-k2-thinking-turbo"
    set "SUBAGENT=kimi-k2-thinking-turbo"
    goto :write
)
if "%provider%"=="4" (
    set "BASE_URL=https://open.bigmodel.cn/api/anthropic"
    set "TIMEOUT=3000000"
    set "MODEL=glm-4.7"
    set "FAST_MODEL=glm-4.5-air"
    set "SONNET=glm-4.7"
    set "OPUS=glm-5"
    set "HAIKU=glm-4.5-air"
    set "SUBAGENT="
    goto :write
)
if "%provider%"=="5" (
    set "BASE_URL=https://api.z.ai/api/anthropic"
    set "TIMEOUT=3000000"
    set "MODEL=glm-4.7"
    set "FAST_MODEL=glm-4.5-air"
    set "SONNET=glm-4.7"
    set "OPUS=glm-5"
    set "HAIKU=glm-4.5-air"
    set "SUBAGENT="
    goto :write
)
if "%provider%"=="6" (
    set "BASE_URL=https://api.minimaxi.com/anthropic"
    set "TIMEOUT=3000000"
    set "MODEL=MiniMax-M2.5"
    set "FAST_MODEL=MiniMax-M2.5"
    set "SONNET=MiniMax-M2.5"
    set "OPUS=MiniMax-M2.5"
    set "HAIKU=MiniMax-M2.5"
    set "SUBAGENT="
    goto :write
)
if "%provider%"=="7" (
    set "BASE_URL=https://api.minimax.io/anthropic"
    set "TIMEOUT=3000000"
    set "MODEL=MiniMax-M2.5"
    set "FAST_MODEL=MiniMax-M2.5"
    set "SONNET=MiniMax-M2.5"
    set "OPUS=MiniMax-M2.5"
    set "HAIKU=MiniMax-M2.5"
    set "SUBAGENT="
    goto :write
)
if "%provider%"=="8" (
    set "BASE_URL=https://dashscope.aliyuncs.com/apps/anthropic"
    set "TIMEOUT=3000000"
    set "MODEL=qwen3.5-plus"
    set "FAST_MODEL=qwen3-coder-next"
    set "SONNET=qwen3.5-plus"
    set "OPUS=qwen3.5-plus"
    set "HAIKU=qwen3-coder-next"
    set "SUBAGENT="
    goto :write
)
if "%provider%"=="9" (
    set "BASE_URL=https://dashscope-intl.aliyuncs.com/apps/anthropic"
    set "TIMEOUT=3000000"
    set "MODEL=qwen3.5-plus"
    set "FAST_MODEL=qwen3-coder-next"
    set "SONNET=qwen3.5-plus"
    set "OPUS=qwen3.5-plus"
    set "HAIKU=qwen3-coder-next"
    set "SUBAGENT="
    goto :write
)
echo Invalid input.
pause
exit /b

:write
:: Write settings.json line by line using delayed expansion
setlocal enabledelayedexpansion
echo {> "%SETTINGS%"
echo   "env": {>> "%SETTINGS%"
echo     "ANTHROPIC_BASE_URL": "!BASE_URL!",>> "%SETTINGS%"
echo     "ANTHROPIC_AUTH_TOKEN": "!apikey!",>> "%SETTINGS%"
echo     "API_TIMEOUT_MS": "!TIMEOUT!",>> "%SETTINGS%"
echo     "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1",>> "%SETTINGS%"
echo     "ANTHROPIC_MODEL": "!MODEL!",>> "%SETTINGS%"
echo     "ANTHROPIC_SMALL_FAST_MODEL": "!FAST_MODEL!",>> "%SETTINGS%"
echo     "ANTHROPIC_DEFAULT_SONNET_MODEL": "!SONNET!",>> "%SETTINGS%"
echo     "ANTHROPIC_DEFAULT_OPUS_MODEL": "!OPUS!",>> "%SETTINGS%"
if "!SUBAGENT!"=="" (
    echo     "ANTHROPIC_DEFAULT_HAIKU_MODEL": "!HAIKU!">> "%SETTINGS%"
) else (
    echo     "ANTHROPIC_DEFAULT_HAIKU_MODEL": "!HAIKU!",>> "%SETTINGS%"
    echo     "CLAUDE_CODE_SUBAGENT_MODEL": "!SUBAGENT!">> "%SETTINGS%"
)
echo   }>> "%SETTINGS%"
echo }>> "%SETTINGS%"
endlocal

echo Done! Settings saved to: %SETTINGS%

:: Bypass onboarding
set "CLAUDE_JSON=%USERPROFILE%\.claude.json"
if not exist "%CLAUDE_JSON%" (
    echo {"hasCompletedOnboarding": true}> "%CLAUDE_JSON%"
)

echo Onboarding bypass configured.
echo.
echo ========================================================
echo   Configuration complete!
echo   Run the next script to start your AI coding assistant.
echo ========================================================
pause
