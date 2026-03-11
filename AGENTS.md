# AGENTS.md — Agent 101 Toolkit 开发指南

## 项目概述

Agent 101 Toolkit 是一个静态文档站点，提供 AI 编程助手（OpenClaw、Claude Code）的安装配置教程，原生支持国产大模型。

**技术栈**：纯静态 HTML/CSS/JavaScript，无构建步骤  
**语言**：简体中文（文档、注释、UI 文本）

---

## 构建与验证命令

本项目无构建、lint、test 命令。验证方式：

```bash
# 本地预览（任意 HTTP 服务器）
npx http-server . -p 8080

# 验证脚本语法（Windows BAT）
cmd /c dir tools\windows\*.bat

# 验证脚本语法（Mac shell）
bash -n tools/mac/1-setup-env.command

# 验证 HTML 结构
# 手动在浏览器打开 index.html 检查导航
```

**单文件测试**：直接双击 `.bat` 或 `.command` 脚本验证安装流程

---

## 代码风格规范

### 1. 命名规范

| 类型 | 规范 | 示例 |
|------|------|------|
| HTML 文件 | 小写 + 连字符 | `1-setup-env.bat`, `guide.html` |
| CSS 类名 | 小写 + 连字符 | `.step-badge`, `.provider-card` |
| CSS 变量 | 小写 + 连字符 | `--primary`, `--text-muted` |
| BAT 变量 | 全大写 | `BASE_URL`, `WORKSPACE` |
| Shell 变量 | 小写 + 下划线 | `custom_workspace`, `api_key` |

### 2. 文件组织

- 每个项目独立目录：`openclaw/`, `claude-code/`
- 脚本按步骤编号：`1-setup-env.*`, `2-install.*`, `3-start.*`
- 资源统一放在 `assets/` 目录

### 3. HTML/CSS 规范

- 使用语义化标签（`<header>`, `<footer>`, `<section>`）
- CSS 变量集中定义在 `:root`
- 响应式设计优先移动端（但本项目主要为桌面端）
- 颜色使用语义化变量（`--primary`, `--danger`, `--info-bg`）

### 4. BAT 脚本规范

```batch
@echo off
chcp 65001 >nul 2>&1
cls
:: 注释使用双冒号
echo [OK] Step completed
pause
```

- 必须设置 UTF-8 编码（`chcp 65001`）
- 错误处理使用 `errorlevel` 检查
- 路径使用环境变量（`%USERPROFILE%`, `%TEMP%`）

### 5. Shell 脚本规范（Mac）

```bash
#!/bin/bash
clear
# 注释使用单井号
echo "✅ Success"
read -n 1 -s -r -p "按任意键退出..."
```

- 必须有 shebang（`#!/bin/bash`）
- 使用 `clear` 清屏保持界面整洁
- 用户交互使用 `read -p`

---

## 错误处理

### BAT 脚本

```batch
if %errorlevel% neq 0 (
    echo [ERROR] Installation failed
    pause
    exit /b 1
)
```

### Shell 脚本

```bash
if ! command -v node &> /dev/null; then
    echo "❌ Node.js not found"
    exit 1
fi
```

---

## 关键配置项

### NPM 镜像（中国大陆加速）

```bash
npm config set registry https://registry.npmmirror.com
```

### Git HTTPS 配置（解决 GitHub 访问）

```bash
git config --global url."https://github.com/".insteadOf "git@github.com:"
git config --global url."https://github.com/".insteadOf "ssh://git@github.com/"
```

### 安装参数（避免 C++ 编译失败）

```bash
npm install -g <package> --ignore-scripts
```

---

## 现有规则

**无 Cursor 规则**（无 `.cursorrules` 或 `.cursor/rules/`）  
**无 Copilot 规则**（无 `.github/copilot-instructions.md`）

---

## 修改脚本时的检查清单

- [ ] Windows BAT 和 Mac Shell 脚本同步修改
- [ ] 添加 Git HTTPS 配置（两条 insteadOf）
- [ ] 添加 `--ignore-scripts` 参数
- [ ] 使用国内 NPM 镜像
- [ ] 保留用户确认步骤（安全警告）
- [ ] 错误提示使用 `[ERROR]` 前缀
- [ ] 成功提示使用 `[OK]` 或 `✅` 前缀

---

## 调试技巧

1. **脚本执行失败**：在脚本开头添加 `echo on`（BAT）或移除 `> /dev/null 2>&1`（Shell）查看详细输出
2. **环境变量问题**：使用 `echo %PATH%`（BAT）或 `echo $PATH`（Shell）检查
3. **npm 安装卡住**：检查网络连接，确认镜像配置正确
4. **命令找不到**：确认 `npm install -g` 成功，检查 PATH 是否包含全局目录

---

## 文件修改优先级

1. 脚本文件（`.bat`, `.command`） > 文档文件（`.html`）
2. 保持 Windows 和 Mac 脚本功能一致
3. 修改后更新 `README.md` 更新日志部分

---

© 2026 Agent 101 Toolkit
