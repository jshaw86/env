local parsers = { "go", "rust", "lua", "javascript", "php", "zig", "python" }

require("nvim-treesitter").install(parsers)

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go", "rust", "lua", "javascript", "php", "zig", "python" },
  callback = function()
    vim.treesitter.start()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
