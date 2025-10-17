require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("i", "jk", "<ESC>")

map("n", "<C-h>", ":TmuxNavigateLeft<CR>", { noremap = true, silent = true })
map("n", "<C-j>", ":TmuxNavigateDown<CR>", { noremap = true, silent = true })
map("n", "<C-k>", ":TmuxNavigateUp<CR>", { noremap = true, silent = true })
map("n", "<C-l>", ":TmuxNavigateLeft<CR>", { noremap = true, silent = true })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Terminal mode
map("t", "<ESC>", "<C-\\><C-N>", { silent = true })
map("t", "jk", "<C-\\><C-N>", { silent = true })
map("t", "<C-h>", "<C-\\><C-N><C-w>h", { noremap = true, silent = true })
map("t", "<C-j>", "<C-\\><C-N><C-w>j", { noremap = true, silent = true })
map("t", "<C-k>", "<C-\\><C-N><C-w>k", { noremap = true, silent = true })
map("t", "<C-l>", "<C-\\><C-N><C-w>l", { noremap = true, silent = true })


-- telescope 
local builtin = require("telescope.builtin")

map("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "telescope document symbols" })
map("n", "<leader>fw", builtin.grep_string, { desc = "telescope find word" })
-- map("n", "<leader>fg", builtin.live_grep, { desc = "telescope live grep" })

--harpoon 
local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>a",
  function()
    local buffer_name = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
    if buffer_name ~= "" then
      harpoon:list():add()
      print("Added to harpoon:", buffer_name)
    end
  end,
  { desc = "Harpoon: add" })
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon modal list" })

-- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
-- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
-- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
-- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
--
-- -- Toggle previous & next buffers stored within Harpoon list
-- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
-- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
vim.keymap.set("n", "<leader>gc", live_grep_args_shortcuts.grep_word_under_cursor)

vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>ga", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])

vim.api.nvim_set_keymap('n', '<leader>gB', ':Gitsigns toggle_current_line_blame<CR>', { noremap = true, silent = true, desc = "Toggle current line blame (inline)" })
vim.api.nvim_set_keymap('n', '<leader>gb', ':Gitsigns blame_line<CR>', { noremap = true, silent = true, desc = "Blame current line (modal)" })
