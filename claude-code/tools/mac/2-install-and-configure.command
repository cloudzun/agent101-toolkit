#!/bin/bash
clear
echo "========================================================"
echo ""
echo "  🧠 Claude Code 之路 · 第二步：安装并配置"
echo ""
echo "========================================================"
echo ""

# --- Install Claude Code ---
echo "⚙️  正在安装 Claude Code (可能需要 2-5 分钟)..."
sudo npm install -g @anthropic-ai/claude-code --ignore-scripts 2>&1 | tail -3
echo ""

# --- Ask for model provider ---
echo "========================================================"
echo "选择你的 AI 大脑："
echo ""
echo "  [1] DeepSeek"
echo "  [2] Kimi（国内版）"
echo "  [3] Kimi（海外版）"
echo "  [4] 智谱（国内版）"
echo "  [5] 智谱（海外版）"
echo "  [6] MiniMax（国内版）"
echo "  [7] MiniMax（海外版）"
echo "  [8] 通义千问 Qwen（国内版）"
echo "  [9] 通义千问 Qwen（海外版）"
echo ""
read -p "请输入数字 (1-9): " provider
echo ""
read -p "请粘贴你的 API Key: " apikey

# --- Build per-provider settings.json ---
mkdir -p "$HOME/.claude"

case "$provider" in
    1)
        # DeepSeek — 官方文档: api-docs.deepseek.com
        cat > "$HOME/.claude/settings.json" << EOF
{
  "env": {
    "ANTHROPIC_BASE_URL": "https://api.deepseek.com/anthropic",
    "ANTHROPIC_AUTH_TOKEN": "$apikey",
    "API_TIMEOUT_MS": "600000",
    "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1",
    "ANTHROPIC_MODEL": "deepseek-chat",
    "ANTHROPIC_SMALL_FAST_MODEL": "deepseek-chat",
    "ANTHROPIC_DEFAULT_SONNET_MODEL": "deepseek-chat",
    "ANTHROPIC_DEFAULT_OPUS_MODEL": "deepseek-chat",
    "ANTHROPIC_DEFAULT_HAIKU_MODEL": "deepseek-chat"
  }
}
EOF
        ;;
    2)
        # Kimi 国内版 — 官方文档: platform.moonshot.cn
        cat > "$HOME/.claude/settings.json" << EOF
{
  "env": {
    "ANTHROPIC_BASE_URL": "https://api.moonshot.cn/anthropic",
    "ANTHROPIC_AUTH_TOKEN": "$apikey",
    "API_TIMEOUT_MS": "3000000",
    "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1",
    "ANTHROPIC_MODEL": "kimi-k2-thinking-turbo",
    "ANTHROPIC_SMALL_FAST_MODEL": "kimi-k2-thinking-turbo",
    "ANTHROPIC_DEFAULT_SONNET_MODEL": "kimi-k2-thinking-turbo",
    "ANTHROPIC_DEFAULT_OPUS_MODEL": "kimi-k2-thinking-turbo",
    "ANTHROPIC_DEFAULT_HAIKU_MODEL": "kimi-k2-thinking-turbo",
    "CLAUDE_CODE_SUBAGENT_MODEL": "kimi-k2-thinking-turbo"
  }
}
EOF
        ;;
    3)
        # Kimi 海外版 — 官方文档: platform.moonshot.ai
        cat > "$HOME/.claude/settings.json" << EOF
{
  "env": {
    "ANTHROPIC_BASE_URL": "https://api.moonshot.ai/anthropic",
    "ANTHROPIC_AUTH_TOKEN": "$apikey",
    "API_TIMEOUT_MS": "3000000",
    "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1",
    "ANTHROPIC_MODEL": "kimi-k2-thinking-turbo",
    "ANTHROPIC_SMALL_FAST_MODEL": "kimi-k2-thinking-turbo",
    "ANTHROPIC_DEFAULT_SONNET_MODEL": "kimi-k2-thinking-turbo",
    "ANTHROPIC_DEFAULT_OPUS_MODEL": "kimi-k2-thinking-turbo",
    "ANTHROPIC_DEFAULT_HAIKU_MODEL": "kimi-k2-thinking-turbo",
    "CLAUDE_CODE_SUBAGENT_MODEL": "kimi-k2-thinking-turbo"
  }
}
EOF
        ;;
    4)
        # 智谱 国内版 — 官方文档: docs.bigmodel.cn
        cat > "$HOME/.claude/settings.json" << EOF
{
  "env": {
    "ANTHROPIC_BASE_URL": "https://open.bigmodel.cn/api/anthropic",
    "ANTHROPIC_AUTH_TOKEN": "$apikey",
    "API_TIMEOUT_MS": "3000000",
    "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1",
    "ANTHROPIC_DEFAULT_HAIKU_MODEL": "glm-4.5-air",
    "ANTHROPIC_DEFAULT_SONNET_MODEL": "glm-4.7",
    "ANTHROPIC_DEFAULT_OPUS_MODEL": "glm-5"
  }
}
EOF
        ;;
    5)
        # 智谱 海外版 — 官方文档: docs.bigmodel.cn
        cat > "$HOME/.claude/settings.json" << EOF
{
  "env": {
    "ANTHROPIC_BASE_URL": "https://api.z.ai/api/anthropic",
    "ANTHROPIC_AUTH_TOKEN": "$apikey",
    "API_TIMEOUT_MS": "3000000",
    "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1",
    "ANTHROPIC_DEFAULT_HAIKU_MODEL": "glm-4.5-air",
    "ANTHROPIC_DEFAULT_SONNET_MODEL": "glm-4.7",
    "ANTHROPIC_DEFAULT_OPUS_MODEL": "glm-5"
  }
}
EOF
        ;;
    6)
        # MiniMax 国内版 — 官方文档: platform.minimaxi.com
        cat > "$HOME/.claude/settings.json" << EOF
{
  "env": {
    "ANTHROPIC_BASE_URL": "https://api.minimaxi.com/anthropic",
    "ANTHROPIC_AUTH_TOKEN": "$apikey",
    "API_TIMEOUT_MS": "3000000",
    "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1",
    "ANTHROPIC_MODEL": "MiniMax-M2.5",
    "ANTHROPIC_SMALL_FAST_MODEL": "MiniMax-M2.5",
    "ANTHROPIC_DEFAULT_SONNET_MODEL": "MiniMax-M2.5",
    "ANTHROPIC_DEFAULT_OPUS_MODEL": "MiniMax-M2.5",
    "ANTHROPIC_DEFAULT_HAIKU_MODEL": "MiniMax-M2.5"
  }
}
EOF
        ;;
    7)
        # MiniMax 海外版 — 官方文档: platform.minimax.io
        cat > "$HOME/.claude/settings.json" << EOF
{
  "env": {
    "ANTHROPIC_BASE_URL": "https://api.minimax.io/anthropic",
    "ANTHROPIC_AUTH_TOKEN": "$apikey",
    "API_TIMEOUT_MS": "3000000",
    "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1",
    "ANTHROPIC_MODEL": "MiniMax-M2.5",
    "ANTHROPIC_SMALL_FAST_MODEL": "MiniMax-M2.5",
    "ANTHROPIC_DEFAULT_SONNET_MODEL": "MiniMax-M2.5",
    "ANTHROPIC_DEFAULT_OPUS_MODEL": "MiniMax-M2.5",
    "ANTHROPIC_DEFAULT_HAIKU_MODEL": "MiniMax-M2.5"
  }
}
EOF
        ;;
    8)
        # 通义千问 Qwen 国内版 — 官方文档: help.aliyun.com
        cat > "$HOME/.claude/settings.json" << EOF
{
  "env": {
    "ANTHROPIC_BASE_URL": "https://dashscope.aliyuncs.com/apps/anthropic",
    "ANTHROPIC_AUTH_TOKEN": "$apikey",
    "API_TIMEOUT_MS": "3000000",
    "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1",
    "ANTHROPIC_MODEL": "qwen3.5-plus",
    "ANTHROPIC_SMALL_FAST_MODEL": "qwen3-coder-next",
    "ANTHROPIC_DEFAULT_SONNET_MODEL": "qwen3.5-plus",
    "ANTHROPIC_DEFAULT_OPUS_MODEL": "qwen3.5-plus",
    "ANTHROPIC_DEFAULT_HAIKU_MODEL": "qwen3-coder-next"
  }
}
EOF
        ;;
    9)
        # 通义千问 Qwen 海外版 — 官方文档: help.aliyun.com
        cat > "$HOME/.claude/settings.json" << EOF
{
  "env": {
    "ANTHROPIC_BASE_URL": "https://dashscope-intl.aliyuncs.com/apps/anthropic",
    "ANTHROPIC_AUTH_TOKEN": "$apikey",
    "API_TIMEOUT_MS": "3000000",
    "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1",
    "ANTHROPIC_MODEL": "qwen3.5-plus",
    "ANTHROPIC_SMALL_FAST_MODEL": "qwen3-coder-next",
    "ANTHROPIC_DEFAULT_SONNET_MODEL": "qwen3.5-plus",
    "ANTHROPIC_DEFAULT_OPUS_MODEL": "qwen3.5-plus",
    "ANTHROPIC_DEFAULT_HAIKU_MODEL": "qwen3-coder-next"
  }
}
EOF
        ;;
    *)
        echo "❌ 输入无效"; exit 1
        ;;
esac

echo "✅ Claude Code 配置已写入: ~/.claude/settings.json"

# --- Bypass onboarding ---
if [ -f "$HOME/.claude.json" ]; then
    python3 -c "
import json
with open('$HOME/.claude.json', 'r') as f:
    data = json.load(f)
data['hasCompletedOnboarding'] = True
with open('$HOME/.claude.json', 'w') as f:
    json.dump(data, f, indent=2)
" 2>/dev/null
else
    echo '{"hasCompletedOnboarding": true}' > "$HOME/.claude.json"
fi

echo "✅ 登录绕过已配置"
echo ""
echo "========================================================"
echo "  🎉 配置完成！"
echo "  请运行第三步脚本来启动你的 AI 编程助手。"
echo "========================================================"
read -n 1 -s -r -p "按任意键退出..."
