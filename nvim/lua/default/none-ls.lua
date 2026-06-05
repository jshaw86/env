local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
    -- ruff is already an LSP, so we might not need it here for diagnostics
  },
})
