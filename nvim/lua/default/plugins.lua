return {
  -- UI
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "nvim-lualine/lualine.nvim" },
  { "nvim-tree/nvim-tree.lua" },
  { "nvim-tree/nvim-web-devicons" },

  -- LSP & Completion
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim", config = true },
  { "williamboman/mason-lspconfig.nvim" },
  { "WhoIsSethDaniel/mason-tool-installer.nvim" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },

  -- Rust specific
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
  },

  -- Formatting & Linting
  { "nvimtools/none-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Debugging
  { "mfussenegger/nvim-dap" },
  { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
  { "mfussenegger/nvim-dap-python" },
  { "jay-babu/mason-nvim-dap.nvim" },

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
    
  -- LLM 
  { "gsuuon/model.nvim" },


  { "ziglang/zig.vim" },
}
