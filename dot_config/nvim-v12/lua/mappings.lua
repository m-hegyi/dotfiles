local map = vim.keymap.set

-- set the global mapleader to space
vim.g.mapleader = " "

map("n", "<C-s>", "<cmd>write<CR>", { desc = "Write file" })

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

-- Visual mode: Move selected lines up/down
map("v", "<C-j>", ":move '>+1<CR>gv", { noremap = true, silent = true, desc = "Move line(s) down" })
map("v", "<C-k>", ":move '<-2<CR>gv", { noremap = true, silent = true, desc = "Move line(s) up" })

-- fff
local fff = require('fff')
map("n", "ff", function() fff.find_files() end, { desc = "FFFind files" })
map("n", "fg", function() fff.live_grep() end, { desc = "Live grep" })

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
