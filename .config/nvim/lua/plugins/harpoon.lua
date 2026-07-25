return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
      {
        "<leader>hm",
        function()
          require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
        end,
        desc = "Harpoon Menu",
      },

      -- SET the current file to a specific slot (Replace At)
      {
        "<leader>h1",
        function()
          require("harpoon"):list():replace_at(1)
          vim.notify("Harpoon slot 1 set", vim.log.levels.INFO)
        end,
        desc = "Harpoon Set File 1",
      },
      {
        "<leader>h2",
        function()
          require("harpoon"):list():replace_at(2)
          vim.notify("Harpoon slot 2 set", vim.log.levels.INFO)
        end,
        desc = "Harpoon Set File 2",
      },
      {
        "<leader>h3",
        function()
          require("harpoon"):list():replace_at(3)
          vim.notify("Harpoon slot 3 set", vim.log.levels.INFO)
        end,
        desc = "Harpoon Set File 3",
      },
      {
        "<leader>h4",
        function()
          require("harpoon"):list():replace_at(4)
          vim.notify("Harpoon slot 4 set", vim.log.levels.INFO)
        end,
        desc = "Harpoon Set File 4",
      },

      -- JUMP to a specific slot
      {
        "<leader>1",
        function()
          require("harpoon"):list():select(1)
        end,
        desc = "Harpoon to File 1",
      },
      {
        "<leader>2",
        function()
          require("harpoon"):list():select(2)
        end,
        desc = "Harpoon to File 2",
      },
      {
        "<leader>3",
        function()
          require("harpoon"):list():select(3)
        end,
        desc = "Harpoon to File 3",
      },
      {
        "<leader>4",
        function()
          require("harpoon"):list():select(4)
        end,
        desc = "Harpoon to File 4",
      },
    },
  },
}
