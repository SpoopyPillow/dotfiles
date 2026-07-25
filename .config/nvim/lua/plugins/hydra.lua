return {
  "anuvyklack/hydra.nvim",
  event = "VeryLazy",
  config = function()
    local Hydra = require("hydra")

    local function smart_resize(axis, amount)
      local is_vert = (axis == "vert")

      -- Get directions to check
      local dir_pos = is_vert and "l" or "j" -- Right or Down
      local dir_neg = is_vert and "h" or "k" -- Left or Up

      -- Check if we are no windows in this axis
      local at_far_pos = (vim.fn.winnr() == vim.fn.winnr(dir_pos))
      local at_far_neg = (vim.fn.winnr() == vim.fn.winnr(dir_neg))

      if at_far_pos and at_far_neg then
        -- Only one window exists in this axis
        return
      end

      -- Resizing logic
      local cmd = is_vert and "vertical resize " or "resize "

      -- If we are at the far 'positive' edge (Right or Bottom),
      -- we must invert the command to move the border correctly.
      if at_far_pos then
        vim.cmd(cmd .. (amount > 0 and "-" or "+") .. math.abs(amount))
      else
        vim.cmd(cmd .. (amount > 0 and "+" or "-") .. math.abs(amount))
      end
    end

    Hydra({
      name = "Window Resize",
      mode = "n",
      body = "<leader>w.",
      config = {
        invoke_on_body = true,
        hint = {
          type = "statusline",
          border = "rounded",
        },
      },
      heads = {
        -- h/l move the vertical border
        {
          "h",
          function()
            smart_resize("vert", -5)
          end,
          { desc = "Border Left" },
        },
        {
          "l",
          function()
            smart_resize("vert", 5)
          end,
          { desc = "Border Right" },
        },
        -- j/k move the horizontal border
        {
          "j",
          function()
            smart_resize("horiz", 2)
          end,
          { desc = "Border Down" },
        },
        {
          "k",
          function()
            smart_resize("horiz", -2)
          end,
          { desc = "Border Up" },
        },
        { "=", "<C-w>=", { desc = "Balance" } },
        { "q", nil, { exit = true, desc = "Quit" } },
        { "<Esc>", nil, { exit = true, desc = "Quit" } },
      },
    })
  end,
}
