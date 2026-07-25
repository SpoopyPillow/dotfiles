return {
  {
    "gbprod/yanky.nvim",
    opts = {
      ring = { history_length = 100 },
      preserve_cursor_position = {
        enabled = true,
      },
    },
    keys = {
      { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Paste after" },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Paste before" },

      { "<c-p>", "<Plug>(YankyCycleForward)", desc = "Cycle yank history (older)" },
      { "<c-n>", "<Plug>(YankyCycleBackward)", desc = "Cycle yank history (newer)" },
    },
  },
}
