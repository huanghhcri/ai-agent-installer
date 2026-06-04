#Requires -Version 5.1
<#
.SYNOPSIS
    AI Agent Tools Installer - 一行命令安装单个 AI Agent 工具
.DESCRIPTION
    桌面应用: Claude, ChatGPT, Cursor, Codex, Windsurf, Trae, Zed, Copilot
    CLI 工具: claude-code, codex-cli, hermes, aider, opencode, amazon-q, copilot-cli, cline
.EXAMPLE
    winget install Anthropic.Claude
    winget install Cursor.Cursor
.EXAMPLE
    npm install -g @anthropic-ai/claude-code
    npm install -g aider-chat
.NOTES
    Author: RBL
    License: MIT
#>

param(
    [Parameter(Mandatory=$false)]
    [ValidateSet(
        'claude', 'chatgpt', 'cursor', 'codex', 'windsurf', 'trae', 'zed', 'copilot', 'hermes-desktop',
        'claude-code', 'codex-cli', 'hermes', 'aider', 'opencode', 'amazon-q', 'copilot-cli', 'cline'
    )]
    [string]$Tool
)

# ============================================================
# Helper
# ============================================================

$Colors = @{ Success='Green'; Error='Red'; Warning='Yellow'; Info='Cyan'; Header='Magenta' }

function Write-Header($Text) {
    Write-Host ""; Write-Host "  $Text" -ForegroundColor $Colors.Header; Write-Host ""
}
function Write-Step($Text) { Write-Host "  → $Text" -ForegroundColor $Colors.Info }
function Write-Success($Text) { Write-Host "  ✓ $Text" -ForegroundColor $Colors.Success }
function Write-Fail($Text) { Write-Host "  ✗ $Text" -ForegroundColor $Colors.Error }
function Write-Warn($Text) { Write-Host "  ⚠ $Text" -ForegroundColor $Colors.Warning }
function Test-Command($Cmd) { $null = Get-Command $Cmd -ErrorAction SilentlyContinue; return $? }

# ============================================================
# Help
# ============================================================

if (-not $Tool) {
    Write-Host ""
    Write-Host "  🤖 AI Agent Installer" -ForegroundColor Magenta
    Write-Host ""
    Write-Host "  桌面应用:" -ForegroundColor Yellow
    Write-Host "    claude       Claude Desktop (Anthropic)" -ForegroundColor Gray
    Write-Host "    chatgpt      ChatGPT Desktop (OpenAI)" -ForegroundColor Gray
    Write-Host "    cursor       Cursor (AI 代码编辑器)" -ForegroundColor Gray
    Write-Host "    codex        Codex Desktop (OpenAI)" -ForegroundColor Gray
    Write-Host "    windsurf     Windsurf (Codeium)" -ForegroundColor Gray
    Write-Host "    trae         Trae (字节跳动)" -ForegroundColor Gray
    Write-Host "    zed          Zed (高性能编辑器)" -ForegroundColor Gray
    Write-Host "    copilot      GitHub Copilot (VS Code 扩展)" -ForegroundColor Gray
    Write-Host "    hermes-desktop  Hermes Desktop (开源 AI Agent 桌面版)" -ForegroundColor Gray
    Write-Host ""
    Write-Host "  命令行工具:" -ForegroundColor Yellow
    Write-Host "    claude-code  Claude Code CLI" -ForegroundColor Gray
    Write-Host "    codex-cli    Codex CLI (v0.80.0)" -ForegroundColor Gray
    Write-Host "    hermes       Hermes Agent" -ForegroundColor Gray
    Write-Host "    aider        Aider (最流行的终端 AI 编程工具)" -ForegroundColor Gray
    Write-Host "    opencode     OpenCode" -ForegroundColor Gray
    Write-Host "    amazon-q     Amazon Q Developer CLI" -ForegroundColor Gray
    Write-Host "    copilot-cli  GitHub Copilot CLI" -ForegroundColor Gray
    Write-Host "    cline        Cline (VS Code 扩展)" -ForegroundColor Gray
    Write-Host ""
    Write-Host "  示例:" -ForegroundColor Yellow
    Write-Host '    irm https://.../install.ps1 | iex -args "-Tool","claude"' -ForegroundColor Gray
    Write-Host ""
    exit 0
}

# ============================================================
# Tool Definitions
# ============================================================

$Tools = @{
    # --- Desktop Apps ---
    'claude' = @{
        Name = "Claude Desktop"
        Desc = "Anthropic 官方 Claude 桌面应用"
        Type = "desktop"
        Install = { winget install Anthropic.Claude --exact --accept-package-agreements --accept-source-agreements }
        Next = @("从开始菜单搜索 'Claude' 并打开", "登录 Anthropic 账号（没有？去 https://claude.ai 注册）", "登录后就能直接对话")
    }
    'chatgpt' = @{
        Name = "ChatGPT Desktop"
        Desc = "OpenAI 官方 ChatGPT 桌面应用"
        Type = "desktop"
        Install = { winget install OpenAI.ChatGPT --exact --accept-package-agreements --accept-source-agreements }
        Next = @("从开始菜单搜索 'ChatGPT' 并打开", "用 OpenAI 账号登录", "国内用户需要代理")
    }
    'cursor' = @{
        Name = "Cursor"
        Desc = "AI 编程编辑器（基于 VS Code）"
        Type = "desktop"
        Install = { winget install Cursor.Cursor --exact --accept-package-agreements --accept-source-agreements }
        Next = @("从开始菜单搜索 'Cursor' 并打开", "去 https://cursor.sh 注册（有免费额度）", "Ctrl+L 打开 AI 对话，Ctrl+K 让 AI 写代码")
    }
    'codex' = @{
        Name = "Codex Desktop"
        Desc = "OpenAI Codex 编程 Agent 桌面版"
        Type = "desktop"
        Install = { winget install OpenAI.Codex --accept-package-agreements --accept-source-agreements --source msstore }
        Next = @("从开始菜单搜索 'Codex' 并打开", "用 OpenAI 账号登录", "国内用户需要代理，或用 Codex CLI + 国产模型")
    }
    'windsurf' = @{
        Name = "Windsurf"
        Desc = "Codeium AI 编程编辑器（免费额度多）"
        Type = "desktop"
        Install = { winget install Codeium.Windsurf --exact --accept-package-agreements --accept-source-agreements }
        Next = @("从开始菜单搜索 'Windsurf' 并打开", "用 Google 账号或邮箱注册（免费额度比 Cursor 多）", "Ctrl+L 打开 AI 对话")
    }
    'trae' = @{
        Name = "Trae"
        Desc = "字节跳动 AI 编程编辑器（中文友好，国内直连）"
        Type = "desktop"
        Install = { winget install ByteDance.Trae --exact --accept-package-agreements --accept-source-agreements }
        Next = @("从开始菜单搜索 'Trae' 并打开", "用手机号或邮箱注册（支持中文界面）", "内置豆包模型，国内直连无需代理")
    }
    'zed' = @{
        Name = "Zed"
        Desc = "高性能代码编辑器，内置 AI"
        Type = "desktop"
        Install = { winget install Zed.Zed --exact --accept-package-agreements --accept-source-agreements }
        Next = @("从开始菜单搜索 'Zed' 并打开", "在设置中配置 AI 提供商的 API Key", "注意：Windows 版本可能还在预览阶段")
    }
    'copilot' = @{
        Name = "GitHub Copilot"
        Desc = "VS Code 中的 AI 编程助手"
        Type = "desktop"
        Install = {
            if (-not (Test-Command "code")) { winget install Microsoft.VisualStudioCode --exact --accept-package-agreements --accept-source-agreements }
            code --install-extension GitHub.copilot
            code --install-extension GitHub.copilot-chat
        }
        Next = @("打开 VS Code", "左侧点击 Copilot 图标登录 GitHub 账号", "写代码时自动补全（Tab 接受），Ctrl+I 打开 AI 对话", "个人版 $10/月，学生免费")
    }
    'hermes-desktop' = @{
        Name = "Hermes Desktop"
        Desc = "Nous Research 开源 AI Agent 桌面版（支持 20+ 模型）"
        Type = "desktop"
        Install = {
            $downloadPath = "$env:USERPROFILE\Desktop\Hermes-Setup.exe"
            Write-Host "  → Downloading to $downloadPath ..." -ForegroundColor Cyan
            Invoke-WebRequest -Uri "https://hermes-assets.nousresearch.com/Hermes-Setup.exe" -OutFile $downloadPath
            Write-Host "  → Launching installer..." -ForegroundColor Cyan
            Start-Process $downloadPath
        }
        Next = @("安装完成后从开始菜单搜索 'Hermes' 并打开", "首次打开会引导配置模型和 API Key", "推荐选 OpenRouter（支持多种模型）", "文档: https://hermes-agent.nousresearch.com/docs", "桌面版: https://hermes-agent.nousresearch.com/desktop")
    }

    # --- CLI Tools ---
    'claude-code' = @{
        Name = "Claude Code CLI"
        Desc = "Anthropic 官方命令行编程 Agent"
        Type = "cli"
        Prereq = "node"
        Install = { npm install -g @anthropic-ai/claude-code }
        Next = @("在终端输入 'claude' 启动", "首次运行会要求登录 Anthropic 账号", "验证: claude --version")
    }
    'codex-cli' = @{
        Name = "Codex CLI"
        Desc = "OpenAI 命令行编程 Agent (v0.80.0)"
        Type = "cli"
        Prereq = "node"
        Install = { npm install -g @openai/codex@0.80.0 }
        Next = @("设置 API Key: `$env:OPENAI_API_KEY=***             "输入 'codex' 启动", "验证: codex --version (应显示 0.80.0)")
    }
    'hermes' = @{
        Name = "Hermes Agent"
        Desc = "Nous Research 开源 AI Agent"
        Type = "cli"
        Prereq = "curl"
        Install = { Invoke-WebRequest -Uri "https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh" -OutFile install.sh; bash install.sh; Remove-Item install.sh }
        Next = @("运行 'hermes setup' 配置模型和 API Key", "运行 'hermes doctor' 检查配置", "文档: https://hermes-agent.nousresearch.com/docs")
    }
    'aider' = @{
        Name = "Aider"
        Desc = "最流行的终端 AI 编程工具（支持 20+ 模型）"
        Type = "cli"
        Prereq = "python"
        Install = { pip install aider-chat }
        Next = @("进入项目目录，输入 'aider' 启动", "设置 API Key: `$env:OPENAI_API_KEY=***             "使用其他模型: aider --model deepseek")
    }
    'opencode' = @{
        Name = "OpenCode"
        Desc = "开源终端编程 Agent"
        Type = "cli"
        Prereq = "node"
        Install = { npm install -g @anthropic-ai/opencode }
        Next = @("进入项目目录，输入 'opencode' 启动", "在设置中配置 API Key")
    }
    'amazon-q' = @{
        Name = "Amazon Q Developer CLI"
        Desc = "AWS AI 命令行助手（免费）"
        Type = "cli"
        Prereq = $null
        Install = { winget install Amazon.QCLI --exact --accept-package-agreements --accept-source-agreements }
        Next = @("运行 'q login' 登录（免费注册 AWS Builder ID）", "使用 'q chat' 开始对话", "免费使用")
    }
    'copilot-cli' = @{
        Name = "GitHub Copilot CLI"
        Desc = "GitHub AI 命令行助手"
        Type = "cli"
        Prereq = $null
        Install = {
            if (-not (Test-Command "gh")) { winget install GitHub.cli --exact --accept-package-agreements --accept-source-agreements }
            gh extension install github/gh-copilot
        }
        Next = @("运行 'gh auth login' 登录 GitHub", "使用 'gh copilot suggest' 获取命令建议", "使用 'gh copilot explain' 解释命令")
    }
    'cline' = @{
        Name = "Cline"
        Desc = "VS Code 中的自主编程 Agent（开源）"
        Type = "cli"
        Prereq = $null
        Install = {
            if (-not (Test-Command "code")) { winget install Microsoft.VisualStudioCode --exact --accept-package-agreements --accept-source-agreements }
            code --install-extension saoudrizwan.claude-dev
        }
        Next = @("打开 VS Code，左侧点击 Cline 图标（机器人）", "配置 API Key（支持 Anthropic、OpenAI、OpenRouter 等）", "在对话框描述你想做什么，Cline 会自动执行")
    }
}

# ============================================================
# Get Tool Info
# ============================================================

$Info = $Tools[$Tool]
if (-not $Info) {
    Write-Fail "Unknown tool: $Tool"
    exit 1
}

# ============================================================
# Check Prerequisites
# ============================================================

Write-Header "Installing $($Info.Name)"
Write-Host "  $($Info.Desc)" -ForegroundColor Gray
Write-Host ""

if ($Info.Prereq -and -not (Test-Command $Info.Prereq)) {
    Write-Warn "$($Info.Prereq) is required but not found."
    switch ($Info.Prereq) {
        "node" { Write-Step "Installing Node.js..."; winget install OpenJS.NodeJS.LTS --exact --accept-package-agreements --accept-source-agreements | Out-Null }
        "python" { Write-Step "Installing Python..."; winget install Python.Python.3.12 --exact --accept-package-agreements --accept-source-agreements | Out-Null }
        "curl" { Write-Step "curl should be available on Windows 10+. If not, install manually." }
    }
    if (-not (Test-Command $Info.Prereq)) {
        Write-Fail "Failed to install $($Info.Prereq). Please install manually."
        exit 1
    }
    Write-Success "$($Info.Prereq) installed. Please restart PowerShell and run this command again."
    exit 0
}

# ============================================================
# Install
# ============================================================

Write-Step "Installing..."
$result = & $Info.Install 2>&1

if ($LASTEXITCODE -eq 0) {
    Write-Success "$($Info.Name) installed successfully!"
} else {
    Write-Warn "Installation completed with warnings. Check output above."
}

# ============================================================
# Next Steps
# ============================================================

Write-Host ""
Write-Host "  ─────────────────────────────────────────────────────" -ForegroundColor Gray
Write-Host "  接下来怎么做:" -ForegroundColor White
Write-Host ""

foreach ($step in $Info.Next) {
    Write-Host "    → $step" -ForegroundColor Gray
}

Write-Host ""
