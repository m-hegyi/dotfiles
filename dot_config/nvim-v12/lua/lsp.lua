-- TODO: move this config to a separate file
vim.lsp.config('ruff', {
  init_options = {
    settings = {
      ["codeAction"] = {
        disableRuleComment = { enable = true },
        fixViolation = { enable = true },
        organizeImports = { enable = true },
      },
    },
  },
  capabilities = {
    resolveProvider = "textDocument/codeAction",
  },
  on_attach = function(_, buffer)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = buffer })
  end,
})

vim.lsp.enable({'lua_ls', 'html', 'ts_ls', 'pyright', 'ruff'})
vim.diagnostic.config({ virtual_text = true })
