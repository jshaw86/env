" Last modified: 2019 17 19
"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
" Plugin 'vim-syntastic/syntastic'
Plugin 'gavocanov/vim-js-indent'
Plugin 'crusoexia/vim-monokai'
Plugin 'hashivim/vim-terraform'
Plugin 'w0rp/ale'

" Track the engine.
"Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

execute pathogen#infect()
" Also switch on highlighting the last used search pattern.
let python_highlight_all=1
syntax on
filetype plugin indent on    " required

" Set 'formatoptions' to break comment lines but not other lines,
" Show incomplete paragraphs
set display+=lastline

" 256 monokai color support
colorscheme monokai 
set t_Co=256

" Tabbing support by filetype
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

" More appropriate colors for black
set background=dark
highlight Folded ctermbg=white ctermfg=black

" light yellow 
highlight String ctermfg=3 
highlight Number ctermfg=3 

" highlight searches
set hlsearch

" attempt to detect filetypes of new files
filetype on
filetype plugin on
filetype plugin indent on

" auto indent
set cindent
autocmd filetype php set smartindent
autocmd filetype php set smarttab

" lets allow backspacing
set backspace=2 "indent,eol,start

" not sure, but it makes viminfo hold more information, when you exit with a
" buffer it saves it
set viminfo='1000,!,\"1000,:100,%,n~/.viminfo

" line numbers in bottom right
set ruler

" show file options
set wildmode=list:longest,full

" search
set incsearch
set hlsearch

" large history
set history=1000

" ability to skip to lines with errors (not sure how)
set cf

" default filetypes
set ffs=unix,mac,dos

" these are not word dividers
set isk+=_,$,@,%,#,-

" folding
set foldmethod=marker 

" line numbers
set number 

" small, hard tabs
set expandtab
set autoindent
set tabstop=4
set shiftwidth=4
filetype indent on

" don't know what this is for
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif 

" Make the window title reflect the file being edited
set title
set titlestring=VIM:\ %F

" Set list Chars - for showing characters that are not
" normally displayed i.e. whitespace, tabs, EOL
set listchars=trail:.,tab:>-,eol:$
set nolist

" no vi mode
set nocompatible

" error file for make
set makeef=error.err

" avoid 'press a key' prompt
set shortmess=atI

"small, hard tabs$
set noexpandtab
set tabstop=2
set shiftwidth=2

"spaces, 4 wide$
set expandtab
set tabstop=4
set shiftwidth=4

" default HTML template
autocmd BufNewFile *.htm 0r html.tmpl
autocmd BufNewFile *.html 0r html.tmpl

" Scroll into wrapped lines
map <CR> o 
map j gj
map k gk
map <C-m> :NERDTreeToggle<ENTER>
map <C-]> <C-]>:tselect<ENTER>
map jj :w<CR>:make<CR>:cw<CR>
map cn :cn<CR>
map cp :cp<CR>

nmap <F2> :.w !pbcopy<CR><CR>
vmap <F2> :w !pbcopy<CR><CR>

" Put Last modified: in your file to have date automatically added
autocmd BufWritePre,FileWritePre * ks|call LastMod()|'s
fun LastMod()
  if line("$") > 20
    let l = 20
  else
    let l = line("$")
  endif
  exe "1," . l . "g/\\(.*\\)Last modified:.*$/s/\\(.*\\)Last modified:.*$/\\1Last modified: " . strftime("%Y %V %g")
endfun

" For the buffer explorer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 

let g:syntastic_check_on_open = 1
let g:ale_linters = {'javascript': ['eslint']}

let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1

" don't ask to save every time you switch buffers, just keep it open
set hidden

set pastetoggle=<f11>

