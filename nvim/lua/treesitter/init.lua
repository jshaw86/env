require('nvim-treesitter.configs').setup {
  ensure_installed = {"go","rust","lua","javascript","php"},
  sync_install = false,
  highlight = {
    enable = true
  },
}
