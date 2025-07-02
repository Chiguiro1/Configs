local map = vim.keymap.set
map("n", "<Space>", "<Nop>")
vim.g.mapleader = " "

map("n", "<leader>e", ":NvimTreeToggle<CR>")
map("n", "<leader>ff", ":Telescope find_files<CR>")
map("n", "<leader>fg", ":Telescope live_grep<CR>")
map("n", "<leader>fb", ":Telescope buffers<CR>")

