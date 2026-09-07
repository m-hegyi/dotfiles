require('oil').setup({
  skip_confirm_for_simple_edits = true,
  keymaps = {
    ['<C-s>'] = "<CMD>w<CR>"
  }
})
