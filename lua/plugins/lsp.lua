return {
  -- LSP 配置
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      {
        "ray-x/lsp_signature.nvim",
        config = function()
          require("lsp_signature").setup({
            bind = true,
            floating_window = true,
            hint_enable = true,
            handler_opts = { border = "rounded" },
          })
        end,
      },
      {
        "folke/neodev.nvim",
        ft = "lua"
      },
    },
    config = function()
      require("lsp").setup()
    end,
  },

  -- Mason
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = true
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = "mason.nvim",
    config = true
  },

  -- LSP UI
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    opts = {
      ui = {
        border = "rounded"
      }
    }
  },

  -- null-ls
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("lsp.none_ls")
    end
  },
}
