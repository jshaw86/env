#!/bin/bash 

brew tap adoptopenjdk/openjdk
brew install adoptopenjdk13 nvm nvim tmux reattach-to-user-namespace tig fzf ripgrep go dsh python3 awscli

if [ -d ~/.oh-my-zsh ]; then  
    echo "Skipping oh-my-zsh setup"
else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi


if [ -f ~/.oh-my-zsh/custom/themes/gruvbox.zsh-theme ]; then 
    echo "Skipping zsh gruvbox font setup"
else
    brew tap homebrew/cask-fonts
    brew install --cask font-hack-nerd-font
    curl -L https://raw.githubusercontent.com/sbugzu/gruvbox-zsh/master/gruvbox.zsh-theme > ~/.oh-my-zsh/custom/themes/gruvbox.zsh-theme
    echo "Configure Iterm"
    echo "install nerd fonts"
    echo "    iTerm2 > Preferences > Profiles > Text > Non-Ascii font > Knack Regular Nerd Font Complete"
fi

if [ -f ~/env/gruvbox.itermcolors ]; then 
    echo "Skipping zsh gruvbox colors setup"
else
    curl -L https://raw.githubusercontent.com/herrbischoff/iterm2-gruvbox/master/gruvbox.itermcolors > ~/env/gruvbox.itermcolors
    
    echo "install gruvbox.itermcolors from this directory"
    echo "    iTerm2 Preferences -> Profiles -> Colors -> Color Preset"
fi

if [ -d ~/.tmux/plugins/tpm ]; then
    echo "Skipping tpm setup"
else
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

if [ -L ~/.tmux.conf ]; then
    echo "Skipping tmux.conf linking"
else
    ln -s ~/env/.tmux.conf ~/.tmux.conf  
    echo "Open tmux and type prefix + I to load theme"
fi

if [ -L ~/.oh-my-zsh/custom/custom.zsh ]; then 
    echo "Skipping custom.zsh linking"
else
    ln -s ~/env/custom.zsh ~/.oh-my-zsh/custom/custom.zsh
    cp ~/env/.zshenv ~/.zshenv
fi

if [ -L ~/.oh-my-zsh/custom/theme.zsh ]; then 
    echo "Skipping theme.zsh linking"
else
    ln -s ~/env/theme.zsh ~/.oh-my-zsh/custom/theme.zsh
fi

if [ -d ~/.config/nvim ]; then 
    echo "Skipping vimrc linking"
else
    mkdir -p ~/.config/nvim/
    curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ln -s ~/env/.vimrc ~/.config/nvim/init.vim
    nvm install v12.22.1
fi
