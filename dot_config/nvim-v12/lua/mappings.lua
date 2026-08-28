local map = vim.keymap.set

-- set the global mapleader to space
vim.g.mapleader = " "

map("n", "<C-s>", "<cmd>write<CR>", { desc = "Write file" })

map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle Nvim Tree" })

-- vim-tmux navigator 
map("n", "<C-h>", ":TmuxNavigateLeft<CR>", { noremap = true, silent = true })
map("n", "<C-j>", ":TmuxNavigateDown<CR>", { noremap = true, silent = true })
map("n", "<C-k>", ":TmuxNavigateUp<CR>", { noremap = true, silent = true })
map("n", "<C-l>", ":TmuxNavigateLeft<CR>", { noremap = true, silent = true })

-- navigation
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
