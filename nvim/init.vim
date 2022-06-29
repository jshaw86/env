if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" set the runtime path to include Vundle and initialize
" let Vundle manage Vundle, required
call plug#begin('~/.vim/plugged')
" lsp dependencies
Plug 'folke/lsp-colors.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'hrsh7th/nvim-cmp'
Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind-nvim'
Plug 'williamboman/nvim-lsp-installer' 
Plug 'tpope/vim-fugitive'
Plug 'simrat39/rust-tools.nvim'

" Debugging
Plug 'nvim-lua/plenary.nvim'
Plug 'mfussenegger/nvim-dap'

" syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 

" navigation
Plug 'fholgado/minibufexpl.vim'
Plug 'scrooloose/nerdtree'

" colorscheme
Plug 'sainnhe/gruvbox-material'

call plug#end()

""" basic config
syntax on
set nocompatible
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set scrolloff=8
set signcolumn=yes
set expandtab
set smartindent
set relativenumber
set hidden
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set colorcolumn=160
set termguicolors
set background=dark
highlight ColorColumn ctermbg=0 guibg=#5a524c

colorscheme gruvbox-material
set background=dark

" minibuf configuration 
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 

" gruvbox config
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection='0'

" nerd tree configuration 
let NERDTreeAutoDeleteBuffer = 1
nmap <ENTER> :NERDTreeToggle<CR>

""" language servers
lua require('lsp')
lua require('treesitter')

""" language server completion config
set completeopt=menu,menuone,noselect

