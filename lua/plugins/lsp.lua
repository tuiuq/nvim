return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim", -- LSP/DAP/Linter/Formatter 管理器
    "williamboman/mason-lspconfig.nvim", -- 让 mason 与 lspconfig 联动
    "hrsh7th/cmp-nvim-lsp", -- LSP 补全源
  },
  config = function()
    require("configs.lsp")
  end
}
