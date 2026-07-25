return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      local handle = io.popen("fortune -s 2>/dev/null | fold -s -w 42")
      local quote = handle and handle:read("*a") or ""
      if handle then
        handle:close()
      end

      if quote == "" then
        quote = '"Talk is cheap. Show me the code."\n  — Linus Torvalds'
      end

      quote = quote:gsub("%s+$", "")

      local ascii = [[
  ███╗   ██╗██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██║   ██║██║████╗ ████║
  ██╔██╗ ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
]]

      opts.dashboard = {
        preset = {
          header = ascii .. "\n" .. quote,
        },
        sections = {
          {
            section = "header",
            padding = 1,
          },

          {
            pane = 2,
            section = "terminal",
            cmd = "fastfetch --logo none --structure Title:Separator:OS:Kernel:Uptime:Shell:Display:CPU:GPU:Memory",
            height = 14,
            padding = 1,
            indent = 2,
          },

          {
            section = "startup",
            padding = 1,
          },
        },
      }
    end,
  },
}
