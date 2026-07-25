-- Disable macro recording on 'q'
vim.keymap.set({"n", "v", "x"}, "q", "<Nop>", { desc = "Disable macro recording", silent = true })

-- Move tabs
vim.keymap.set("n", "<leader><Tab>{", "<cmd>-tabmove<cr>", { desc = "Move Tab Left" })
vim.keymap.set("n", "<leader><Tab>}", "<cmd>+tabmove<cr>", { desc = "Move Tab Right" })

-- Terminal mode escape
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keep indentation spaces on empty lines when hitting Esc
vim.keymap.set("i", "<Esc>", function()
  local line = vim.api.nvim_get_current_line()
  if line:match("^%s*$") and #line > 0 then
    return "<Space><BS><Esc>"
  else
    return "<Esc>"
  end
end, { expr = true, desc = "Preserve indent on Esc" })

-- Trim trailing whitespace
vim.keymap.set("n", "<leader>cw", "<cmd>TrimWhitespace<CR>", { desc = "Trim trailing whitespace" })

vim.keymap.set("n", "<leader>uW", function()
  vim.g.trim_whitespace_on_save = not vim.g.trim_whitespace_on_save
  if vim.g.trim_whitespace_on_save then
    vim.notify("Trim whitespace on save: ON", vim.log.levels.INFO)
  else
    vim.notify("Trim whitespace on save: OFF", vim.log.levels.WARN)
  end
end, { desc = "Toggle trim whitespace on save" })
