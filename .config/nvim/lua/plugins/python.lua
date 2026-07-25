-- ~/.config/nvim/lua/plugins/python.lua
return {
  -- Import LazyVim's standard python extra
  -- This gives you out-of-the-box LSP (pyright), formatting (ruff), and debugging (debugpy)
  { import = "lazyvim.plugins.extras.lang.python" },

  -- You can add custom standard Python tweaks here if needed
  -- Example: Ensure specific tools are always installed via Mason
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed or {}, {
        "pyright",
        "ruff",
      })
    end,
  },
}
