-- ~/.config/nvim/lua/plugins/treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",                -- 每次拉取后自动更新解析器
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    -- 附加模块，一次性拉齐
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-refactor",
    "windwp/nvim-ts-autotag",        -- 自动配对/关闭标签
  },
  config = function()
    require("configs.treesitter")
  end,
}
