#!/usr/bin/env bash
# ============================================================
# AI Agent Tools Installer - 一行命令安装单个 AI Agent 工具
# ============================================================
# 用法:
#   curl -fsSL https://raw.githubusercontent.com/huanghhcri/ai-agent-installer/main/scripts/install.sh | bash -s -- <工具名>
#
# 示例:
#   curl -fsSL .../install.sh | bash -s -- claude-code
#   curl -fsSL .../install.sh | bash -s -- codex-cli
#   curl -fsSL .../install.sh | bash -s -- hermes
# ============================================================

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m'
BOLD='\033[1m'

# ============================================================
# Helper Functions
# ============================================================

print_header() {
    echo ""
    echo -e "${MAGENTA}  ═══════════════════════════════════════════════════════${NC}"
    echo -e "${MAGENTA}  $1${NC}"
    echo -e "${MAGENTA}  ═══════════════════════════════════════════════════════${NC}"
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
# Show Help if No Tool Specified
# ============================================================

TOOL="$1"

if [ -z "$TOOL" ]; then
    echo ""
    echo -e "  ${MAGENTA}🤖 AI Agent Installer${NC}"
    echo ""
    echo -e "  用法: 传入工具名作为参数"
    echo ""
    echo -e "  命令行工具:"
    echo -e "    ${BOLD}claude-code${NC}   安装 Claude Code CLI"
    echo -e "    ${BOLD}codex-cli${NC}     安装 Codex CLI (v0.80.0)"
    echo -e "    ${BOLD}hermes${NC}        安装 Hermes Agent"
    echo ""
    echo -e "  一行命令示例:"
    echo -e "    ${CYAN}curl -fsSL https://raw.githubusercontent.com/huanghhcri/ai-agent-installer/main/scripts/install.sh | bash -s -- claude-code${NC}"
    echo ""
    echo -e "  ${YELLOW}桌面应用（Claude Desktop、ChatGPT Desktop 等）请在 Windows PowerShell 中安装：${NC}"
    echo -e "    ${CYAN}winget install Anthropic.Claude${NC}"
    echo -e "    ${CYAN}winget install OpenAI.ChatGPT${NC}"
    echo -e "    ${CYAN}winget install Cursor.Cursor${NC}"
    echo ""
    exit 0
fi

# ============================================================
# Install Node.js if Needed
# ============================================================

install_node() {
    if command_exists node; then
        NODE_VERSION=$(node --version)
        print_success "Node.js $NODE_VERSION is available"
        return 0
    fi

    print_step "Node.js not found. Installing..."
    
    if command_exists apt-get; then
        curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - 2>/dev/null
        sudo apt-get install -y nodejs 2>/dev/null
    elif command_exists yum; then
        curl -fsSL https://rpm.nodesource.com/setup_lts.x | sudo -E bash - 2>/dev/null
        sudo yum install -y nodejs 2>/dev/null
    elif command_exists brew; then
        brew install node 2>/dev/null
    else
        print_fail "Cannot install Node.js automatically."
        echo "    → Please install manually: https://nodejs.org/"
        exit 1
    fi

    if command_exists node; then
        NODE_VERSION=$(node --version)
        print_success "Node.js $NODE_VERSION installed"
    else
        print_fail "Node.js installation failed"
        exit 1
    fi
}

# ============================================================
# Install Tools
# ============================================================

case "$TOOL" in
    claude-code)
        print_header "Installing Claude Code CLI"
        echo "  Anthropic 官方命令行编程 Agent"
        echo ""

        if command_exists claude; then
            print_success "Claude Code CLI is already installed"
            echo ""
            echo "  ─────────────────────────────────────────────────────" 
            echo -e "  ${BOLD}接下来怎么做:${NC}"
            echo "    → 在终端输入 'claude' 启动"
            echo "    → 首次运行会要求登录 Anthropic 账号"
            echo "    → 验证安装: claude --version"
            exit 0
        fi

        install_node

        print_step "Installing Claude Code CLI..."
        if npm install -g @anthropic-ai/claude-code 2>/dev/null; then
            print_success "Claude Code CLI installed"
        else
            print_fail "Failed to install Claude Code CLI"
            echo "    → Try manually: npm install -g @anthropic-ai/claude-code"
            exit 1
        fi

        echo ""
        echo "  ─────────────────────────────────────────────────────"
        echo -e "  ${BOLD}接下来怎么做:${NC}"
        echo "    → 在终端输入 'claude' 启动"
        echo "    → 首次运行会要求登录 Anthropic 账号"
        echo "    → 登录后就能直接和 Claude 对话写代码了"
        echo "    → 验证安装: claude --version"
        ;;

    codex-cli)
        print_header "Installing Codex CLI"
        echo "  OpenAI 命令行编程 Agent (v0.80.0)"
        echo ""

        if command_exists codex; then
            CODEX_VERSION=$(codex --version 2>/dev/null || echo "unknown")
            print_success "Codex CLI is already installed (version: $CODEX_VERSION)"
            echo ""
            echo "  ─────────────────────────────────────────────────────"
            echo -e "  ${BOLD}接下来怎么做:${NC}"
            echo "    → 设置 API Key: export OPENAI_API_KEY=***             echo "    → 在终端输入 'codex' 启动"
            echo "    → 验证安装: codex --version"
            exit 0
        fi

        install_node

        print_step "Installing Codex CLI v0.80.0..."
        if npm install -g @openai/codex@0.80.0 2>/dev/null; then
            print_success "Codex CLI installed (v0.80.0)"
        else
            print_fail "Failed to install Codex CLI"
            echo "    → Try manually: npm install -g @openai/codex@0.80.0"
            exit 1
        fi

        echo ""
        echo "  ─────────────────────────────────────────────────────"
        echo -e "  ${BOLD}接下来怎么做:${NC}"
        echo "    → 设置 API Key: export OPENAI_API_KEY=***             echo "    → 在终端输入 'codex' 启动"
        echo "    → 可用国产模型: 创建 ~/.codex/config.toml 配置"
        echo "    → 验证安装: codex --version (应显示 0.80.0)"
        echo ""
        echo -e "  ${YELLOW}使用 MiMo 国产模型:${NC}"
        echo "    mkdir -p ~/.codex"
        echo "    cat > ~/.codex/config.toml << 'EOF'"
        echo '    model = "mimo-v2.5-pro"'
        echo '    provider = "openai"'
        echo '    base_url = "https://token-plan-cn.xiaomimimo.com/v1"'
        echo '    wire_api = "chat"'
        echo "    EOF"
        ;;

    hermes)
        print_header "Installing Hermes Agent"
        echo "  Nous Research 开源 AI Agent"
        echo ""

        if command_exists hermes; then
            print_success "Hermes Agent is already installed"
            echo ""
            echo "  ─────────────────────────────────────────────────────"
            echo -e "  ${BOLD}接下来怎么做:${NC}"
            echo "    → 运行 'hermes setup' 配置模型"
            echo "    → 运行 'hermes doctor' 检查配置"
            echo "    → 文档: https://hermes-agent.nousresearch.com/docs"
            exit 0
        fi

        print_step "Installing Hermes Agent..."
        if curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash 2>/dev/null; then
            print_success "Hermes Agent installed"
        else
            print_fail "Failed to install Hermes Agent"
            echo "    → Try manually:"
            echo "    → curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash"
            exit 1
        fi

        echo ""
        echo "  ─────────────────────────────────────────────────────"
        echo -e "  ${BOLD}接下来怎么做:${NC}"
        echo "    → 运行 'hermes setup' 配置模型和 API Key"
        echo "    → 运行 'hermes doctor' 检查配置"
        echo "    → 文档: https://hermes-agent.nousresearch.com/docs"
        echo "    → 中文 Skills: https://github.com/huanghhcri/hermes-skills"
        echo ""
        echo -e "  ${YELLOW}推荐 API 提供商:${NC}"
        echo "    → OpenRouter (支持多种模型): https://openrouter.ai"
        echo "    → MiMo (国产，无需代理): https://mimo.xiaomi.com"
        echo "    → DeepSeek (国产，无需代理): https://platform.deepseek.com"
        ;;

    *)
        print_fail "Unknown tool: $TOOL"
        echo ""
        echo "  可用的工具:"
        echo "    claude-code   Claude Code CLI"
        echo "    codex-cli     Codex CLI (v0.80.0)"
        echo "    hermes        Hermes Agent"
        echo ""
        echo "  桌面应用请在 Windows PowerShell 中安装:"
        echo "    winget install Anthropic.Claude"
        echo "    winget install OpenAI.ChatGPT"
        echo "    winget install Cursor.Cursor"
        echo ""
        exit 1
        ;;
esac
