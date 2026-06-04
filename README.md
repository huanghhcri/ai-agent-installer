# 🤖 AI Agent Installer

> 一行命令安装 AI Agent 工具。支持 Claude Desktop、ChatGPT Desktop、Cursor、Codex CLI、Claude Code CLI、Hermes Agent 等。

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

---

## 🚀 一行命令安装

### Windows（桌面应用 + CLI 工具）

打开 **PowerShell**，复制粘贴运行：

```powershell
irm https://raw.githubusercontent.com/huanghhcri/ai-agent-installer/main/scripts/install.ps1 | iex
```

这会自动安装：

| 工具 | 类型 | 说明 |
|------|------|------|
| Claude Desktop | 🖥️ 桌面应用 | Anthropic 的 Claude 桌面版 |
| ChatGPT Desktop | 🖥️ 桌面应用 | OpenAI 的 ChatGPT 桌面版 |
| Cursor | 🖥️ 桌面应用 | AI 代码编辑器 |
| Codex Desktop | 🖥️ 桌面应用 | OpenAI 的 Codex 桌面版 |
| Claude Code CLI | ⌨️ 命令行 | Anthropic 的编程 Agent |
| Codex CLI | ⌨️ 命令行 | OpenAI 的编程 Agent（v0.80.0） |
| Hermes Agent | ⌨️ 命令行 | Nous Research 的开源 Agent |

### WSL / Linux / macOS（CLI 工具）

打开终端，复制粘贴运行：

```bash
curl -fsSL https://raw.githubusercontent.com/huanghhcri/ai-agent-installer/main/scripts/install.sh | bash
```

### 只安装 CLI 工具（Windows）

```powershell
irm https://raw.githubusercontent.com/huanghhcri/ai-agent-installer/main/scripts/install.ps1 | iex -args '-CLI'
```

### 只安装桌面应用（Windows）

```powershell
irm https://raw.githubusercontent.com/huanghhcri/ai-agent-installer/main/scripts/install.ps1 | iex -args '-Desktop'
```

---

## 📦 支持的工具

### 🖥️ 桌面应用（Windows）

| 应用 | 安装方式 | 说明 |
|------|----------|------|
| **Claude Desktop** | winget (`Anthropic.Claude`) | Anthropic 官方桌面应用，支持 API 直连 |
| **ChatGPT Desktop** | winget (`OpenAI.ChatGPT`) | OpenAI 官方桌面应用 |
| **Cursor** | winget (`Cursor.Cursor`) | AI 驱动的代码编辑器，基于 VS Code |
| **Codex Desktop** | Microsoft Store | OpenAI 的 Codex 桌面版 |

### ⌨️ 命令行工具（跨平台）

| 工具 | 安装方式 | 说明 |
|------|----------|------|
| **Claude Code CLI** | `npm install -g @anthropic-ai/claude-code` | Anthropic 的编程 Agent |
| **Codex CLI** | `npm install -g @openai/codex@0.80.0` | OpenAI 的编程 Agent |
| **Hermes Agent** | 官方安装脚本 | Nous Research 的开源 Agent |
| **OpenCode** | npm 或官方脚本 | 开源编程 Agent |

---

## ⚙️ 安装后配置

### Claude Desktop

1. 从开始菜单启动 Claude Desktop
2. 首次启动会要求登录 Anthropic 账号
3. 如需使用 API Key：Settings → API Keys

### Claude Code CLI

```bash
# 启动配置向导
claude config

# 或直接设置 API Key
export ANTHROPIC_API_KEY=your_key_here
```

### Codex CLI

```bash
# 设置 API Key
export OPENAI_API_KEY=your_key_here

# 验证安装
codex --version  # 应显示 0.80.0
```

### Hermes Agent

```bash
# 启动配置向导
hermes setup

# 或手动配置模型
hermes model

# 检查健康状态
hermes doctor
```

---

## 🇨🇳 中国开发者特别说明

如果你在大陆地区，可能需要配置代理才能使用部分 AI 服务。

### 配置代理

```bash
# 临时设置（当前终端有效）
export http_proxy=http://127.0.0.1:7897
export https_proxy=http://127.0.0.1:7897

# WSL 用户需要使用 Windows 主机 IP
export WINDOWS_HOST=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}')
export http_proxy=http://${WINDOWS_HOST}:7897
export https_proxy=http://${WINDOWS_HOST}:7897
```

### 使用中国 AI 服务

推荐使用以下国产 AI 服务（无需代理）：

| 服务 | 说明 | 配置指南 |
|------|------|----------|
| **XiaoMi MiMo** | 性价比高，支持 OpenAI 和 Anthropic 格式 | [配置指南](https://github.com/huanghhcri/hermes-skills/blob/main/skills/integrations/chinese-ai-provider-setup/SKILL.md) |
| **DeepSeek** | 国产大模型，API 兼容性好 | 直接使用，无需代理 |
| **Qwen (通义千问)** | 阿里云大模型 | 使用 DashScope API |
| **Kimi (月之暗面)** | 长上下文能力强 | 使用 Moonshot API |

详细的中国 AI 服务配置指南，请参考：[hermes-skills/chinese-ai-provider-setup](https://github.com/huanghhcri/hermes-skills)

---

## 🔧 卸载

### 卸载桌面应用

```powershell
# Windows (PowerShell)
winget uninstall Anthropic.Claude
winget uninstall OpenAI.ChatGPT
winget uninstall Cursor.Cursor
```

### 卸载 CLI 工具

```bash
# 卸载 Claude Code CLI
npm uninstall -g @anthropic-ai/claude-code

# 卸载 Codex CLI
npm uninstall -g @openai/codex

# 卸载 Hermes Agent
hermes uninstall
```

---

## ❓ 常见问题

### Q: PowerShell 脚本执行报错？

A: 可能是执行策略限制，运行以下命令解除：
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Q: winget 命令不存在？

A: 需要安装 App Installer：
- 打开 Microsoft Store
- 搜索 "App Installer"
- 安装后即可使用 winget

### Q: Claude Code CLI 安装后找不到命令？

A: 可能是 npm 全局路径未加入 PATH：
```bash
# 查看 npm 全局路径
npm config get prefix

# 将路径加入 PATH（添加到 ~/.bashrc 或 ~/.zshrc）
export PATH="$(npm config get prefix)/bin:$PATH"
```

### Q: Codex CLI 为什么锁定 v0.80.0？

A: 因为 v0.80.0 是最后一个支持 `wire_api="chat"` 的版本。新版本默认使用 `wire_api="responses"`，而大多数中国 AI 服务（如 MiMo）只支持 `/v1/chat/completions`。

### Q: WSL 中如何使用 Windows 安装的桌面应用？

A: WSL 中可以直接运行 Windows 程序：
```bash
# 启动 Claude Desktop
/mnt/c/Users/你的用户名/AppData/Local/AnthropicClaude/Claude.exe
```

---

## 🤝 贡献

欢迎提交 PR 添加更多 AI Agent 工具的支持！

1. Fork 本仓库
2. 在 `scripts/install.ps1` 或 `scripts/install.sh` 中添加新工具
3. 更新 README
4. 提交 PR

---

## 📄 License

[MIT License](LICENSE)
