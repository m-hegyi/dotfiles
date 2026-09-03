local cmp = require('blink.cmp')
cmp.build():pwait()
cmp.setup({
  fuzzy = { implementation = 'prefer_rust_with_warning' },
  completion = {
    list = { selection = { preselect = true, auto_insert = true } },
    documentation = { window = { border = 'single' } }
  },
  keymap = {
    preset = 'default',
    ['<Tab>'] = { 'select_and_accept', 'fallback' },
  }
})
