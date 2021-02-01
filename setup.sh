#!/bin/bash 

brew install reattach-to-user-namespace

if [ -d ~/.oh-my-zsh ]; then  
    echo "Skipping oh-my-zsh setup"
else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi


if [ -f ~/.oh-my-zsh/custom/themes/gruvbox.zsh-theme ]; then 
    echo "Skipping zsh gruvbox setup"
else
    brew tap homebrew/cask-fonts
    brew install --cask font-hack-nerd-font
    curl -L https://raw.githubusercontent.com/sbugzu/gruvbox-zsh/master/gruvbox.zsh-theme > ~/.oh-my-zsh/custom/themes/gruvbox.zsh-theme
    curl -L https://raw.githubusercontent.com/herrbischoff/iterm2-gruvbox/master/gruvbox.itermcolors > ~/env/gruvbox.itermcolors
    echo "Configure Iterm"
    echo "install nerd fonts"
    echo "    iTerm2 > Preferences > Profiles > Text > Non-Ascii font > Knack Regular Nerd Font Complete"
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
fi

if [ -L ~/.oh-my-zsh/custom/custom.zsh ]; then 
    echo "Skipping custom.zsh linking"
else
    ln -s ~/env/custom.zsh ~/.oh-my-zsh/custom/custom.zsh
fi

if [ -L ~/.oh-my-zsh/custom/theme.zsh ]; then 
    echo "Skipping theme.zsh linking"
else
    ln -s ~/env/theme.zsh ~/.oh-my-zsh/custom/theme.zsh
fi
