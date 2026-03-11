#!/bin/bash
clear
echo "========================================================"
echo ""
echo "  🧠 Claude Code 之路 · 第一步：准备运行环境"
echo ""
echo "========================================================"
echo ""

# --- Check Node.js ---
if ! command -v node &> /dev/null; then
    echo "❌ 未检测到 Node.js。"
    echo "   请先前往 https://nodejs.org/zh-cn/download/ 下载安装。"
    echo "   安装完成后请关闭此窗口并重新运行本脚本。"
    read -n 1 -s -r -p "按任意键退出..."
    exit 1
fi
echo "✅ Node.js $(node -v)"

# --- Configure NPM mirror ---
echo ""
echo "⚙️  正在配置国内加速镜像..."
npm config set registry https://registry.npmmirror.com/ > /dev/null 2>&1
echo "   NPM → 淘宝镜像 ✅"

# --- Configure Git HTTPS ---
echo ""
echo "⚙️  正在配置 Git HTTPS..."
git config --global url."https://github.com/".insteadOf "git@github.com:" > /dev/null 2>&1
git config --global url."https://github.com/".insteadOf "ssh://git@github.com/" > /dev/null 2>&1
echo "   Git HTTPS ✅"

echo ""
echo "========================================================"
echo "  ✅ 环境准备完成！请回到教程，继续下一步。"
echo "========================================================"
read -n 1 -s -r -p "按任意键退出..."
