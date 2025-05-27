return {
  -- UI
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "nvim-lualine/lualine.nvim" },
  { "nvim-tree/nvim-tree.lua" },
  { "nvim-tree/nvim-web-devicons" },

  -- LSP & Completion
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Git
  { "lewis6991/gitsigns.nvim" },

  -- Color Scheme
  { "sainnhe/gruvbox-material"},

  -- Fuzzy finder
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- Navigation
  { "folke/which-key.nvim" },
  { "windwp/nvim-autopairs", event = "InsertEnter", config = true },
  { "preservim/nerdtree" },
  { "fholgado/minibufexpl.vim" },

  -- LLM: Copilot Chat or CodeGPT
  { "zbirenbaum/copilot.lua" },
  { "zbirenbaum/copilot-cmp" },
  { "CopilotC-Nvim/CopilotChat.nvim", dependencies = { "nvim-lua/plenary.nvim" } },


}

