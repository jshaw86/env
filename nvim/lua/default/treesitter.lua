require("nvim-treesitter.configs").setup {
  ensure_installed = { "go", "rust", "lua", "javascript", "php" },
  highlight = { enable = true },
  indent = { enable = true },
  context_commentstring = { enable = true },
}
