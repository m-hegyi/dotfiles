local map = vim.keymap.set

-- set the global mapleader to space
vim.g.mapleader = " " 

map("n", "<C-s>", "<cmd>write<CR>", { desc = "Write file" })

map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle Nvim Tree" })
