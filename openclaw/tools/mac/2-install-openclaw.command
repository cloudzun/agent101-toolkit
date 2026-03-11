#!/bin/bash
clear
echo "========================================================"
echo ""
echo "  🐾 OpenClaw 之路 · 第二步：安装 OpenClaw"
echo ""
echo "========================================================"
echo ""
echo "⚠️  重要安全提示 ⚠️"
echo "OpenClaw 拥有读取、修改、删除你电脑文件的权限。"
echo "请不要在装有公司代码或敏感数据的电脑上使用！"
echo "建议在个人电脑或虚拟机中体验。"
echo ""
echo "========================================================"
echo ""

read -p "已了解风险，继续安装？(输入 y 并回车): " confirm
if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
    echo "已取消安装。"
    exit 0
fi

echo ""
echo "⚙️  正在安装 OpenClaw..."
echo "   安装过程可能需要 2-5 分钟，请耐心等待："
npm install -g openclaw@latest --ignore-scripts 2>&1 | tail -5
echo ""

echo "========================================================"
echo "  ✅ OpenClaw 安装完成！"
echo ""
echo "  接下来你需要运行 'openclaw onboard' 进行初始化配置。"
echo "  请回到教程，按照图文指引完成配置。"
echo "========================================================"
read -n 1 -s -r -p "按任意键退出..."
