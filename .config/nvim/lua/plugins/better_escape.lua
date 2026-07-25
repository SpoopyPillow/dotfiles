return {
  "max397574/better-escape.nvim",
  -- DISABLE BETTER ESCAPE
  enabled = false,
  event = "InsertEnter",
  config = function()
    require("better_escape").setup({
      timeout = 50,
      default_mappings = false,
      mappings = {
        i = { -- Insert mode
          j = { k = "<Esc>" },
          k = { j = "<Esc>" },
        },
        c = { -- Command mode
          j = { k = "<Esc>" },
          k = { j = "<Esc>" },
        },
        t = { -- Terminal mode
          j = { k = "<C-\\><C-n>" },
          k = { j = "<C-\\><C-n>" },
        },
        v = { -- Visual mode
          j = { k = "<Esc>" },
          k = { j = "<Esc>" },
        },
      },
    })
  end,
}
