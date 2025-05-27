vim.opt.errorbells = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.relativenumber = true
vim.opt.hidden = true
vim.opt.number = true
vim.opt.wrap = false
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("config") .. "/undodir"
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.colorcolumn = "160"
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd([[highlight ColorColumn ctermbg=0 guibg=#5a524c]])
vim.cmd([[colorscheme gruvbox-material]])
