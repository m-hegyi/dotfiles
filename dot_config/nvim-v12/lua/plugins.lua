vim.pack.add({
  { src = 'https://github.com/mason-org/mason.nvim' },
})

require('mason').setup()

vim.pack.add({
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/nvim-tree/nvim-tree.lua' },
})

require('nvim-tree').setup()
