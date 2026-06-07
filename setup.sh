#!/bin/bash

# Exit on error, undefined variables, and pipe failures
set -euo pipefail

echo "Starting environment setup..."

# 1. Install Homebrew if not present
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Dynamically set Homebrew environment
if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -f /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

BREW_PREFIX=$(brew --prefix)

# 2. Brew Packages
echo "Installing/Updating Brew packages..."
brew update
brew install zig zls nvm nvim tmux reattach-to-user-namespace \
    tig fzf ripgrep go dsh python3 expat pipx awscli ninja rustup \
    lua-language-server temurin

# 3. Pipx and Python tools
echo "Setting up Python tools..."
pipx ensurepath
for tool in black isort ruff debugpy; do
    if ! pipx list | grep -q "$tool"; then
        pipx install "$tool"
    else
        pipx upgrade "$tool"
    fi
done

# 4. Rust setup
echo "Initializing Rust..."
if [ -f "$BREW_PREFIX/opt/rustup/bin/rustup-init" ]; then
    "$BREW_PREFIX/opt/rustup/bin/rustup-init" -y --default-toolchain stable --component rust-analyzer
    # shellcheck source=/dev/null
    [ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
fi

# 5. NVM & Node.js
echo "Setting up Node.js..."
export NVM_DIR="$HOME/.nvm"
mkdir -p "$NVM_DIR"
# shellcheck source=/dev/null
[ -s "$BREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$BREW_PREFIX/opt/nvm/nvm.sh"

if ! command -v node &> /dev/null || [[ $(node -v) != v22* ]]; then
    nvm install 22
    nvm alias default 22
    nvm use default
fi

# Now that Node/NPM is ready, install global packages
echo "Installing global NPM packages..."
npm install -g intelephense

# 6. Oh-My-Zsh & Themes
if [ ! -d ~/.oh-my-zsh ]; then
    echo "Installing Oh-My-Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

echo "Setting up fonts and themes..."
brew install --cask font-hack-nerd-font

THEME_DEST="$HOME/.oh-my-zsh/custom/themes/gruvbox.zsh-theme"
if [ ! -f "$THEME_DEST" ]; then
    mkdir -p "$(dirname "$THEME_DEST")"
    curl -fsSL https://raw.githubusercontent.com/sbugzu/gruvbox-zsh/master/gruvbox.zsh-theme > "$THEME_DEST"
fi

# 7. Tmux Configuration
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

if [ ! -L ~/.tmux.conf ]; then
    ln -sf ~/env/.tmux.conf ~/.tmux.conf
fi

# 8. Zsh Configuration linking
echo "Linking Zsh configurations..."
mkdir -p ~/.oh-my-zsh/custom
ln -sf ~/env/custom.zsh ~/.oh-my-zsh/custom/custom.zsh
ln -sf ~/env/theme.zsh ~/.oh-my-zsh/custom/theme.zsh
ln -sf ~/env/.zshenv ~/.zshenv

# 9. Neovim & Ghostty
echo "Linking application configs..."
mkdir -p ~/.config
if [ ! -L ~/.config/nvim ]; then
    ln -sf ~/env/nvim ~/.config/nvim
fi

if [ ! -L ~/.config/ghostty ]; then
    ln -sf ~/env/ghostty ~/.config/ghostty
fi

echo "Setup complete!"
echo "Next steps:"
echo "1. Restart your terminal or source ~/.zshrc"
echo "2. Open tmux and press 'prefix + I' to install plugins"
