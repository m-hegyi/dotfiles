-- TODO: move this config to a separate file

-- Pin one position encoding for all servers so buffers don't end up
-- attached to clients that disagree (see :checkhealth vim.lsp).
vim.lsp.config('*', {
  capabilities = {
    general = { positionEncodings = { 'utf-16' } },
  },
})

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

vim.lsp.config('biome', {
  offset_encoding = 'utf-32',
  init_options = {
    settings = {
      offset_encoding = 'UTF-32'
    }
  }
})

vim.lsp.enable({'lua_ls', 'html', 'ts_ls', 'pyright', 'ruff', 'biome'})
vim.diagnostic.config({ virtual_text = true })
