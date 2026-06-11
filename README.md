# 🤖 AI Agent 一键安装脚本

> **一行命令，装完即用。**
>
> 本项目为每个主流 AI Agent 工具提供一行安装命令，并附带详细的安装后配置指南，确保新手也能顺利上手。

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

---

## 📖 目录

- [这是什么？](#这是什么)
- [工具总览](#工具总览)
- [Windows 桌面应用](#windows-桌面应用)
  - [Claude Desktop](#1-claude-desktop)
  - [ChatGPT Desktop](#2-chatgpt-desktop)
  - [Cursor](#3-cursor)
  - [Codex Desktop](#4-codex-desktop)
  - [Windsurf](#5-windsurf)
  - [Trae](#6-trae)
  - [Zed](#7-zed)
  - [GitHub Copilot](#8-github-copilot)
  - [Hermes Desktop](#9-hermes-desktop)
- [命令行工具（CLI）](#命令行工具cli)
  - [Claude Code CLI](#1-claude-code-cli)
  - [Codex CLI](#2-codex-cli)
  - [Hermes Agent](#3-hermes-agent)
  - [Aider](#4-aider)
  - [OpenCode](#5-opencode)
  - [Kiro CLI（原 Amazon Q Developer CLI）](#6-kiro-cli原-amazon-q-developer-cli)
  - [GitHub Copilot CLI](#7-github-copilot-cli)
  - [Cline](#8-cline)
- [CC Switch：桌面应用 API 统一管理](#cc-switch桌面应用-api-统一管理)
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

## 工具总览

### 🖥️ 桌面应用（有图形界面，鼠标点点就能用）

| 工具 | 开发商 | 一句话介绍 | 适用人群 | 平台 |
|------|--------|-----------|----------|------|
| **Claude Desktop** | Anthropic | Claude AI 桌面版 | 所有人 | Win/Mac |
| **ChatGPT Desktop** | OpenAI | ChatGPT 桌面版 | 所有人 | Win/Mac |
| **Cursor** | Cursor Inc. | AI 编程编辑器 | 开发者 | Win/Mac/Linux |
| **Codex Desktop** | OpenAI | 编程 Agent 桌面版 | 开发者 | Windows |
| **Windsurf** | Codeium | AI 编程编辑器（免费额度多） | 开发者 | Win/Mac/Linux |
| **Trae** | 字节跳动 | 中文友好的 AI 编辑器 | 开发者 | Win/Mac |
| **Zed** | Zed Industries | 高性能编辑器，内置 AI | 开发者 | Mac/Linux |
| **GitHub Copilot** | GitHub | VS Code 中的 AI 助手 | 开发者 | Win/Mac/Linux |
| **Hermes Desktop** | Nous Research | 开源 AI Agent 桌面版（支持 20+ 模型） | 所有人 | Win/Mac/Linux |

### ⌨️ 命令行工具（在终端里运行，适合开发者）

| 工具 | 开发商 | 一句话介绍 | 适用人群 | 平台 |
|------|--------|-----------|----------|------|
| **Claude Code CLI** | Anthropic | 终端里的 Claude 编程 Agent | 开发者 | 跨平台 |
| **Codex CLI** | OpenAI | 终端里的 GPT 编程 Agent | 开发者 | 跨平台 |
| **Hermes Agent** | Nous Research | 开源多模型 AI Agent | 高级开发者 | 跨平台 |
| **Aider** | Paul Gauthier | 最流行的终端 AI 编程工具 | 开发者 | 跨平台 |
| **OpenCode** | OpenCode.ai | 开源终端编程 Agent | 开发者 | Win/Mac/Linux |
| **Kiro CLI** | AWS | AWS AI 命令行编程助手（免费） | 开发者/运维 | Win/Mac/Linux |
| **GitHub Copilot CLI** | GitHub | GitHub 的 AI 命令行助手 | 开发者 | 跨平台 |
| **Cline** | Cline | VS Code 中的自主编程 Agent | 开发者 | 跨平台 |

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

**配置自定义 API（可选）：**

> ⚠️ Claude Desktop **没有**内置的自定义 API 设置界面。如果你想使用第三方 API 提供商（如国内中转站），需要通过 [CC Switch](https://github.com/farion1231/cc-switch) 来配置。

1. 安装 [CC Switch](#cc-switch桌面应用-api-统一管理)（一行命令）
2. 在 CC Switch 中添加你想要的 API 提供商
3. 一键切换，Claude Desktop 即可使用自定义 API

---

### 2. ChatGPT Desktop

**是什么？** OpenAI 官方的 ChatGPT 桌面版。和网页版功能一样，但更快、支持快捷键唤起。

**一行命令安装：**

> ⚠️ ChatGPT Desktop **没有上架 winget**，需要手动安装。

**安装方法：**
1. 打开 [Microsoft Store](https://apps.microsoft.com/store/apps)（开始菜单搜索 "Microsoft Store"）
2. 搜索 **"ChatGPT"**（认准开发者是 **OpenAI**）
3. 点击「获取」安装

或者直接访问：https://openai.com/chatgpt/desktop/

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
winget install Anysphere.Cursor
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
  - ⚠️ 配置自定义 API Key 需要开通 **Pro 会员**（$20/月），免费版只能使用 Cursor 自带的 AI 额度

---

### 4. Codex Desktop

**是什么？** OpenAI 的 Codex 编程 Agent 桌面版。它可以自动写代码、运行命令、创建文件，像一个自动化的编程助手。

**一行命令安装：**

```powershell
winget install OpenAI.Codex
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

**注意：** Codex Desktop 是 Microsoft Store UWP 应用，**不读取** `~/.codex/config.toml` 配置文件，只能使用 OpenAI 官方 API。如果你想用国产模型（如 MiMo），请使用 [Codex CLI](#2-codex-cli)。

---

### 5. Windsurf

**是什么？** Codeium 出品的 AI 编程编辑器，和 Cursor 类似但免费额度更多。支持代码补全、AI 对话、代码解释等功能。

**一行命令安装：**

```powershell
winget install Codeium.Windsurf
```

**安装后怎么用？**

1. 从开始菜单搜索 **Windsurf** 并打开
2. 使用 Google 账号或邮箱注册登录
3. 免费版有较多额度，Pro 版 $15/月
4. 使用方式和 Cursor 类似：
   - `Ctrl + L` 打开 AI 对话
   - `Tab` 接受 AI 代码补全
   - 选中代码后 `Ctrl + L` 解释代码

**优势：** 免费额度比 Cursor 多，对预算有限的开发者很友好。

**进阶配置：**

- 支持配置自定义 API Key（Bring Your Own Key）
  - ⚠️ 配置自定义 API Key 需要开通**付费计划**（Pro $15/月），免费版只能使用 Windsurf 自带的 AI 额度

---

### 6. Trae

**是什么？** 字节跳动出品的 AI 编程编辑器，对中文开发者特别友好。内置了豆包大模型，中文理解能力强。

**一行命令安装：**

```powershell
winget install ByteDance.Trae
```

**如果 winget 找不到，手动安装：**
- 访问 https://www.trae.ai 下载安装包

**安装后怎么用？**

1. 从开始菜单搜索 **Trae** 并打开
2. 使用手机号或邮箱注册（支持中文界面）
3. 内置豆包模型，国内直连无需代理
4. 使用方式：
   - `Ctrl + L` 打开 AI 对话
   - 内置中文代码注释生成
   - 支持中文需求描述

**优势：** 国内直连、中文友好、免费使用。

---

### 7. Zed

**是什么？** 用 Rust 写的高性能代码编辑器，启动极快。内置 AI 助手功能，支持多种 AI 模型。

**一行命令安装：**

```powershell
winget install ZedIndustries.Zed
```

**安装后怎么用？**

1. 从开始菜单搜索 **Zed** 并打开
2. 界面简洁，启动速度非常快
3. AI 功能需要配置：
   - 打开设置（`Ctrl + ,`）
   - 配置 AI 提供商的 API Key
4. 使用 `Ctrl + Enter` 打开 AI 面板

**注意：** 目前 Zed 主要支持 macOS 和 Linux，Windows 版本还在开发中。

---

### 8. GitHub Copilot

**是什么？** GitHub 官方的 AI 编程助手，以 VS Code 扩展形式运行。支持代码补全、代码解释、聊天对话等。

**安装方式：**

GitHub Copilot 是 VS Code 扩展，需要先安装 VS Code，然后安装扩展：

```powershell
# 1. 安装 VS Code（如果还没装）
winget install Microsoft.VisualStudioCode

# 2. 安装 GitHub Copilot 扩展
code --install-extension GitHub.copilot

# 3. 安装 GitHub Copilot Chat 扩展
code --install-extension GitHub.copilot-chat
```

**安装后怎么用？**

1. 打开 VS Code
2. 左侧会看到 Copilot 图标，点击登录 GitHub 账号
3. 使用方式：
   - 写代码时自动补全（灰色提示，按 `Tab` 接受）
   - `Ctrl + I` 打开内联 AI 对话
   - `Ctrl + Shift + I` 打开 Copilot Chat 面板

**价格：** 个人版 $10/月，有 30 天免费试用。学生和开源维护者免费。

---

### 9. Hermes Desktop

**是什么？** Nous Research 出品的开源 AI Agent 桌面版。支持 20+ 种 AI 模型、持久记忆、技能系统、多平台消息等。和 CLI 版本功能一样，但有图形界面，对新手更友好。

**手动安装：**

- **Windows**：下载安装包 → https://hermes-assets.nousresearch.com/Hermes-Setup.exe
- **macOS**：下载 DMG → https://hermes-assets.nousresearch.com/Hermes-Setup.dmg
- **Linux**：前往 GitHub Releases → https://github.com/NousResearch/hermes-agent/releases

**安装后怎么用？**

1. 从开始菜单搜索 **Hermes** 并打开
2. 首次打开会引导你配置：
   - 选择 AI 模型（推荐 OpenRouter，支持多种模型）
   - 填入 API Key
3. 配置完成后就能直接对话了

**优势：**
- 🆓 完全开源，免费使用
- 🧠 支持 20+ 种模型（OpenAI、Claude、DeepSeek、Gemini、MiMo 等）
- 💾 持久记忆（跨对话记住你的偏好）
- 🛠️ 技能系统（可扩展能力）
- 📱 多平台消息（Telegram、Discord 等）

**更多资源：**
- 📖 官方文档：https://hermes-agent.nousresearch.com/docs
- 🖥️ 桌面版页面：https://hermes-agent.nousresearch.com/desktop
- 💻 GitHub：https://github.com/NousResearch/hermes-agent

---

## 命令行工具（CLI）

> ⚠️ 以下工具需要在**终端**中运行。
>
> - **Windows 用户**：打开 PowerShell 或 WSL
> - **macOS 用户**：打开「终端」（Terminal）
> - **Linux 用户**：打开你的终端模拟器
>
> **前提条件**：部分工具需要 [Node.js](https://nodejs.org/) 或 [Python](https://python.org/)。
>
> 如果你还没安装，先运行：
> ```powershell
> # 安装 Node.js
> winget install OpenJS.NodeJS.LTS
>
> # 安装 Python
> winget install Python.Python.3.12
> ```
> 安装后**重启终端**。

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
# 应该显示版本号
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
   $env:OPENAI_API_KEY="sk-..."

   # Linux / macOS / WSL
   export OPENAI_API_KEY=sk-...
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
mkdir -p ~/.codex
cat > ~/.codex/config.toml << 'EOF'
model = "mimo-v2.5-pro"
provider = "openai"
base_url = "https://token-plan-cn.xiaomimimo.com/v1"
wire_api = "chat"
EOF

export OPENAI_API_KEY=你的MiMo_API_Key
codex
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
   OPENROUTER_API_KEY=你的Key
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

### 4. Aider

**是什么？** 目前最流行的终端 AI 编程工具。支持 20+ 种 AI 模型（GPT-4、Claude、DeepSeek、Gemini 等），能直接读写你的代码文件、自动 git commit。完全开源。

**一行命令安装：**

```bash
pip install aider-chat
```

**或者用 pipx（推荐，隔离环境）：**

```bash
pipx install aider-chat
```

**安装后怎么用？**

1. 设置 API Key（以 OpenAI 为例）：
   ```bash
   export OPENAI_API_KEY=sk-...
   ```

2. 进入你的项目目录，启动 Aider：
   ```bash
   cd your-project
   aider
   ```

3. 直接用自然语言描述你想改什么：
   ```
   > 帮我给 main.py 添加日志功能
   > 修复 login 函数的 bug
   > 重构 utils.py，把重复代码提取成公共方法
   ```

**使用其他模型：**

```bash
# 使用 Claude
aider --model claude-3-5-sonnet-20241022

# 使用 DeepSeek
export DEEPSEEK_API_KEY=你的Key
aider --model deepseek --api-key deepseek=$DEEPSEEK_API_KEY

# 使用本地模型（Ollama）
aider --model ollama/deepseek-coder
```

**常用命令：**

```bash
aider                      # 启动（使用默认模型）
aider --model MODEL        # 指定模型
aider --help               # 查看帮助
```

**优势：** 完全开源、支持模型最多、Git 集成好。

---

### 5. OpenCode

**是什么？** 一个开源的终端编程 Agent，界面美观，支持多种 AI 模型。

**一行命令安装：**

```bash
# macOS / Linux
curl -fsSL https://opencode.ai/install | bash

# Windows (PowerShell)
powershell -c "irm https://opencode.ai/install.ps1 | iex"
```

**安装后怎么用？**

1. 进入项目目录：
   ```bash
   cd your-project
   opencode
   ```

2. 在交互界面中描述你想做什么

**配置 API Key：**

```bash
# 使用 OpenAI
export OPENAI_API_KEY=sk-...

# 使用 Anthropic
export ANTHROPIC_API_KEY=sk-ant-...
```

---

### 6. Kiro CLI（原 Amazon Q Developer CLI）

> ⚠️ Amazon Q Developer CLI 已停止维护，现已更名为 **Kiro CLI**。详见 [官方公告](https://github.com/aws/amazon-q-developer-cli)。

**是什么？** AWS 推出的 AI 命令行编程助手，支持代码生成、调试、工作流自动化。免费使用。

**一行命令安装：**

```bash
# macOS / Linux
curl -fsSL https://cli.kiro.dev/install | bash

# Windows (PowerShell)
irm 'https://cli.kiro.dev/install.ps1' | iex
```

**安装后怎么用？**

1. 运行认证：
   ```bash
   kiro login
   ```
   按提示在浏览器中登录（免费注册）

2. 使用方式：
   ```bash
   kiro chat                        # AI 对话
   kiro chat "怎么列出所有 S3 存储桶"  # 直接提问
   ```

**优势：** 免费使用、AWS 资源管理、命令行补全、支持自定义 Agent。

---

### 7. GitHub Copilot CLI

**是什么？** GitHub 官方的命令行 AI 助手。可以在终端里用自然语言执行命令。

**一行命令安装：**

```bash
# 需要先安装 GitHub CLI
winget install GitHub.cli

# 然后安装 Copilot 扩展
gh extension install github/gh-copilot
```

**安装后怎么用？**

1. 登录 GitHub：
   ```bash
   gh auth login
   ```

2. 使用方式：
   ```bash
   gh copilot suggest "列出所有大于 100MB 的文件"  # 命令建议
   gh copilot explain "git rebase -i HEAD~3"      # 解释命令
   ```

**优势：** GitHub 生态集成、命令解释、安全提示。

---

### 8. Cline

**是什么？** VS Code 中的自主编程 Agent。它能自己读写文件、运行命令、浏览网页，像一个真正的 AI 程序员。

**安装方式：**

Cline 是 VS Code 扩展：

```powershell
# 安装 VS Code（如果还没装）
winget install Microsoft.VisualStudioCode

# 安装 Cline 扩展
code --install-extension saoudrizwan.claude-dev
```

**安装后怎么用？**

1. 打开 VS Code
2. 左侧活动栏会看到 Cline 图标（机器人图标）
3. 点击图标打开 Cline 面板
4. 配置 API Key（支持多种模型）：
   - 点击设置齿轮 ⚙️
   - 选择 API Provider（Anthropic、OpenAI、OpenRouter 等）
   - 填入 API Key
5. 在对话框中描述你想做什么，Cline 会自动执行

**优势：** 自主性最强、能自己运行命令、支持多种模型、完全开源。

---

## CC Switch：桌面应用 API 统一管理

### 什么是 CC Switch？

[CC Switch](https://github.com/farion1231/cc-switch) 是一个桌面应用，可以**统一管理**多个 AI 工具的 API 提供商配置。支持的工具包括：

- Claude Code CLI
- **Claude Desktop**（这是配置 Claude Desktop 自定义 API 的唯一方式）
- Codex CLI
- Gemini CLI
- OpenCode
- OpenClaw
- Hermes Agent

**为什么需要它？**

大部分桌面版 AI 应用（尤其是 Claude Desktop）**没有**内置的自定义 API 设置。如果你想用第三方 API 提供商（国内中转站、自建代理等），手动改配置文件容易出错。CC Switch 提供图形界面，一键切换。

**CC Switch 核心功能：**

- 🔌 **50+ 内置提供商预设** — 包含 AWS Bedrock、NVIDIA NIM、国内中转站等
- 🔄 **一键切换** — 系统托盘快速切换，无需手动编辑配置文件
- 🛡️ **安全可靠** — SQLite 数据库 + 原子写入，防止配置损坏
- 📊 **用量追踪** — 查看消费、请求量、Token 使用趋势
- 🔗 **统一 MCP & Skills** — 一个面板管理所有工具的 MCP 服务器和技能
- ☁️ **云端同步** — 支持 Dropbox、OneDrive、iCloud、WebDAV 同步

**一行命令安装（Windows）：**

```powershell
winget install farion1231.cc-switch
```

**或者手动安装：**

前往 GitHub Releases 下载：https://github.com/farion1231/cc-switch/releases/latest

- **Windows**：下载 `CC-Switch-v{version}-Windows.msi` 安装包
- **macOS**：下载 `CC-Switch-v{version}-macOS.dmg`
- **Linux**：下载 `CC-Switch-v{version}-Linux.AppImage`

**官方网站：** https://ccswitch.io

**使用 CC Switch 配置 Claude Desktop 自定义 API：**

1. 安装并打开 CC Switch
2. 在左侧工具列表中选择 **Claude Desktop**
3. 点击「添加提供商」，选择预设或手动填写：
   - API Base URL（如 `https://your-proxy.com/v1`）
   - API Key
4. 点击「切换」，CC Switch 会自动修改 Claude Desktop 的配置文件
5. 重启 Claude Desktop 即可生效

> 💡 CC Switch 同样支持为 Claude Code CLI、Codex CLI 等工具配置自定义 API，比手动编辑 `~/.claude/`、`~/.codex/` 配置文件方便得多。

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
export ANTHROPIC_API_KEY=你的MiMo_API_Key
export ANTHROPIC_BASE_URL=https://token-plan-cn.xiaomimimo.com/anthropic
claude
```

**使用 MiMo 配置 Codex CLI：**

```bash
mkdir -p ~/.codex
cat > ~/.codex/config.toml << 'EOF'
model = "mimo-v2.5-pro"
provider = "openai"
base_url = "https://token-plan-cn.xiaomimimo.com/v1"
wire_api = "chat"
EOF

export OPENAI_API_KEY=你的MiMo_API_Key
```

**使用 DeepSeek 配置 Aider：**

```bash
export DEEPSEEK_API_KEY=你的DeepSeek_API_Key
aider --model deepseek --api-key deepseek=$DEEPSEEK_API_KEY
```

**使用 MiMo 配置 Hermes Agent：**

```bash
hermes setup
# 选择 custom provider
# Base URL: https://token-plan-cn.xiaomimimo.com/v1
# API Key: 你的 MiMo API Key
# Model: mimo-v2.5-pro
```

**使用 CC Switch 配置桌面应用（推荐）：**

如果你使用 Claude Desktop 等桌面应用，推荐用 [CC Switch](https://github.com/farion1231/cc-switch) 一键配置国产模型 API，无需手动编辑配置文件。

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

**Q: `pip` 命令不存在怎么办？**

A: 需要先安装 Python：
```powershell
winget install Python.Python.3.12
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

**Q: 我应该选哪个工具？**

A:

| 你的需求 | 推荐工具 |
|----------|----------|
| 只是想和 AI 聊天 | Claude Desktop 或 ChatGPT Desktop |
| 想用 AI 写代码（图形界面） | Cursor 或 Windsurf |
| 想用 AI 写代码（命令行） | Claude Code CLI 或 Aider |
| 想要免费方案 | Windsurf + DeepSeek / Trae |
| 想要最强大的开源 Agent | Hermes Agent |
| 国内用户不想折腾代理 | Trae / DeepSeek + Aider |
| 想要自主性最强的 Agent | Cline |
| 想为桌面应用配置自定义 API | CC Switch |

**Q: Codex CLI 为什么要锁定 v0.80.0？**

A: v0.80.0 是最后一个支持 `wire_api="chat"` 的版本。新版本默认使用 `wire_api="responses"`，而大部分中国国产模型（MiMo、DeepSeek 等）只支持 `/v1/chat/completions`（即 chat 模式）。如果你只用 OpenAI 官方 API，可以用最新版。

**Q: Claude Desktop 和 Claude Code CLI 有什么区别？**

A:
- **Claude Desktop**：图形界面，适合所有人，点点鼠标就能用
- **Claude Code CLI**：命令行，适合开发者，可以在终端里让 Claude 直接读写你的代码文件

**Q: Claude Desktop 能配置自定义 API 吗？**

A: Claude Desktop **没有**内置的自定义 API 设置。你需要通过 [CC Switch](https://github.com/farion1231/cc-switch) 来配置。CC Switch 提供图形界面，支持 50+ 预设提供商，一键切换。

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
