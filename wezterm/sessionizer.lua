-- ~/.config/wezterm/sessionizer.lua
local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

local fd = "fd.exe"

-- ============================================================================
-- SOURCE DIRECTORIES
-- ============================================================================
M.source_directories = {
}

-- ============================================================================
-- QUICK SESSION KEYBINDINGS
-- ============================================================================
M.session_bindings = {
    { key = "N", directory = "~/AppData/Local/nvim" },
}

-- Generate keybindings for quick session switching
M.get_session_keybindings = function()
    local keys = {}
    for _, binding in ipairs(M.session_bindings) do
        local id = binding.directory:match("[^/]*$")
        table.insert(keys, {
            key = binding.key,
            mods = "LEADER",
            action = act.SwitchToWorkspace {
                name = id,
                spawn = { cwd = binding.directory },
            },
        })
    end
    return keys
end



M.toggle = function(window, pane)
    local projects = {}

    for _, source_dir in ipairs(M.source_directories) do
        local success, stdout, stderr = wezterm.run_child_process({
            fd,
            "-HI",
            "-t", "d",
            ".*",
            "--max-depth=1",
            "--prune",
            source_dir
        })

        if not success then
            wezterm.log_error("Failed to run fd for " .. source_dir .. ": " .. stderr)
        else
            for line in stdout:gmatch("([^\n]*)\n?") do
                if line ~= "" then
                    local project = line:gsub("/.git.*$", "")
                    local label = project
                    local id = project:gsub(".*/", "")
                    table.insert(projects, { label = tostring(label), id = tostring(id) })
                end
            end
        end
    end

    window:perform_action(
        act.InputSelector({
            action = wezterm.action_callback(function(win, _, id, label)
                if not id and not label then
                    wezterm.log_info("Cancelled")
                else
                    wezterm.log_info("Selected " .. label)
                    win:perform_action(
                        act.SwitchToWorkspace({ name = id, spawn = { cwd = label } }),
                        pane
                    )
                end
            end),
            fuzzy = true,
            title = "Select project",
            choices = projects,
        }),
        pane
    )
end

return M

-- vim: ts=4 sw=4 et
