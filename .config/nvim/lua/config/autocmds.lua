-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Toggle relative line numbers in insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    vim.opt.relativenumber = false
  end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.opt.relativenumber = true
  end,
})

-- Permanently change CWD when opening Neovim with a directory path
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local path = tostring(vim.fn.argv(0))
    if path ~= "" and vim.fn.isdirectory(path) == 1 then
      vim.api.nvim_set_current_dir(path)
    end
  end,
})

-- Trim trailing whitespace
vim.api.nvim_create_user_command("TrimWhitespace", function()
  local cursor = vim.api.nvim_win_get_cursor(0)

  -- Strip trailing spaces horizontally
  vim.cmd([[silent! keeppatterns %s/\s\+$//e]])

  -- Strip trailing empty lines vertically
  local last_line = vim.api.nvim_buf_line_count(0)
  while last_line > 0 do
    local line = vim.api.nvim_buf_get_lines(0, last_line - 1, last_line, false)[1]
    if line == "" then
      last_line = last_line - 1
    else
      break
    end
  end

  local num_lines = vim.api.nvim_buf_line_count(0)
  if last_line < num_lines then
    vim.api.nvim_buf_set_lines(0, last_line, num_lines, false, {})
  end

  -- Safely restore cursor
  cursor[1] = math.min(cursor[1], vim.api.nvim_buf_line_count(0))
  pcall(vim.api.nvim_win_set_cursor, 0, cursor)
end, { desc = "Trim trailing whitespace and empty lines" })

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    if vim.g.trim_whitespace_on_save then
      vim.cmd("TrimWhitespace")
    end
  end,
})
