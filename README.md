# Agent 101 Toolkit

AI Agent 学习与实践工具箱，提供主流 AI 编程助手的安装配置教程，原生支持国产大模型。

## 项目结构

```
agent101toolkit/
├── openclaw/          # OpenClaw 安装与配置教程
├── claude-code/       # Claude Code 安装与配置教程
└── index.html         # 导航首页
```

## 支持的 AI 平台

- **DeepSeek** - 深度求索 V3.2
- **Kimi** - 月之暗面 K2.5（国内/海外版）
- **智谱 GLM** - 清华 GLM-5（国内/海外版）
- **MiniMax** - 海螺 AI M2.5（国内/海外版）
- **通义千问 Qwen** - 阿里云 Qwen3（国内/海外版）

## 快速开始

### OpenClaw

开源免费的 AI Agent 平台，通过飞书消息通道交互。

```bash
# Windows
cd openclaw/tools/windows
# 双击运行：1-setup-env.bat → 2-install-openclaw.bat

# Mac
cd openclaw/tools/mac
# 双击运行：1-setup-env.command → 2-install-openclaw.command
```

安装完成后：
```bash
openclaw onboard      # 初始化配置
openclaw gateway      # 启动服务
```

### Claude Code

Anthropic 官方 CLI 工具，本地终端交互式编程助手。

```bash
# Windows
cd claude-code/tools/windows
# 双击运行：1-setup-env.bat → 2-install-and-configure.bat → 3-start.bat

# Mac
cd claude-code/tools/mac
# 双击运行：1-setup-env.command → 2-install-and-configure.command → 3-start.command
```

---

## 2026-03-11 更新日志

### 问题背景

原始安装脚本在国内网络环境下存在多个问题，导致安装失败或命令无法使用。

### 修复内容

#### 1. OpenClaw 安装脚本修复

**问题**：
- `2-install-openclaw.bat` 使用错误的包名 `@openclaw/cli`（npm 不存在）
- 缺少 `--ignore-scripts` 参数，C++ 模块编译在国内网络下频繁失败

**修改**：
| 文件 | 修改内容 |
|------|----------|
| `tools/windows/2-install-openclaw.bat` | 包名改为 `openclaw@latest`，添加 `--ignore-scripts` |
| `tools/mac/2-install-openclaw.command` | 包名改为 `openclaw@latest`，添加 `--ignore-scripts` |
| `tools/windows/1-setup-env.bat` | 新增 Git HTTPS 配置 |
| `tools/mac/1-setup-env.command` | 新增 Git HTTPS 配置 |

#### 2. Claude Code 安装脚本修复

**问题**：
- 安装命令缺少 `--ignore-scripts` 参数
- 环境准备脚本缺少 Git HTTPS 配置

**修改**：
| 文件 | 修改内容 |
|------|----------|
| `tools/windows/2-install-and-configure.bat` | 添加 `--ignore-scripts` |
| `tools/mac/2-install-and-configure.command` | 添加 `--ignore-scripts` |
| `tools/windows/1-setup-env.bat` | 新增 Git HTTPS 配置 |
| `tools/mac/1-setup-env.command` | 新增 Git HTTPS 配置 |

#### 3. 教程文档更新

**修改**：
- `openclaw/guide.html` - 更新 Step 1/Step 2 说明，补充配置项和注意事项

---

### 关键技术点

1. **NPM 镜像** - 使用淘宝镜像 `https://registry.npmmirror.com` 加速下载
2. **Git HTTPS** - 配置两条 `insteadOf` 规则，解决 GitHub SSH 访问问题
3. **--ignore-scripts** - 跳过 `node-llama-cpp` 等依赖的 C++ 编译，避免国内网络下载二进制文件失败

### 验证

安装完成后运行：
```bash
openclaw --version       # 应显示版本号
claude --version         # 应显示版本号
```

---

## 参考资料

- [OpenClaw Windows 安装终极指南](https://clawblog.huaqloud.com/posts/2026-03-11-openclaw-windows-install-final/)
- [OpenClaw 官方文档](https://docs.openclaw.ai)
- [Claude Code 官方文档](https://docs.anthropic.com/claude-code/)

---

© 2026 Agent 101 Toolkit
