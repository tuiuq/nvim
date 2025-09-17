return {
  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    dependencies = {
      { "saadparwaiz1/cmp_luasnip", lazy = true },
      {
        "rafamadriz/friendly-snippets",
        lazy = true,
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
    },
  },

  -- Completion Engine
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp", lazy = true },
      { "hrsh7th/cmp-path", lazy = true },
      { "hrsh7th/cmp-buffer", lazy = true },
      { "hrsh7th/cmp-nvim-lua", lazy = true },
      { "hrsh7th/cmp-emoji", lazy = true },
      { "hrsh7th/cmp-cmdline", lazy = true },
    },
    config = function()
      require("completion").setup()
    end,
  },
}
