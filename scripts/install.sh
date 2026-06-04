#!/usr/bin/env bash
# ============================================================
# AI Agent Tools One-Click Installer for WSL / Linux / macOS
# ============================================================
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/huanghhcri/ai-agent-installer/main/scripts/install.sh | bash
#
#   Or with options:
#   curl -fsSL .../install.sh | bash -s -- --cli
#   curl -fsSL .../install.sh | bash -s -- --help
# ============================================================

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# ============================================================
# Helper Functions
# ============================================================

print_header() {
    echo ""
    echo -e "${MAGENTA}============================================================${NC}"
    echo -e "${MAGENTA}  $1${NC}"
    echo -e "${MAGENTA}============================================================${NC}"
    echo ""
}

print_step() {
    echo -e "  ${CYAN}→${NC} $1"
}

print_success() {
    echo -e "  ${GREEN}✓${NC} $1"
}

print_fail() {
    echo -e "  ${RED}✗${NC} $1"
}

print_warn() {
    echo -e "  ${YELLOW}⚠${NC} $1"
}

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# ============================================================
# Parse Arguments
# ============================================================

INSTALL_CLI=true

for arg in "$@"; do
    case $arg in
        --cli)
            INSTALL_CLI=true
            shift
            ;;
        --help|-h)
            echo "Usage: install.sh [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  --cli    Install CLI tools only (default)"
            echo "  --help   Show this help"
            echo ""
            echo "One-line install:"
            echo "  curl -fsSL https://raw.githubusercontent.com/huanghhcri/ai-agent-installer/main/scripts/install.sh | bash"
            exit 0
            ;;
    esac
done

# ============================================================
# Detect OS
# ============================================================

detect_os() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "macos"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if grep -qi microsoft /proc/version 2>/dev/null; then
            echo "wsl"
        else
            echo "linux"
        fi
    else
        echo "unknown"
    fi
}

OS=$(detect_os)

# ============================================================
# Pre-flight Checks
# ============================================================

print_header "AI Agent Tools Installer"

echo -e "  Detected OS: ${BOLD}$OS${NC}"
echo ""

# ============================================================
# CLI Tools Installation
# ============================================================

if $INSTALL_CLI; then
    print_header "CLI Tools Installation"
    
    # ─────────────────────────────────────────────────────
    # Node.js (required for most CLI tools)
    # ─────────────────────────────────────────────────────
    if ! command_exists node; then
        print_step "Node.js not found. Installing..."
        
        case $OS in
            macos)
                if command_exists brew; then
                    brew install node
                else
                    print_fail "Homebrew not found. Please install Node.js manually:"
                    echo "    → https://nodejs.org/"
                    exit 1
                fi
                ;;
            wsl|linux)
                # Install Node.js via nvm or direct download
                if command_exists apt-get; then
                    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
                    sudo apt-get install -y nodejs
                elif command_exists yum; then
                    curl -fsSL https://rpm.nodesource.com/setup_lts.x | sudo -E bash -
                    sudo yum install -y nodejs
                else
                    print_fail "Cannot install Node.js automatically."
                    echo "    → Please install manually: https://nodejs.org/"
                    exit 1
                fi
                ;;
        esac
        
        if command_exists node; then
            NODE_VERSION=$(node --version)
            print_success "Node.js $NODE_VERSION installed"
        else
            print_fail "Node.js installation failed"
            exit 1
        fi
    else
        NODE_VERSION=$(node --version)
        print_success "Node.js $NODE_VERSION is available"
    fi
    
    echo ""
    
    # ─────────────────────────────────────────────────────
    # Claude Code CLI
    # ─────────────────────────────────────────────────────
    echo -e "  [${BOLD}Claude Code CLI${NC}]"
    echo "  Anthropic's official coding agent"
    
    if command_exists claude; then
        print_success "Claude Code CLI is already installed"
    else
        print_step "Installing Claude Code CLI..."
        if npm install -g @anthropic-ai/claude-code 2>/dev/null; then
            print_success "Claude Code CLI installed"
        else
            print_fail "Failed to install Claude Code CLI"
            echo "    → Try manually: npm install -g @anthropic-ai/claude-code"
        fi
    fi
    
    echo ""
    
    # ─────────────────────────────────────────────────────
    # Codex CLI
    # ─────────────────────────────────────────────────────
    echo -e "  [${BOLD}Codex CLI${NC}]"
    echo "  OpenAI's coding agent (pinned to v0.80.0 for compatibility)"
    
    if command_exists codex; then
        CODEX_VERSION=$(codex --version 2>/dev/null || echo "unknown")
        print_success "Codex CLI is already installed (version: $CODEX_VERSION)"
    else
        print_step "Installing Codex CLI v0.80.0..."
        if npm install -g @openai/codex@0.80.0 2>/dev/null; then
            print_success "Codex CLI installed (v0.80.0)"
        else
            print_fail "Failed to install Codex CLI"
            echo "    → Try manually: npm install -g @openai/codex@0.80.0"
        fi
    fi
    
    echo ""
    
    # ─────────────────────────────────────────────────────
    # Hermes Agent
    # ─────────────────────────────────────────────────────
    echo -e "  [${BOLD}Hermes Agent${NC}]"
    echo "  Open-source AI agent by Nous Research"
    
    if command_exists hermes; then
        print_success "Hermes Agent is already installed"
    else
        print_step "Installing Hermes Agent..."
        if curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash 2>/dev/null; then
            print_success "Hermes Agent installed"
        else
            print_fail "Failed to install Hermes Agent"
            echo "    → Try manually: curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash"
        fi
    fi
    
    echo ""
    
    # ─────────────────────────────────────────────────────
    # OpenCode (optional)
    # ─────────────────────────────────────────────────────
    echo -e "  [${BOLD}OpenCode${NC}]"
    echo "  Open-source coding agent"
    
    if command_exists opencode; then
        print_success "OpenCode is already installed"
    else
        print_step "Installing OpenCode..."
        if npm install -g @anthropic-ai/opencode 2>/dev/null; then
            print_success "OpenCode installed"
        else
            # Try alternative installation
            print_warn "OpenCode not available via npm. Trying alternative..."
            if curl -fsSL https://opencode.ai/install | bash 2>/dev/null; then
                print_success "OpenCode installed"
            else
                print_fail "Failed to install OpenCode"
                echo "    → Visit: https://opencode.ai"
            fi
        fi
    fi
fi

# ============================================================
# Summary
# ============================================================

print_header "Installation Summary"

echo -e "  ${BOLD}CLI Tools:${NC}"
echo ""

for tool in "claude:Claude Code CLI" "codex:Codex CLI" "hermes:Hermes Agent" "opencode:OpenCode"; do
    cmd="${tool%%:*}"
    name="${tool##*:}"
    if command_exists "$cmd"; then
        echo -e "    ${GREEN}✓${NC} $name"
    else
        echo -e "    ${RED}✗${NC} $name"
    fi
done

echo ""
echo -e "  ${YELLOW}─────────────────────────────────────────────────────${NC}"
echo ""
echo -e "  ${BOLD}Next Steps:${NC}"
echo ""
echo "  1. Configure your API keys:"
echo "     → Claude Code: claude config"
echo "     → Codex CLI: export OPENAI_API_KEY=your_key"
echo "     → Hermes Agent: hermes setup"
echo ""
echo -e "  ${YELLOW}For Chinese developers:${NC}"
echo "  → Configure proxy: export https_proxy=http://127.0.0.1:7897"
echo "  → WSL proxy: export https_proxy=http://\$(cat /etc/resolv.conf | grep nameserver | awk '{print \$2}'):7897"
echo "  → Use MiMo API: see https://github.com/huanghhcri/hermes-skills"
echo ""
