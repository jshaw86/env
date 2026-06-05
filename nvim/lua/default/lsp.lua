require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "pyright", "ruff", "rust_analyzer" }
})
require("mason-tool-installer").setup({
  ensure_installed = { "black", "isort", "debugpy", "codelldb" }
})

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- rust_analyzer is handled by rustaceanvim
local servers = { "clangd", "pyright", "ruff", "gopls", "intelephense", "zls" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
  }
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●',
    spacing = 4,
  },
  underline = true,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
  },
})

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false })
  end,
})
