local map = vim.keymap.set

-- set the global mapleader to space
vim.g.mapleader = " "

map("n", "<C-s>", "<cmd>write<CR>", { desc = "Write file" })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General clear highlight" })

-- vim-tmux navigator
map("n", "<C-h>", ":TmuxNavigateLeft<CR>", { silent = true })
map("n", "<C-j>", ":TmuxNavigateDown<CR>", { silent = true })
map("n", "<C-k>", ":TmuxNavigateUp<CR>", { silent = true })
map("n", "<C-l>", ":TmuxNavigateRight<CR>", { silent = true })

-- Insert navigation
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })
map("i", "<C-l>", "<Right>", { desc = "move right" })

-- CMD line navigation
map("c", "<C-h>", "<Left>", { desc = "move left" })
map("c", "<C-j>", "<Down>", { desc = "move down" })
map("c", "<C-k>", "<Up>", { desc = "move up" })
map("c", "<C-l>", "<Right>", { desc = "move right" })

-- Visual mode: Move selected lines up/down
map("v", "<C-j>", ":move '>+1<CR>gv", { silent = true, desc = "Move line(s) down" })
map("v", "<C-k>", ":move '<-2<CR>gv", { silent = true, desc = "Move line(s) up" })

-- Lsp-
map("n", "grd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Jump to definition" })

-- fff
local fff = require('fff')
map("n", "ff", function() fff.find_files() end, { desc = "FFFind files" })
map("n", "fg", function() fff.live_grep() end, { desc = "Live grep" })

-- oil
map("n", "-", "<cmd>e .<CR>", { desc = "Open Oil" })
map("n", "<C-_>", function () require("oil").open() end, { desc = "Open Oil in the current buffers' path" })

-- lazygit
map("n", "<leader>lg", "<cmd>LazyGit<CR>", { desc = "Open lazygit" })

-- built in select
vim.keymap.set('n', '<leader>sh', function()
  local tags = vim.fn.getcompletion('', 'help')

  vim.ui.select(tags, {
    prompt = 'Help: ',
  }, function(tag)
    if tag then
      vim.cmd('help ' .. tag)
    end
  end)
end, { desc = 'Search help' })
