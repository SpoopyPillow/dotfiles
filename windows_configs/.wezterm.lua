local wezterm = require "wezterm"
local mux = wezterm.mux

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.default_domain = "WSL:Ubuntu"
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

-- Color scheme
config.color_scheme = "Catppuccin Mocha"

-- Font
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 11.0

-- Padding
config.window_padding = {
  left = 16,
  right = 16,
  top = 16,
  bottom = 16,
}

-- Tab bar
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local title = "Tab"
  -- If you set a custom title manually, use that
  if tab.tab_title and #tab.tab_title > 0 then
    title = tab.tab_title
  else
    -- Otherwise, grab the current working directory
    local cwd_uri = tab.active_pane.current_working_dir
    if cwd_uri then
      local cwd = cwd_uri.file_path or ""
      -- Remove any trailing slashes
      cwd = cwd:gsub("[/\\]$", "")
      -- Extract just the last folder name
      title = cwd:match("([^/\\]+)$") or cwd
    end
  end

  -- Add the tab number and some padding for a clean look
  return string.format(' %d: %s ', tab.tab_index + 1, title)
end)

-- Set Leader to Ctrl+b
config.leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 1000 }

config.keys = {
  -- Panes
  { key = '|', mods = 'LEADER|SHIFT', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = '-', mods = 'LEADER', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },

  { key = 'h', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection('Left') },
  { key = 'l', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection('Right') },
  { key = 'k', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection('Up') },
  { key = 'j', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection('Down') },

  { key = 'x', mods = 'LEADER', action = wezterm.action.CloseCurrentPane { confirm = true } },

  -- Tabs
  { key = 'c', mods = 'LEADER', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },

  { key = '1', mods = 'LEADER', action = wezterm.action.ActivateTab(0) },
  { key = '2', mods = 'LEADER', action = wezterm.action.ActivateTab(1) },
  { key = '3', mods = 'LEADER', action = wezterm.action.ActivateTab(2) },
  { key = '4', mods = 'LEADER', action = wezterm.action.ActivateTab(3) },

  { key = 'n', mods = 'LEADER', action = wezterm.action.ActivateTabRelative(1) },
  { key = 'p', mods = 'LEADER', action = wezterm.action.ActivateTabRelative(-1) },

  {
    key = ',',
    mods = 'LEADER',
    action = wezterm.action.PromptInputLine {
      description = 'Enter new name for tab',
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:active_tab():set_title(line)
        end
      end),
    },
  },
}

return config
