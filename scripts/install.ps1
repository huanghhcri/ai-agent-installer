#Requires -Version 5.1
<#
.SYNOPSIS
    AI Agent Tools One-Click Installer for Windows
.DESCRIPTION
    Installs AI agent desktop applications and CLI tools with a single command.
    Supports: Claude Desktop, ChatGPT Desktop, Cursor, Codex CLI, Claude Code CLI, Hermes Agent
.EXAMPLE
    # One-line install (run in PowerShell):
    irm https://raw.githubusercontent.com/huanghhcri/ai-agent-installer/main/scripts/install.ps1 | iex
    
    # Or download and run:
    .\install.ps1
.NOTES
    Author: RBL
    License: MIT
#>

param(
    [switch]$Desktop,      # Only install desktop apps
    [switch]$CLI,          # Only install CLI tools
    [switch]$All,          # Install everything (default)
    [switch]$SkipConfirm   # Skip confirmation prompts
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
    Write-Host "=" * 60 -ForegroundColor $Colors.Header
    Write-Host "  $Text" -ForegroundColor $Colors.Header
    Write-Host "=" * 60 -ForegroundColor $Colors.Header
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

function Install-WingetPackage {
    param(
        [string]$Id,
        [string]$Name,
        [string]$Source = "winget"
    )
    
    Write-Step "Installing $Name..."
    
    # Check if already installed
    $installed = winget list --id $Id --exact 2>$null | Select-String $Id
    if ($installed) {
        Write-Success "$Name is already installed"
        return $true
    }
    
    try {
        $result = winget install --id $Id --exact --accept-package-agreements --accept-source-agreements --source $Source 2>&1
        if ($LASTEXITCODE -eq 0) {
            Write-Success "$Name installed successfully"
            return $true
        } else {
            Write-Fail "Failed to install $Name (exit code: $LASTEXITCODE)"
            return $false
        }
    } catch {
        Write-Fail "Failed to install $Name : $_"
        return $false
    }
}

# ============================================================
# Pre-flight Checks
# ============================================================

Write-Header "AI Agent Tools Installer"

Write-Host "  This script will install AI agent tools on your Windows system." -ForegroundColor White
Write-Host ""

# Check Windows version
$osVersion = [System.Environment]::OSVersion.Version
Write-Step "Detected Windows $osVersion"

# Check for winget
if (-not (Test-Command "winget")) {
    Write-Fail "winget (Windows Package Manager) is not available."
    Write-Host ""
    Write-Host "  Please install App Installer from Microsoft Store:" -ForegroundColor Yellow
    Write-Host "  https://www.microsoft.com/p/app-installer/9nblggh4nns1" -ForegroundColor Yellow
    Write-Host ""
    exit 1
}
Write-Success "winget is available"

# Check for Node.js (needed for CLI tools)
$hasNode = Test-Command "node"
if ($hasNode) {
    $nodeVersion = node --version
    Write-Success "Node.js $nodeVersion is available"
} else {
    Write-Warn "Node.js not found. CLI tools will require Node.js."
}

Write-Host ""

# ============================================================
# Installation Mode Selection
# ============================================================

if (-not $Desktop -and -not $CLI -and -not $All) {
    $All = $true
}

$installDesktop = $Desktop -or $All
$installCLI = $CLI -or $All

# ============================================================
# Desktop Applications
# ============================================================

if ($installDesktop) {
    Write-Header "Desktop Applications"
    
    $desktopApps = @(
        @{
            Id = "Anthropic.Claude"
            Name = "Claude Desktop"
            Description = "Anthropic's Claude AI desktop app"
        },
        @{
            Id = "OpenAI.ChatGPT"
            Name = "ChatGPT Desktop"
            Description = "OpenAI's ChatGPT desktop app"
        },
        @{
            Id = "Cursor.Cursor"
            Name = "Cursor"
            Description = "AI-powered code editor"
        }
    )
    
    $desktopResults = @{}
    
    foreach ($app in $desktopApps) {
        Write-Host ""
        Write-Host "  [$($app.Name)]" -ForegroundColor White
        Write-Host "  $($app.Description)" -ForegroundColor Gray
        $desktopResults[$app.Name] = Install-WingetPackage -Id $app.Id -Name $app.Name
    }
    
    # Try Codex Desktop (Microsoft Store)
    Write-Host ""
    Write-Host "  [Codex Desktop]" -ForegroundColor White
    Write-Host "  OpenAI's Codex desktop app (Microsoft Store)" -ForegroundColor Gray
    Write-Step "Checking Microsoft Store..."
    
    # Codex is a Microsoft Store app, try installing via winget with store source
    try {
        $codexResult = winget install --id "OpenAI.Codex" --accept-package-agreements --accept-source-agreements --source msstore 2>&1
        if ($LASTEXITCODE -eq 0) {
            Write-Success "Codex Desktop installed successfully"
            $desktopResults["Codex Desktop"] = $true
        } else {
            # Try without source specification
            $codexResult = winget install --id "OpenAI.Codex" --accept-package-agreements --accept-source-agreements 2>&1
            if ($LASTEXITCODE -eq 0) {
                Write-Success "Codex Desktop installed successfully"
                $desktopResults["Codex Desktop"] = $true
            } else {
                Write-Warn "Codex Desktop not found in winget. Install manually from Microsoft Store."
                Write-Host "    → Search 'Codex' in Microsoft Store or visit:" -ForegroundColor Gray
                Write-Host "    → https://apps.microsoft.com/search?query=codex" -ForegroundColor Gray
                $desktopResults["Codex Desktop"] = $false
            }
        }
    } catch {
        Write-Warn "Codex Desktop: Please install from Microsoft Store manually"
        $desktopResults["Codex Desktop"] = $false
    }
}

# ============================================================
# CLI Tools
# ============================================================

if ($installCLI) {
    Write-Header "CLI Tools"
    
    # Check Node.js
    if (-not $hasNode) {
        Write-Host ""
        Write-Step "Installing Node.js (required for CLI tools)..."
        $nodeResult = Install-WingetPackage -Id "OpenJS.NodeJS.LTS" -Name "Node.js LTS"
        if ($nodeResult) {
            Write-Warn "Node.js installed. Please restart PowerShell and run this script again."
            Write-Host "  Or install CLI tools manually:" -ForegroundColor Yellow
            Write-Host "  npm install -g @anthropic-ai/claude-code" -ForegroundColor Yellow
            Write-Host "  npm install -g @openai/codex" -ForegroundColor Yellow
            exit 0
        }
    }
    
    $cliTools = @(
        @{
            Name = "Claude Code CLI"
            Command = "npm install -g @anthropic-ai/claude-code"
            TestCmd = "claude"
        },
        @{
            Name = "Codex CLI"
            Command = "npm install -g @openai/codex"
            TestCmd = "codex"
        },
        @{
            Name = "Hermes Agent"
            Command = "curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash"
            TestCmd = "hermes"
            Note = "Requires WSL or Git Bash"
        }
    )
    
    $cliResults = @{}
    
    foreach ($tool in $cliTools) {
        Write-Host ""
        Write-Host "  [$($tool.Name)]" -ForegroundColor White
        
        # Check if already installed
        if (Test-Command $tool.TestCmd) {
            Write-Success "$($tool.Name) is already installed"
            $cliResults[$tool.Name] = $true
            continue
        }
        
        Write-Step "Installing $($tool.Name)..."
        
        if ($tool.Name -eq "Hermes Agent") {
            Write-Warn "Hermes Agent requires WSL or Git Bash"
            Write-Host "    → In WSL: curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash" -ForegroundColor Gray
            Write-Host "    → Or visit: https://hermes-agent.nousresearch.com/docs" -ForegroundColor Gray
            $cliResults[$tool.Name] = $false
            continue
        }
        
        try {
            Invoke-Expression $tool.Command 2>&1 | Out-Null
            if (Test-Command $tool.TestCmd) {
                Write-Success "$($tool.Name) installed successfully"
                $cliResults[$tool.Name] = $true
            } else {
                Write-Fail "$($tool.Name) installation may have failed"
                $cliResults[$tool.Name] = $false
            }
        } catch {
            Write-Fail "Failed to install $($tool.Name): $_"
            $cliResults[$tool.Name] = $false
        }
    }
}

# ============================================================
# Summary
# ============================================================

Write-Header "Installation Summary"

if ($installDesktop) {
    Write-Host "  Desktop Applications:" -ForegroundColor White
    foreach ($app in $desktopApps) {
        $status = if ($desktopResults[$app.Name]) { "✓" } else { "✗" }
        $color = if ($desktopResults[$app.Name]) { 'Green' } else { 'Red' }
        Write-Host "    $status $($app.Name)" -ForegroundColor $color
    }
    $codexStatus = if ($desktopResults["Codex Desktop"]) { "✓" } else { "⚠ Manual install needed" }
    $codexColor = if ($desktopResults["Codex Desktop"]) { 'Green' } else { 'Yellow' }
    Write-Host "    $codexStatus Codex Desktop" -ForegroundColor $codexColor
}

if ($installCLI) {
    Write-Host ""
    Write-Host "  CLI Tools:" -ForegroundColor White
    foreach ($tool in $cliTools) {
        $status = if ($cliResults[$tool.Name]) { "✓" } else { "✗" }
        $color = if ($cliResults[$tool.Name]) { 'Green' } else { 'Red' }
        Write-Host "    $status $($tool.Name)" -ForegroundColor $color
    }
}

Write-Host ""
Write-Host "  ─────────────────────────────────────────────────────" -ForegroundColor Gray
Write-Host ""
Write-Host "  Next Steps:" -ForegroundColor White
Write-Host ""
Write-Host "  1. Launch Claude Desktop from Start Menu" -ForegroundColor Gray
Write-Host "  2. Configure your API keys:" -ForegroundColor Gray
Write-Host "     → Claude Desktop: Settings → API Keys" -ForegroundColor Gray
Write-Host "     → Claude Code CLI: claude config" -ForegroundColor Gray
Write-Host "     → Codex CLI: set OPENAI_API_KEY environment variable" -ForegroundColor Gray
Write-Host "     → Hermes Agent: hermes setup" -ForegroundColor Gray
Write-Host ""
Write-Host "  For Chinese developers:" -ForegroundColor Yellow
Write-Host "  → Configure proxy: set https_proxy=http://127.0.0.1:7897" -ForegroundColor Gray
Write-Host "  → Use MiMo API: see https://github.com/huanghhcri/hermes-skills" -ForegroundColor Gray
Write-Host ""
