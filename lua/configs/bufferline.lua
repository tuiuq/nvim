return {
  options = {
    numbers = "none", -- buffer 前显示编号: "none", "ordinal", "buffer_id", "both"
    diagnostics = "nvim_lsp", -- 集成 LSP 的诊断信息
    separator_style = "thick", -- 分隔样式: "slant", "padded_slant", "slope", "thick", "thin"
    show_buffer_close_icons = true, -- buffer 上显示关闭按钮
    show_close_icon = false, -- 总关闭按钮
    color_icons = true, -- 启用 nvim-web-devicons 颜色
    always_show_bufferline = true, -- 只有一个 buffer 时也显示
    offsets = {
      {
        filetype = "neo-tree", -- 适配 neo-tree
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left",
        separator = true
      }
    },
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
  },
}
