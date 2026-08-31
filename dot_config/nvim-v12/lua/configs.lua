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

vim.opt.signcolumn = "yes"

vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", {
  undercurl = true,
  sp = "NvimLightRed",
})

vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", {
  undercurl = true,
  sp = "NvimLightYellow",
})
