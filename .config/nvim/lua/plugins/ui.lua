return {
  -- LazyVim colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  -- Catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      transparent_background = true,
      integrations = {
        harpoon = true,
        mason = true,
        telescope = {
          enabled = true,
          style = "nvchad",
        },
      },
    },
  },
  -- Disable bufferline
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  -- Isolate buffers to tabs
  {
    "tiagovla/scope.nvim",
    config = true,
  },
  -- Lualine
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      theme = "catppuccin",
      options = {
        section_separators = "",
        component_separators = "",
      },
      sections = {
        lualine_z = { "tabs" },
      },
      tabline = {},
    },
  },
}
