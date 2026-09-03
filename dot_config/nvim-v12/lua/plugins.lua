vim.pack.add({
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/christoomey/vim-tmux-navigator' },
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },
  { src = 'https://github.com/saghen/blink.lib' },
  { src = 'https://github.com/saghen/blink.cmp' },
  { src = 'https://github.com/saghen/blink.pairs' },
  { src = 'https://github.com/dmtrKovalenko/fff' },
  { src = 'https://github.com/nvim-mini/mini.icons', version = 'stable' },
  { src = 'https://github.com/stevearc/oil.nvim' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  -- Do I really need this extra picker?
  { src = 'https://github.com/nvim-mini/mini.pick' },
  { src = 'https://github.com/folliehiyuki/diffview.nvim', version = 'mini-icons' },
})

require('mason').setup()
require('gitsigns').setup()

local pairs = require('blink.pairs')
pairs.build():pwait()
pairs.setup()

-- require('fff.download').download_or_build_binary()
require('fff').setup({
  keymaps = {
    cycle_previous_query = '<C-k>',
    cycle_forward_query = '<C-j>',
  }
})

require('mini.icons').setup()
require('oil').setup()
require('mini.pick').setup()
