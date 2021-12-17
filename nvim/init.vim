if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" set the runtime path to include Vundle and initialize
" let Vundle manage Vundle, required
call plug#begin('~/.vim/plugged')
" lsp dependencies
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer' 
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'onsails/lspkind-nvim'
Plug 'hrsh7th/nvim-cmp'

" syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 

" navigation
Plug 'fholgado/minibufexpl.vim'
Plug 'scrooloose/nerdtree'

" colorscheme
Plug 'sainnhe/gruvbox-material'

call plug#end()

"""
" CONFIGURE GRUVBOX
"""
" Available values: 'hard', 'medium'(default), 'soft'
" -----------------
let g:gruvbox_material_background = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[38;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
" -----------------


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
highlight ColorColumn ctermbg=0 guibg=lightgrey

colorscheme gruvbox-material
set background=dark

" minibuf configuration 
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 

" nerd tree configuration 
let NERDTreeAutoDeleteBuffer = 1
nmap <ENTER> :NERDTreeToggle<CR>

""" language servers
lua require('lsp')
lua require('treesitter')

""" language server completion config
set completeopt=menu,menuone,noselect

""" auto formatting
autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)


