vim.opt.rtp:prepend("~/.config/nvim/lazy/lazy.nvim")

require("lazy").setup({
  -- Apariencia
  { "nvim-lualine/lualine.nvim" },
  {"nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup()

    -- Asegura que el comando :NvimTreeToggle exista
    vim.api.nvim_create_user_command("NvimTreeToggle", function()
      require("nvim-tree.api").tree.toggle()
    end, {})
  end,
  },
  { "nvim-tree/nvim-web-devicons" },
  { "morhetz/gruvbox" },  -- Tema

  -- Fuzzy finder
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- LSP y autocompletado
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },

  -- Syntax Highlighting
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Git
  { "lewis6991/gitsigns.nvim" },
})

