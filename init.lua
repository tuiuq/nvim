vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"

local map = vim.keymap.set

map("n", "S", "<cmd>w<CR>")
map("n", "Q", "<cmd>q<CR>")
map({ "n", "v" }, "J", "5j")
map({ "n", "v" }, "K", "5k")
map({ "n", "v" }, "H", "5h")
map({ "n", "v" }, "L", "5l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<A-]>", "<cmd>tabnext<CR>")
map("n", "<A-[>", "<cmd>tabprev<CR>")

require("core")
