# 🤖 AI Agent 一键安装脚本

> **一行命令，装完即用。**
>
> 本项目为每个主流 AI Agent 工具提供一行安装命令，并附带详细的安装后配置指南，确保新手也能顺利上手。

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

---

## 📖 目录

- [这是什么？](#这是什么)
- [我能装哪些工具？](#我能装哪些工具)
- [Windows 桌面应用](#windows-桌面应用)
  - [Claude Desktop](#1-claude-desktop)
  - [ChatGPT Desktop](#2-chatgpt-desktop)
  - [Cursor](#3-cursor)
  - [Codex Desktop](#4-codex-desktop)
- [命令行工具（CLI）](#命令行工具cli)
  - [Claude Code CLI](#1-claude-code-cli)
  - [Codex CLI](#2-codex-cli)
  - [Hermes Agent](#3-hermes-agent)
- [中国开发者专区](#中国开发者专区)
- [常见问题](#常见问题)

---

## 这是什么？

很多 AI Agent 工具的安装过程对新手不太友好——需要去官网找下载链接、注册账号、配置环境变量等等。

本项目把这些工具的安装过程简化成**一行命令**，并且为每个工具写清楚了：

- ✅ **是什么** — 这个工具能做什么
- ✅ **怎么装** — 一行命令搞定
- ✅ **装完怎么用** — 打开后第一步做什么
- ✅ **怎么配置** — API Key 在哪设置、模型怎么选

---

## 我能装哪些工具？

### 🖥️ 桌面应用（有图形界面，鼠标点点就能用）

| 工具 | 开发商 | 一句话介绍 | 适用人群 |
|------|--------|-----------|----------|
| **Claude Desktop** | Anthropic | Claude AI 的桌面版，可以直接和 Claude 对话 | 所有人 |
| **ChatGPT Desktop** | OpenAI | ChatGPT 的桌面版 | 所有人 |
| **Cursor** | Cursor | 基于 VS Code 的 AI 编程编辑器 | 开发者 |
| **Codex Desktop** | OpenAI | OpenAI 的编程 Agent 桌面版 | 开发者 |

### ⌨️ 命令行工具（在终端里运行，适合开发者）

| 工具 | 开发商 | 一句话介绍 | 适用人群 |
|------|--------|-----------|----------|
| **Claude Code CLI** | Anthropic | 在终端里用 Claude 写代码、改 Bug | 开发者 |
| **Codex CLI** | OpenAI | 在终端里用 GPT 写代码 | 开发者 |
| **Hermes Agent** | Nous Research | 开源 AI Agent，支持多种模型和平台 | 高级开发者 |

---

## Windows 桌面应用

> ⚠️ 以下命令需要在 **PowerShell** 中运行。
>
> 打开方式：按 `Win + X`，选择「Windows PowerShell」或「终端」

---

### 1. Claude Desktop

**是什么？** Anthropic 官方的 Claude 桌面应用。你可以像聊天一样和 Claude 对话，支持上传文件、图片分析、长文档处理等。

**一行命令安装：**

```powershell
winget install Anthropic.Claude
```

**安装后怎么用？**

1. 从开始菜单搜索 **Claude** 并打开
2. 首次打开需要**登录 Anthropic 账号**
   - 如果没有账号，点击 "Sign up" 注册（需要邮箱）
   - 注册后会赠送免费额度，可以直接使用
3. 登录后就能直接对话了

**进阶配置（可选）：**

如果你想用自己的 API Key（比如通过 CC Switch 使用其他模型）：
- 打开 Claude Desktop → 左下角齿轮 ⚙️ → Settings → API Keys
- 或者安装 [CC Switch](https://github.com/nicepkg/claude-code-switcher) 来管理多个 API 提供商

---

### 2. ChatGPT Desktop

**是什么？** OpenAI 官方的 ChatGPT 桌面版。和网页版功能一样，但更快、支持快捷键唤起。

**一行命令安装：**

```powershell
winget install OpenAI.ChatGPT
```

**安装后怎么用？**

1. 从开始菜单搜索 **ChatGPT** 并打开
2. 使用你的 **OpenAI 账号登录**（和网页版同一个账号）
3. 登录后就能直接对话

**注意：** 如果你在国内，可能需要代理才能访问。配置方法见 [中国开发者专区](#中国开发者专区)。

---

### 3. Cursor

**是什么？** 基于 VS Code 的 AI 编程编辑器。内置了 AI 对话、代码补全、代码解释等功能，写代码效率直接翻倍。

**一行命令安装：**

```powershell
winget install Cursor.Cursor
```

**安装后怎么用？**

1. 从开始菜单搜索 **Cursor** 并打开
2. 首次打开需要**登录或注册 Cursor 账号**
   - 访问 https://cursor.sh 注册
   - 注册后有免费额度（Pro 版 $20/月，免费版够日常使用）
3. 登录后界面和 VS Code 一样，可以直接：
   - `Ctrl + L` 打开 AI 对话
   - `Ctrl + K` 让 AI 帮你写代码
   - 选中代码后按 `Ctrl + L` 问 AI 这段代码是什么意思

**进阶配置：**

- 支持导入 VS Code 的插件和设置（首次打开时会提示）
- 支持配置自定义 API Key（Settings → Models → Add Model）

---

### 4. Codex Desktop

**是什么？** OpenAI 的 Codex 编程 Agent 桌面版。它可以自动写代码、运行命令、创建文件，像一个自动化的编程助手。

**一行命令安装：**

```powershell
winget install OpenAI.Codex --source msstore
```

**如果上面的命令报错，试试：**

```powershell
winget search Codex
# 找到 OpenAI 的 Codex，复制它的 ID，然后：
winget install <找到的ID>
```

**或者手动安装：**
1. 打开 Microsoft Store（开始菜单搜索 "Microsoft Store"）
2. 搜索 "Codex"
3. 点击「获取」安装

**安装后怎么用？**

1. 从开始菜单搜索 **Codex** 并打开
2. 使用 OpenAI 账号登录
3. 在输入框里描述你想做什么，Codex 会自动帮你写代码

**注意：** Codex Desktop 使用的是 OpenAI 的 API，国内用户需要代理。如果你想用国产模型（如 MiMo），请使用 [Codex CLI](#2-codex-cli)。

---

## 命令行工具（CLI）

> ⚠️ 以下工具需要在**终端**中运行。
>
> - **Windows 用户**：打开 PowerShell 或 WSL
> - **macOS 用户**：打开「终端」（Terminal）
> - **Linux 用户**：打开你的终端模拟器
>
> **前提条件**：需要安装 [Node.js](https://nodejs.org/)（JavaScript 运行环境）。
>
> 如果你还没安装 Node.js，先运行这一行：
> ```powershell
> winget install OpenJS.NodeJS.LTS
> ```
> 安装后**重启终端**，然后才能安装下面的工具。

---

### 1. Claude Code CLI

**是什么？** Anthropic 官方的命令行编程 Agent。你可以在终端里让 Claude 帮你写代码、改 Bug、重构项目，它能直接读写你电脑上的文件。

**一行命令安装：**

```bash
npm install -g @anthropic-ai/claude-code
```

**安装后怎么用？**

1. 在终端里输入：
   ```bash
   claude
   ```
2. 首次运行会要求你**登录 Anthropic 账号**
   - 按提示在浏览器中完成登录
   - 登录后会自动保存认证信息
3. 登录成功后就能直接对话了，比如：
   ```
   > 帮我写一个 Python 脚本，读取 CSV 文件并统计每列的平均值
   ```

**常用命令：**

```bash
claude                    # 启动交互式对话
claude -q "你的问题"      # 快速提问，不进入交互模式
claude config             # 查看/修改配置
claude --help             # 查看帮助
```

**验证安装：**

```bash
claude --version
# 应该显示类似：claude-code x.x.x
```

---

### 2. Codex CLI

**是什么？** OpenAI 的命令行编程 Agent。功能和 Claude Code 类似，但使用的是 GPT 模型。

**一行命令安装（推荐 v0.80.0）：**

```bash
npm install -g @openai/codex@0.80.0
```

> ⚠️ **为什么锁定 v0.80.0？**
>
> v0.80.0 是最后一个支持 `wire_api="chat"` 的版本，兼容更多 API 提供商（包括中国国产模型如 MiMo、DeepSeek 等）。新版本默认使用 `wire_api="responses"`，部分国产模型不支持。

**安装后怎么用？**

1. 设置 OpenAI API Key：
   ```bash
   # Windows PowerShell
   $env:OPENAI_API_KEY = "你的API密钥"
   
   # Linux / macOS / WSL
   export OPENAI_API_KEY=你的API密钥
   ```
   
   > 💡 API Key 在 https://platform.openai.com/api-keys 获取

2. 在终端里输入：
   ```bash
   codex
   ```

3. 描述你想做什么，Codex 会自动帮你写代码

**使用国产模型（如 MiMo）：**

如果你想用 MiMo 而不是 OpenAI，创建配置文件：

```bash
# 创建配置目录
mkdir -p ~/.codex

# 写入配置
cat > ~/.codex/config.toml << 'EOF'
model = "mimo-v2.5-pro"
provider = "openai"
base_url = "https://token-plan-cn.xiaomimimo.com/v1"
wire_api = "chat"
EOF

# 设置 MiMo API Key
export OPENAI_API_KEY=你的MiMo密钥
```

**验证安装：**

```bash
codex --version
# 应该显示：0.80.0
```

---

### 3. Hermes Agent

**是什么？** Nous Research 出品的开源 AI Agent。支持 20+ 种 AI 模型、多平台消息（Telegram、Discord 等）、持久记忆、技能系统等。功能最强大，但也最复杂。

**一行命令安装：**

```bash
curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash
```

**安装后怎么用？**

1. 运行配置向导：
   ```bash
   hermes setup
   ```
   按提示选择：
   - **Model**：选择你想用的 AI 模型（推荐先用 OpenRouter）
   - **Provider**：选择 API 提供商
   - **Terminal**：终端设置（默认即可）

2. 配置 API Key：
   
   如果你选择 OpenRouter（推荐，支持多种模型）：
   ```bash
   # 编辑 .env 文件
   nano ~/.hermes/.env
   
   # 添加你的 API Key
   OPENROUTER_API_KEY=你的密钥
   ```
   
   > 💡 OpenRouter API Key 在 https://openrouter.ai/keys 获取

3. 开始使用：
   ```bash
   hermes                    # 启动交互式对话
   hermes chat -q "问题"     # 快速提问
   hermes doctor             # 检查配置是否正确
   ```

**常用命令：**

```bash
hermes                    # 启动对话
hermes setup              # 重新配置
hermes model              # 切换模型
hermes doctor             # 健康检查
hermes --help             # 查看帮助
hermes skills list        # 查看已安装的技能
```

**更多资源：**

- 📖 官方文档：https://hermes-agent.nousresearch.com/docs
- 💻 GitHub：https://github.com/NousResearch/hermes-agent
- 🎯 中文 Skills：https://github.com/huanghhcri/hermes-skills

---

## 中国开发者专区

### 🌐 配置代理

如果你在国内，使用国外 AI 服务（OpenAI、Anthropic 等）需要配置代理。

**临时设置（当前终端有效，关闭后失效）：**

```bash
# Windows PowerShell
$env:https_proxy = "http://127.0.0.1:7897"

# Linux / macOS / WSL
export https_proxy=http://127.0.0.1:7897
```

> 💡 `7897` 是 Clash Verge 的默认端口。如果你用其他代理软件，请改成对应的端口号。

**WSL 用户特别注意：**

WSL 不能直接用 Windows 的代理，需要这样设置：

```bash
# 获取 Windows 主机 IP
WINDOWS_HOST=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}')

# 设置代理
export http_proxy=http://${WINDOWS_HOST}:7897
export https_proxy=http://${WINDOWS_HOST}:7897
```

### 🇨🇳 推荐国产 AI 服务（无需代理）

| 服务 | 优势 | 价格 | 注册地址 |
|------|------|------|----------|
| **MiMo** | 支持 OpenAI/Anthropic 格式，性价比高 | 有免费额度 | https://mimo.xiaomi.com |
| **DeepSeek** | API 兼容性最好，国内直连 | 有免费额度 | https://platform.deepseek.com |
| **Qwen (通义千问)** | 阿里云大模型，稳定可靠 | 有免费额度 | https://dashscope.aliyun.com |
| **Kimi (月之暗面)** | 长上下文能力强（128K） | 有免费额度 | https://platform.moonshot.cn |

**使用 MiMo 配置 Claude Code CLI：**

```bash
# 设置 MiMo API
export ANTHROPIC_API_KEY=你的MiMo密钥
export ANTHROPIC_BASE_URL=https://token-plan-cn.xiaomimimo.com/anthropic
```

**使用 DeepSeek 配置 Codex CLI：**

```bash
# 创建配置
mkdir -p ~/.codex
cat > ~/.codex/config.toml << 'EOF'
model = "deepseek-chat"
provider = "openai"
base_url = "https://api.deepseek.com/v1"
wire_api = "chat"
EOF

export OPENAI_API_KEY=你的DeepSeek密钥
```

---

## 常见问题

### 安装类

**Q: `winget` 命令不存在怎么办？**

A: 需要安装 App Installer：
1. 打开 Microsoft Store（开始菜单搜索）
2. 搜索 "App Installer"
3. 安装后就能用 `winget` 了

**Q: `npm` 命令不存在怎么办？**

A: 需要先安装 Node.js：
```powershell
winget install OpenJS.NodeJS.LTS
```
安装后**重启终端**，然后再试。

**Q: PowerShell 脚本执行报错 "无法加载文件，因为在此系统上禁止运行脚本"？**

A: 运行以下命令解除限制：
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

**Q: Claude Code CLI 安装后输入 `claude` 提示"命令未找到"？**

A: npm 全局安装路径没有加入 PATH，运行：
```bash
# 查看 npm 全局路径
npm config get prefix

# 把路径加入 PATH（添加到 ~/.bashrc 或 ~/.zshrc）
echo 'export PATH="$(npm config get prefix)/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

### 使用类

**Q: Codex CLI 为什么要锁定 v0.80.0？**

A: v0.80.0 是最后一个支持 `wire_api="chat"` 的版本。新版本默认使用 `wire_api="responses"`，而大部分中国国产模型（MiMo、DeepSeek 等）只支持 `/v1/chat/completions`（即 chat 模式）。如果你只用 OpenAI 官方 API，可以用最新版。

**Q: Claude Desktop 和 Claude Code CLI 有什么区别？**

A:
- **Claude Desktop**：图形界面，适合所有人，点点鼠标就能用
- **Claude Code CLI**：命令行，适合开发者，可以在终端里让 Claude 直接读写你的代码文件

**Q: 我应该选哪个工具？**

A:
- **只是想和 AI 聊天** → Claude Desktop 或 ChatGPT Desktop
- **想用 AI 写代码（图形界面）** → Cursor
- **想用 AI 写代码（命令行）** → Claude Code CLI 或 Codex CLI
- **想要最强大的开源 Agent** → Hermes Agent

**Q: 国内用哪个 AI 服务最划算？**

A: 推荐 **MiMo** 或 **DeepSeek**：
- 都有免费额度
- API 兼容性好
- 国内直连，不需要代理
- 详细配置见上方 [中国开发者专区](#中国开发者专区)

---

## 📄 License

[MIT License](LICENSE)

---

## 🤝 贡献

欢迎提交 PR！如果你想添加新的 AI Agent 工具：

1. Fork 本仓库
2. 在 README 中添加工具的安装和使用说明
3. 在脚本中添加安装逻辑
4. 提交 PR
