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

vim.api.nvim_create_user_command("DiagToggleW", function ()
  toggle_diagnostics_undercurl("Warn")
end, {})

vim.api.nvim_create_user_command("DiagToggleE", function ()
  toggle_diagnostics_undercurl("Error")
end, {})

local function extract_json(str)
  local start_pos = str:find('{')
  if not start_pos then return nil end

  local brace_count = 0
  local end_pos = start_pos

  for i = start_pos, #str do
    local char = str:sub(i, i)
    if char == '{' then
      brace_count = brace_count + 1
    elseif char == '}' then
      brace_count = brace_count - 1
      if brace_count == 0 then
        end_pos = i
        break
      end
    end
  end

  return str:sub(start_pos, end_pos)
end

local function hasLspClient(name)
  local clients = vim.lsp.get_clients({ bufnr = 0 })

  for _, client in ipairs(clients) do
    if client.name == name then
      return true
    end
  end

  return false
end


local function biomeReportToQfList(diagnostics)
  local qf_items = {}
  for _, diag in ipairs(diagnostics) do
    if diag.location then
      table.insert(qf_items, {
        filename = diag.location.path,
        lnum = diag.location.range.start.line + 1,
        col = diag.location.range.start.column + 1,
        text = diag.message,
        type = diag.severity == 'error' and 'E' or 'W'
      })
    end
  end

  return qf_items
end

vim.api.nvim_create_user_command("BiomeCheck", function ()
  local has_biome = hasLspClient('biome')

  if not has_biome then
    vim.notify('BiomeCheck: Biome LSP not attached', vim.log.levels.WARN)
    return
  end

  local file = vim.fn.expand('%')
  local output = vim.fn.system('biome check --reporter=rdjson ' .. file)

  local json_str = extract_json(output)

  local ok, result = pcall(vim.fn.json_decode, json_str)

  if not ok or not result.diagnostics then
    return
  end

  local qf_items = biomeReportToQfList(result.diagnostics)

  vim.fn.setqflist(qf_items)
  vim.cmd('copen')
end, {})

vim.api.nvim_create_user_command("BiomeFix", function ()
  local has_biome = hasLspClient('biome')

  if not has_biome then
    vim.notify('BiomeFix: Biome LSP not attached', vim.log.levels.WARN)
    return
  end

  local file = vim.fn.expand('%')
  local output = vim.fn.system('biome check --write --reporter=rdjson' .. file)

  local json_str = extract_json(output)
  local ok, result = pcall(vim.fn.json_decode, json_str)

  if not ok or not result.diagnostics then
    vim.notify('BiomeFix: Something was not ok', vim.log.levels.ERROR)
    return
  end

  vim.cmd('e')
end, {})
