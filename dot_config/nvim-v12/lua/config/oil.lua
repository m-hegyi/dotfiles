local detail = false
require('oil').setup({
  skip_confirm_for_simple_edits = true,
  keymaps = {
    ['<C-s>'] = "<CMD>w<CR>",
    ['<C-h>'] = false, -- actions.select - horizontal
    ['<C-l>'] = false, -- actions.refresh
    ['gd'] = {
      desc = "Toggle file detail view",
      callback = function ()
        detail = not detail
        if detail then
          require('oil').set_columns({ "permission", "size", "mtime", "icon" })
        else
          require('oil').set_columns({ "icon" })
        end
      end
    }
  }
})
