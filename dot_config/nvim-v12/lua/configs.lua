vim.opt.ignorecase = true -- Ignore case in search
vim.opt.clipboard = "unnamedplus" -- All to copy yanked text into system clipboard

vim.opt.list = true -- show whitespace characters

vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.tabstop = 2 -- default number of spaces for a tab
vim.opt.softtabstop = 2 -- Number of spaces for a tab when editing
vim.opt.shiftwidth = 2 -- Number of spaces for autoindent

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2

vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"

vim.opt.signcolumn = "yes"

vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", {
  undercurl = true,
  sp = "NvimLightRed",
})

vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", {
  undercurl = true,
  sp = "NvimLightYellow",
})

local function toggle_diagnostics_undercurl(kind)
  local group = "DiagnosticUnderline" .. kind
  local hl = vim.api.nvim_get_hl(0, { name = group })
  hl.undercurl = not hl.undercurl

  vim.api.nvim_set_hl(0, group, {
    undercurl = hl.undercurl
  })
end

vim.api.nvim_create_user_command("ToggleDWarn", function ()
  toggle_diagnostics_undercurl("Warn")
end, {})

vim.api.nvim_create_user_command("ToggleDError", function ()
  toggle_diagnostics_undercurl("Error")
end, {})
