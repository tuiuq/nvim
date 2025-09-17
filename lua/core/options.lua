-- signColumn
vim.opt.signcolumn = "yes"

-- Number
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4

-- Colors
vim.opt.termguicolors = true

-- System Clipboard
vim.opt.clipboard = "unnamedplus"

-- indent
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.g.clipboard = {
  name = "xclip-clean",
  copy = {
    ["+"] = { "xclip-clean", "-selection", "clipboard" },
    ["*"] = { "xclip-clean", "-selection", "primary" },
  },
  paste = {
    ["+"] = { "xclip-clean", "-selection", "clipboard", "-o" },
    ["*"] = { "xclip-clean", "-selection", "primary", "-o" },
  }
}
