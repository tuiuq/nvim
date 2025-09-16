return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- 性能加速 + fzf 排序
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    -- 文件浏览器
    "nvim-telescope/telescope-file-browser.nvim",
  },
  config = function()
    require("configs.telescope")
  end
}
