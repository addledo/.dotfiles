-- Pull in the wezterm API
local wezterm = require("wezterm")
local sessionizer = require("sessionizer")
-- This will hold the configuration.
local config = wezterm.config_builder()

-- Start wezterm maximised
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
    local _, _, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"

config.initial_cols = 120
config.initial_rows = 28

config.font_size = 10
config.color_scheme = "Gruvbox Dark (Gogh)"

config.default_prog = { "pwsh.exe" }

hide_tab_bar_if_only_one_tab = true

-- Set leader key
-- timeout_milliseconds defaults to 1000 and can be omitted
config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 2000 }

config.keys = {
    -- Sessionizer
    { key = "f",  mods = "LEADER",         action = wezterm.action_callback(sessionizer.toggle) },

    -- Fix for harpoon
    { key = ";",  mods = "CTRL",         action = wezterm.action.SendKey({ key = "F13" }) },

    -- Modified from
    -- https://gist.github.com/quangIO/556fa4abca46faf40092282d0c11a367#file-wezterm-lua
    { key = "b",  mods = "LEADER|CTRL",  action = wezterm.action { SendString = "\x01" } },
    { key = "-",  mods = "LEADER",       action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
    { key = "\\", mods = "LEADER",       action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
    { key = "s",  mods = "LEADER",       action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
    { key = "v",  mods = "LEADER",       action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
    { key = "o",  mods = "LEADER",       action = "TogglePaneZoomState" },
    { key = "z",  mods = "LEADER",       action = "TogglePaneZoomState" },
    { key = "c",  mods = "LEADER",       action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
    { key = "h",  mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Left" } },
    { key = "j",  mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Down" } },
    { key = "k",  mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Up" } },
    { key = "l",  mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Right" } },
    { key = "H",  mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Left", 5 } } },
    { key = "J",  mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Down", 5 } } },
    { key = "K",  mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Up", 5 } } },
    { key = "L",  mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Right", 5 } } },
    { key = "n",  mods = "LEADER",       action = wezterm.action { ActivateTabRelative = 1 } },
    { key = "p",  mods = "LEADER",       action = wezterm.action { ActivateTabRelative = -1 } },
    { key = "1",  mods = "LEADER",       action = wezterm.action { ActivateTab = 0 } },
    { key = "2",  mods = "LEADER",       action = wezterm.action { ActivateTab = 1 } },
    { key = "3",  mods = "LEADER",       action = wezterm.action { ActivateTab = 2 } },
    { key = "4",  mods = "LEADER",       action = wezterm.action { ActivateTab = 3 } },
    { key = "5",  mods = "LEADER",       action = wezterm.action { ActivateTab = 4 } },
    { key = "6",  mods = "LEADER",       action = wezterm.action { ActivateTab = 5 } },
    { key = "7",  mods = "LEADER",       action = wezterm.action { ActivateTab = 6 } },
    { key = "8",  mods = "LEADER",       action = wezterm.action { ActivateTab = 7 } },
    { key = "9",  mods = "LEADER",       action = wezterm.action { ActivateTab = 8 } },
    { key = "&",  mods = "LEADER|SHIFT", action = wezterm.action { CloseCurrentTab = { confirm = false } } },
    { key = "d",  mods = "LEADER",       action = wezterm.action { CloseCurrentPane = { confirm = false } } },
    { key = "x",  mods = "LEADER",       action = wezterm.action { CloseCurrentPane = { confirm = false } } },

}

for _, binding in ipairs(sessionizer.get_session_keybindings()) do
    table.insert(config.keys, binding)
end

-- Finally, return the configuration to wezterm:
return config

-- vim: ts=4 sw=4 et
