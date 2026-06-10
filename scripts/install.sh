#!/usr/bin/env bash
# ============================================================
# AI Agent Tools Installer - 一行命令安装单个 AI Agent 工具
# ============================================================
# 用法:
#   curl -fsSL https://raw.githubusercontent.com/huanghhcri/ai-agent-installer/main/scripts/install.sh | bash -s -- <工具名>
#
# 示例:
#   curl -fsSL .../install.sh | bash -s -- aider
#   curl -fsSL .../install.sh | bash -s -- claude-code
#   curl -fsSL .../install.sh | bash -s -- hermes
# ============================================================

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m'
BOLD='\033[1m'

print_header() {
    echo ""
    echo -e "${MAGENTA}  $1${NC}"
    echo ""
}
print_step()   { echo -e "  ${CYAN}→${NC} $1"; }
print_success(){ echo -e "  ${GREEN}✓${NC} $1"; }
print_fail()   { echo -e "  ${RED}✗${NC} $1"; }
print_warn()   { echo -e "  ${YELLOW}⚠${NC} $1"; }
command_exists(){ command -v "$1" >/dev/null 2>&1; }

install_node() {
    if command_exists node; then
        print_success "Node.js $(node --version) is available"
        return 0
    fi
    print_step "Node.js not found. Installing..."
    if command_exists apt-get; then
        curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - 2>/dev/null
        sudo apt-get install -y nodejs 2>/dev/null
    elif command_exists brew; then
        brew install node 2>/dev/null
    else
        print_fail "Cannot install Node.js automatically. Visit https://nodejs.org/"
        exit 1
    fi
    command_exists node && print_success "Node.js installed" || { print_fail "Node.js installation failed"; exit 1; }
}

install_python_pip() {
    if command_exists pip || command_exists pip3; then
        print_success "pip is available"
        return 0
    fi
    print_step "pip not found. Installing..."
    if command_exists apt-get; then
        sudo apt-get install -y python3-pip 2>/dev/null
    elif command_exists brew; then
        brew install python 2>/dev/null
    fi
    command_exists pip3 && print_success "pip installed" || { print_fail "pip installation failed"; exit 1; }
}

# ============================================================
# Help
# ============================================================

TOOL="$1"

if [ -z "$TOOL" ]; then
    echo ""
    echo -e "  ${MAGENTA}🤖 AI Agent Installer${NC}"
    echo ""
    echo -e "  用法: bash -s -- <工具名>"
    echo ""
    echo -e "  可用的 CLI 工具:"
    echo -e "    ${BOLD}claude-code${NC}   Claude Code CLI (Anthropic)"
    echo -e "    ${BOLD}codex-cli${NC}     Codex CLI (OpenAI, v0.80.0)"
    echo -e "    ${BOLD}hermes${NC}        Hermes Agent (Nous Research)"
    echo -e "    ${BOLD}aider${NC}         Aider (最流行的终端 AI 编程工具)"
    echo -e "    ${BOLD}opencode${NC}      OpenCode (开源终端编程 Agent)"
    echo -e "    ${BOLD}kiro${NC}         Kiro CLI (AWS AI 编程助手)"
    echo -e "    ${BOLD}copilot-cli${NC}   GitHub Copilot CLI"
    echo -e "    ${BOLD}cline${NC}         Cline (VS Code 扩展)"
    echo ""
    echo -e "  示例:"
    echo -e "    ${CYAN}curl -fsSL .../install.sh | bash -s -- aider${NC}"
    echo -e "    ${CYAN}curl -fsSL .../install.sh | bash -s -- claude-code${NC}"
    echo ""
    echo -e "  桌面应用请在 Windows PowerShell 中安装:"
    echo -e "    ${CYAN}winget install Anthropic.Claude${NC}"
    echo -e "    ${CYAN}winget install Anysphere.Cursor${NC}"
    echo -e "    ${CYAN}winget install Codeium.Windsurf${NC}"
    echo ""
    exit 0
fi

# ============================================================
# Install
# ============================================================

case "$TOOL" in

    claude-code)
        print_header "Installing Claude Code CLI"
        echo "  Anthropic 官方命令行编程 Agent"
        command_exists claude && { print_success "Already installed"; exit 0; }
        install_node
        print_step "Installing via npm..."
        npm install -g @anthropic-ai/claude-code 2>/dev/null && print_success "Installed" || { print_fail "Install failed"; exit 1; }
        echo ""
        echo "  接下来怎么做:"
        echo "    → 输入 'claude' 启动"
        echo "    → 首次运行会要求登录 Anthropic 账号"
        echo "    → 验证: claude --version"
        ;;

    codex-cli)
        print_header "Installing Codex CLI (v0.80.0)"
        echo "  OpenAI 命令行编程 Agent"
        command_exists codex && { print_success "Already installed ($(codex --version 2>/dev/null))"; exit 0; }
        install_node
        print_step "Installing via npm..."
        npm install -g @openai/codex@0.80.0 2>/dev/null && print_success "Installed (v0.80.0)" || { print_fail "Install failed"; exit 1; }
        echo ""
        echo "  接下来怎么做:"
        echo "    → 设置 API Key: export OPENAI_API_KEY=你的Key"
        echo "    → 输入 'codex' 启动"
        echo "    → 验证: codex --version"
        echo ""
        echo "  使用 MiMo 国产模型:"
        echo "    mkdir -p ~/.codex && cat > ~/.codex/config.toml << 'EOF'"
        echo '    model = "mimo-v2.5-pro"'
        echo '    provider = "openai"'
        echo '    base_url = "https://token-plan-cn.xiaomimimo.com/v1"'
        echo '    wire_api = "chat"'
        echo "    EOF"
        echo "    export OPENAI_API_KEY=你的MiMo_API_Key"
        ;;

    hermes)
        print_header "Installing Hermes Agent"
        echo "  Nous Research 开源 AI Agent"
        command_exists hermes && { print_success "Already installed"; exit 0; }
        print_step "Installing via official script..."
        curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash 2>/dev/null && print_success "Installed" || { print_fail "Install failed"; exit 1; }
        echo ""
        echo "  接下来怎么做:"
        echo "    → 运行 'hermes setup' 配置模型和 API Key"
        echo "    → 运行 'hermes doctor' 检查配置"
        echo "    → 文档: https://hermes-agent.nousresearch.com/docs"
        ;;

    aider)
        print_header "Installing Aider"
        echo "  最流行的终端 AI 编程工具（支持 20+ 种模型）"
        command_exists aider && { print_success "Already installed"; exit 0; }
        install_python_pip
        print_step "Installing via pip..."
        pip3 install aider-chat 2>/dev/null || pip install aider-chat 2>/dev/null
        command_exists aider && print_success "Installed" || { print_fail "Install failed"; exit 1; }
        echo ""
        echo "  接下来怎么做:"
        echo "    → 进入项目目录，输入 'aider' 启动"
        echo "    → 设置 API Key: export OPENAI_API_KEY=你的Key"
        echo "    → 使用其他模型: aider --model deepseek"
        echo "    → 使用 Claude: aider --model claude-3-5-sonnet-20241022"
        echo ""
        echo "  国产模型:"
        echo "    export DEEPSEEK_API_KEY=你的Key"
        echo "    aider --model deepseek --api-key deepseek=\$DEEPSEEK_API_KEY"
        ;;

    opencode)
        print_header "Installing OpenCode"
        echo "  开源终端编程 Agent"
        command_exists opencode && { print_success "Already installed"; exit 0; }
        print_step "Installing via official script..."
        curl -fsSL https://opencode.ai/install | bash 2>/dev/null && print_success "Installed" || { print_fail "Install failed"; exit 1; }
        echo ""
        echo "  接下来怎么做:"
        echo "    → 进入项目目录，输入 'opencode' 启动"
        echo "    → 在设置中配置 API Key"
        ;;

    kiro)
        print_header "Installing Kiro CLI"
        echo "  AWS AI 命令行编程助手（免费，原 Amazon Q Developer CLI）"
        command_exists kiro && { print_success "Already installed"; exit 0; }
        print_step "Installing via official script..."
        curl -fsSL https://cli.kiro.dev/install | bash 2>/dev/null && print_success "Installed" || { print_fail "Install failed"; exit 1; }
        echo ""
        echo "  接下来怎么做:"
        echo "    → 运行 'kiro login' 登录（免费注册）"
        echo "    → 使用 'kiro chat' 开始对话"
        echo "    → 免费使用"
        ;;

    copilot-cli)
        print_header "Installing GitHub Copilot CLI"
        echo "  GitHub AI 命令行助手"
        if command_exists gh; then
            print_success "GitHub CLI is available"
        else
            print_step "Installing GitHub CLI..."
            if command_exists brew; then
                brew install gh 2>/dev/null
            elif command_exists apt-get; then
                curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg 2>/dev/null
                echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
                sudo apt-get update 2>/dev/null && sudo apt-get install -y gh 2>/dev/null
            fi
        fi
        print_step "Installing Copilot extension..."
        gh extension install github/gh-copilot 2>/dev/null && print_success "Installed" || { print_fail "Install failed"; exit 1; }
        echo ""
        echo "  接下来怎么做:"
        echo "    → 运行 'gh auth login' 登录 GitHub"
        echo "    → 'gh copilot suggest \"列出大文件\"' 获取命令建议"
        echo "    → 'gh copilot explain \"git rebase -i\"' 解释命令"
        ;;

    cline)
        print_header "Installing Cline"
        echo "  VS Code 中的自主编程 Agent（开源）"
        if command_exists code; then
            print_step "Installing Cline extension..."
            code --install-extension saoudrizwan.claude-dev 2>/dev/null && print_success "Installed" || { print_fail "Install failed"; exit 1; }
        else
            print_fail "VS Code (code command) not found."
            echo "    → Install VS Code first, then run this command again."
            exit 1
        fi
        echo ""
        echo "  接下来怎么做:"
        echo "    → 打开 VS Code，左侧点击 Cline 图标（机器人）"
        echo "    → 配置 API Key（支持 Anthropic、OpenAI、OpenRouter 等）"
        echo "    → 在对话框描述你想做什么，Cline 会自动执行"
        ;;

    *)
        print_fail "Unknown tool: $TOOL"
        echo ""
        echo "  可用工具: claude-code, codex-cli, hermes, aider, opencode, kiro, copilot-cli, cline"
        echo "  桌面应用请在 Windows PowerShell 中安装"
        echo ""
        exit 1
        ;;
esac
