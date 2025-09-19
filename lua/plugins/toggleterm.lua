return {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = require("configs.toggleterm"),
  config = function (_, opts)
    require("toggleterm").setup(opts)
    require("configs.lazygit")
  end
}
