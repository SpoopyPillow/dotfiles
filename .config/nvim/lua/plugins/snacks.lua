return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          hidden = true,
          ignored = true,
          win = {
            list = {
              wo = {
                number = false,
                relativenumber = true,
              },
            },
          },
        },
      },
    },
  },
}
