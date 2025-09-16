local telescope = require("telescope")
local actions = require("telescope.actions")
local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup({
  defaults = {
    vimgrep_arguments = {
      "rg", "--color=never", "--no-heading", "--with-filename",
      "--line-number", "--column", "--smart-case", "--hidden",
    },
    prompt_prefix = "   ",
    selection_caret = "▶ ",
    path_display = { "truncate" },
    file_ignore_patterns = { "%.git/", "node_modules", "%.cache", "%.o", "%.a", "%.out", "%.class" },
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = { mirror = false },
      width = 0.95,
      height = 0.95,
      preview_cutoff = 120,
    },
    sorting_strategy = "ascending",
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" },
  },
  extensions = {
    file_browser = {
      hijack_netrw = true,          -- 用 telescope 代替 netrw
      grouped = true,               -- 文件夹优先
      hidden = { file_browser = true, folder_browser = true },
      mappings = {
        i = {
          ["<C-y>"] = fb_actions.create,
          ["<C-r>"] = fb_actions.rename,
          ["<C-d>"] = fb_actions.remove,
        },
      },
    },
  }
});

-- 加载扩展
telescope.load_extension("fzf")
telescope.load_extension("file_browser")
