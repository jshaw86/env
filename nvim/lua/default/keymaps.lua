local map = vim.keymap.set
local opts = { noremap = true, silent = true }
vim.opt.clipboard = "unnamedplus"
map("n", "<leader>e", ":NERDTreeToggle<CR>", opts)
map("n", "<leader>n", ":NERDTreeFind<CR>", opts)
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>rg", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "K", vim.lsp.buf.hover, opts)
map("n", "<leader>rn", vim.lsp.buf.rename, opts)
map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
map("n", "<Tab>", ":bnext<CR>", opts)
map("n", "<S-Tab>", ":bprevious<CR>", opts)
map("n", "<leader>tt", ":split | terminal<CR>", opts)
map("n", "<leader>cc", ":CopilotChatToggle<CR>", opts)
-- copy to clipboard
map("v", "<leader>y", '"+y', opts)
map("n", "<leader>cb", function()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local content = table.concat(lines, "\n")
  require("CopilotChat").ask(content)
end, opts)
