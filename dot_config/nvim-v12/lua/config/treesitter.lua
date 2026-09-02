require('nvim-treesitter').install({
  'lua',
  'python',
  'javascript',
  'typescript',
  'vim',
  'vimdoc'
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})
