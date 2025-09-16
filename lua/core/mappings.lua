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

-- Plugins
-- NeoTree
map("n", "<A-1>", "<cmd>Neotree toggle<CR>")
-- Buffer Line
map("n", "<A-]>", "<cmd>BufferLineCycleNext<CR>")
map("n", "<A-[>", "<cmd>BufferLineCyclePrev<CR>")
-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>")
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")
map("n", "<leader>fc", "<cmd>Telescope git_commits<CR>")
map("n", "<leader>fF", "<cmd>Telescope file_browser<CR>")
