#!/bin/bash 

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

if [ $? -ne 0 ]; then
    exit 1
fi

brew tap adoptopenjdk/openjdk
brew tap homebrew/cask-fonts
brew install adoptopenjdk13 nvm nvim tmux reattach-to-user-namespace tig fzf ripgrep go dsh python3 awscli ninja rustup rust-analyzer

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

if [ $? -ne 0 ]; then
   exit 1
fi

# for php language server
npm i intelephense -g

if [ -d ~/.oh-my-zsh ]; then  
    echo "Skipping oh-my-zsh setup"
else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

brew install --cask font-hack-nerd-font
curl -L https://raw.githubusercontent.com/sbugzu/gruvbox-zsh/master/gruvbox.zsh-theme > ~/.oh-my-zsh/custom/themes/gruvbox.zsh-theme
echo "Configure Iterm"
echo "install nerd fonts"
echo "    iTerm2 > Profiles > Text > Non-Ascii font > Knack Regular Nerd Font Complete"

if [ -f ~/env/gruvbox.itermcolors ]; then 
    echo "Skipping zsh gruvbox colors setup"
else
    curl -L https://raw.githubusercontent.com/herrbischoff/iterm2-gruvbox/master/gruvbox.itermcolors > ~/env/gruvbox.itermcolors
    
    echo "install gruvbox.itermcolors from this directory"
    echo "    iTerm2 Profiles -> Colors -> Color Preset"
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
    ln -s ~/env/nvim ~/.config/nvim
    curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    nvm install v12.22.1
fi

if [ -d $HOME/tools ]; then
    echo "Skipping lua language setup"
else
    mkdir -p $HOME/tools/ && cd $HOME/tools
    git clone --depth=1 git@github.com:sumneko/lua-language-server.git 

    cd lua-language-server
    # if the cloning speed is too slow, edit .gitmodules and replace github.com
    # with hub.fastgit.org, which should be faster than github.
    git submodule update --init --recursive

    # build on Linux
    cd 3rd/luamake
    compile/install.sh
    cd ../..
    ./3rd/luamake/luamake rebuild
fi

