require('nvim-treesitter').install({
  'lua',
  'html',
  'html_tags',
  'python',
  'javascript',
  'jsx',
  'typescript',
  'tsx',
  'vim',
  'vimdoc',
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})
