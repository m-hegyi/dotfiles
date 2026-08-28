vim.pack.add({
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/nvim-tree/nvim-tree.lua' },
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/christoomey/vim-tmux-navigator' },
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },
  { src = 'https://github.com/saghen/blink.lib' },
  { src = 'https://github.com/saghen/blink.cmp' },
})

require('mason').setup()
require('nvim-tree').setup()
require('gitsigns').setup()

local cmp = require('blink.cmp')
cmp.build():pwait()
cmp.setup({
  completion = {
    list = { selection = { preselect = false, auto_insert = true } },
  },
  keymap = {
    preset = 'default',
    ['<CR>'] = { 'accept' },
  },
})
