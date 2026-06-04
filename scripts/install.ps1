#Requires -Version 5.1
<#
.SYNOPSIS
    AI Agent Tools Installer - 一行命令安装单个 AI Agent 工具
.DESCRIPTION
    支持安装: Claude Desktop, ChatGPT Desktop, Cursor, Codex Desktop,
              Claude Code CLI, Codex CLI, Hermes Agent
.EXAMPLE
    # 安装 Claude Desktop
    irm https://raw.githubusercontent.com/huanghhcri/ai-agent-installer/main/scripts/install.ps1 | iex -args '-Tool','claude'
    
    # 安装 Cursor
    irm https://raw.githubusercontent.com/huanghhcri/ai-agent-installer/main/scripts/install.ps1 | iex -args '-Tool','cursor'
    
    # 安装 Claude Code CLI
    irm https://raw.githubusercontent.com/huanghhcri/ai-agent-installer/main/scripts/install.ps1 | iex -args '-Tool','claude-code'
.NOTES
    Author: RBL
    License: MIT
#>

param(
    [Parameter(Mandatory=$false)]
    [ValidateSet('claude', 'chatgpt', 'cursor', 'codex', 'claude-code', 'codex-cli', 'hermes')]
    [string]$Tool
)

# ============================================================
# Helper Functions
# ============================================================

$Colors = @{
    Success = 'Green'
    Error   = 'Red'
    Warning = 'Yellow'
    Info    = 'Cyan'
    Header  = 'Magenta'
}

function Write-Header {
    param([string]$Text)
    Write-Host ""
    Write-Host "  ═══════════════════════════════════════════════════════" -ForegroundColor $Colors.Header
    Write-Host "  $Text" -ForegroundColor $Colors.Header
    Write-Host "  ═══════════════════════════════════════════════════════" -ForegroundColor $Colors.Header
    Write-Host ""
}

function Write-Step {
    param([string]$Text)
    Write-Host "  → $Text" -ForegroundColor $Colors.Info
}

function Write-Success {
    param([string]$Text)
    Write-Host "  ✓ $Text" -ForegroundColor $Colors.Success
}

function Write-Fail {
    param([string]$Text)
    Write-Host "  ✗ $Text" -ForegroundColor $Colors.Error
}

function Write-Warn {
    param([string]$Text)
    Write-Host "  ⚠ $Text" -ForegroundColor $Colors.Warning
}

function Test-Command {
    param([string]$Command)
    $null = Get-Command $Command -ErrorAction SilentlyContinue
    return $?
}

# ============================================================
# Show Help if No Tool Specified
# ============================================================

if (-not $Tool) {
    Write-Host ""
    Write-Host "  🤖 AI Agent Installer" -ForegroundColor Magenta
    Write-Host ""
    Write-Host "  用法: 传入 -Tool 参数指定要安装的工具" -ForegroundColor White
    Write-Host ""
    Write-Host "  桌面应用:" -ForegroundColor Yellow
    Write-Host "    -Tool claude       安装 Claude Desktop" -ForegroundColor Gray
    Write-Host "    -Tool chatgpt      安装 ChatGPT Desktop" -ForegroundColor Gray
    Write-Host "    -Tool cursor       安装 Cursor" -ForegroundColor Gray
    Write-Host "    -Tool codex        安装 Codex Desktop" -ForegroundColor Gray
    Write-Host ""
    Write-Host "  命令行工具:" -ForegroundColor Yellow
    Write-Host "    -Tool claude-code  安装 Claude Code CLI" -ForegroundColor Gray
    Write-Host "    -Tool codex-cli    安装 Codex CLI" -ForegroundColor Gray
    Write-Host "    -Tool hermes       安装 Hermes Agent" -ForegroundColor Gray
    Write-Host ""
    Write-Host "  一行命令示例:" -ForegroundColor Yellow
    Write-Host '    irm https://raw.githubusercontent.com/huanghhcri/ai-agent-installer/main/scripts/install.ps1 | iex -args "-Tool","claude"' -ForegroundColor Gray
    Write-Host ""
    exit 0
}

# ============================================================
# Tool Definitions
# ============================================================

$ToolInfo = @{
    'claude' = @{
        Name = "Claude Desktop"
        Description = "Anthropic 官方 Claude 桌面应用"
        Type = "desktop"
        Method = "winget"
        PackageId = "Anthropic.Claude"
        PostInstall = @(
            "从开始菜单搜索 'Claude' 并打开",
            "首次打开需要登录 Anthropic 账号",
            "没有账号？访问 https://claude.ai 注册（免费）"
        )
    }
    'chatgpt' = @{
        Name = "ChatGPT Desktop"
        Description = "OpenAI 官方 ChatGPT 桌面应用"
        Type = "desktop"
        Method = "winget"
        PackageId = "OpenAI.ChatGPT"
        PostInstall = @(
            "从开始菜单搜索 'ChatGPT' 并打开",
            "使用 OpenAI 账号登录（和网页版同一个账号）",
            "国内用户需要代理才能访问"
        )
    }
    'cursor' = @{
        Name = "Cursor"
        Description = "AI 驱动的代码编辑器（基于 VS Code）"
        Type = "desktop"
        Method = "winget"
        PackageId = "Cursor.Cursor"
        PostInstall = @(
            "从开始菜单搜索 'Cursor' 并打开",
            "访问 https://cursor.sh 注册账号（有免费额度）",
            "Ctrl+L 打开 AI 对话，Ctrl+K 让 AI 写代码",
            "首次打开可导入 VS Code 的插件和设置"
        )
    }
    'codex' = @{
        Name = "Codex Desktop"
        Description = "OpenAI Codex 编程 Agent 桌面版"
        Type = "desktop"
        Method = "winget-store"
        PackageId = "OpenAI.Codex"
        PostInstall = @(
            "从开始菜单搜索 'Codex' 并打开",
            "使用 OpenAI 账号登录",
            "国内用户需要代理，或使用 Codex CLI + 国产模型"
        )
    }
    'claude-code' = @{
        Name = "Claude Code CLI"
        Description = "Anthropic 官方命令行编程 Agent"
        Type = "cli"
        Method = "npm"
        PackageName = "@anthropic-ai/claude-code"
        PrereqCmd = "node"
        PrereqName = "Node.js"
        PrereqInstall = "winget install OpenJS.NodeJS.LTS"
        PostInstall = @(
            "在终端输入 'claude' 启动",
            "首次运行会要求登录 Anthropic 账号",
            "登录后就能直接和 Claude 对话写代码了",
            "验证安装: claude --version"
        )
    }
    'codex-cli' = @{
        Name = "Codex CLI"
        Description = "OpenAI 命令行编程 Agent (v0.80.0)"
        Type = "cli"
        Method = "npm"
        PackageName = "@openai/codex@0.80.0"
        PrereqCmd = "node"
        PrereqName = "Node.js"
        PrereqInstall = "winget install OpenJS.NodeJS.LTS"
        PostInstall = @(
            "设置 API Key: `$env:OPENAI_API_KEY=***             "在终端输入 'codex' 启动",
            "可用国产模型: 创建 ~/.codex/config.toml 配置",
            "验证安装: codex --version (应显示 0.80.0)"
        )
    }
    'hermes' = @{
        Name = "Hermes Agent"
        Description = "Nous Research 开源 AI Agent (需 WSL)"
        Type = "cli"
        Method = "curl"
        InstallCmd = "curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash"
        PostInstall = @(
            "运行 'hermes setup' 配置模型和 API Key",
            "运行 'hermes doctor' 检查配置",
            "文档: https://hermes-agent.nousresearch.com/docs",
            "中文 Skills: https://github.com/huanghhcri/hermes-skills"
        )
    }
}

# ============================================================
# Get Tool Info
# ============================================================

$SelectedTool = $ToolInfo[$Tool]

if (-not $SelectedTool) {
    Write-Fail "Unknown tool: $Tool"
    Write-Host "  Run without -Tool parameter to see available options." -ForegroundColor Gray
    exit 1
}

# ============================================================
# Install
# ============================================================

Write-Header "Installing $($SelectedTool.Name)"
Write-Host "  $($SelectedTool.Description)" -ForegroundColor Gray
Write-Host ""

# Check prerequisites
if ($SelectedTool.PrereqCmd) {
    if (-not (Test-Command $SelectedTool.PrereqCmd)) {
        Write-Warn "$($SelectedTool.PrereqName) is required but not found."
        Write-Step "Installing $($SelectedTool.PrereqName)..."
        Invoke-Expression $SelectedTool.PrereqInstall | Out-Null
        
        if (-not (Test-Command $SelectedTool.PrereqCmd)) {
            Write-Fail "Failed to install $($SelectedTool.PrereqName)."
            Write-Host "  Please install manually: $($SelectedTool.PrereqInstall)" -ForegroundColor Yellow
            exit 1
        }
        Write-Success "$($SelectedTool.PrereqName) installed"
    }
}

# Install based on method
$installSuccess = $false

switch ($SelectedTool.Method) {
    'winget' {
        Write-Step "Installing via winget..."
        $result = winget install --id $SelectedTool.PackageId --exact --accept-package-agreements --accept-source-agreements 2>&1
        if ($LASTEXITCODE -eq 0) {
            $installSuccess = $true
        }
    }
    'winget-store' {
        Write-Step "Installing via winget (Microsoft Store)..."
        $result = winget install --id $SelectedTool.PackageId --accept-package-agreements --accept-source-agreements --source msstore 2>&1
        if ($LASTEXITCODE -ne 0) {
            # Try without source
            $result = winget install --id $SelectedTool.PackageId --accept-package-agreements --accept-source-agreements 2>&1
        }
        if ($LASTEXITCODE -eq 0) {
            $installSuccess = $true
        } else {
            Write-Warn "winget install failed. Trying to open Microsoft Store..."
            Start-Process "ms-windows-store://pdp/?productid=$($SelectedTool.PackageId)"
            Write-Host "  → Microsoft Store has been opened. Please click 'Get' to install." -ForegroundColor Yellow
        }
    }
    'npm' {
        Write-Step "Installing via npm..."
        $result = npm install -g $SelectedTool.PackageName 2>&1
        if ($LASTEXITCODE -eq 0) {
            $installSuccess = $true
        }
    }
    'curl' {
        Write-Step "Installing via curl..."
        Write-Host "  → This requires WSL or Git Bash." -ForegroundColor Yellow
        Write-Host "  → Command: $($SelectedTool.InstallCmd)" -ForegroundColor Gray
        Write-Host ""
        Write-Host "  Please run this command in WSL or Git Bash:" -ForegroundColor Yellow
        Write-Host "  $($SelectedTool.InstallCmd)" -ForegroundColor White
        exit 0
    }
}

# ============================================================
# Result
# ============================================================

Write-Host ""

if ($installSuccess) {
    Write-Success "$($SelectedTool.Name) installed successfully!"
} else {
    Write-Fail "Installation may have failed. Please check the output above."
}

# Post-install instructions
Write-Host ""
Write-Host "  ─────────────────────────────────────────────────────" -ForegroundColor Gray
Write-Host "  接下来怎么做:" -ForegroundColor White
Write-Host ""

foreach ($step in $SelectedTool.PostInstall) {
    Write-Host "    → $step" -ForegroundColor Gray
}

Write-Host ""
