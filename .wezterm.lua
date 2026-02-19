local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- Couleurs des onglets
local tab_colors = {
    active_bg = "#7aa2f7",
    active_fg = "#1a1b26",
    inactive_bg = "#282c35",
    inactive_fg = "#545c7e",
}

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    local is_active = tab.is_active
    return {
        { Background = { Color = is_active and tab_colors.active_bg or tab_colors.inactive_bg } },
        { Foreground = { Color = is_active and tab_colors.active_fg or tab_colors.inactive_fg } },
        { Text = "  " .. tab.tab_index + 1 .. ": " .. tab.active_pane.title .. "  " },
    }
end)

config = {
    automatically_reload_config = true,
    enable_tab_bar = true,
    hide_tab_bar_if_only_one_tab = true,
    use_fancy_tab_bar = false,
    window_close_confirmation = "NeverPrompt",
    window_decorations = "RESIZE",
    default_cursor_style = "BlinkingBar",
    color_scheme = "Nord (Gigh)",
    font = wezterm.font("JetBrains Mono", { weight = "Bold" }),
    font_size = 12.5,
    background = {
        {
            source = {
                File = "C:\\Users\\Valentin\\bg-monterey.png"
            },
            hsb = {
                hue = 1.0,
                saturation = 1.02,
                brightness = 0.25,
            },
            width = "100%",
            height = "100%"
        },
        {
            source = { Color = "#282c35" },
            width = "100%",
            height = "100%",
            opacity = 0.75,
        }
    },
    -- Pane actif visible
    inactive_pane_hsb = {
        saturation = 0.4,
        brightness = 0.4,
    },
    colors = {
        -- split = "#7aa2f7",
        tab_bar = {
            background = "#1a1b26",
        },
    },
    window_padding = {
        left = 3,
        right = 3,
        top = 0,
        bottom = 0,
    },
    keys = {
        -- Onglets
        { key = "t", mods = "CTRL|SHIFT", action = wezterm.action.SpawnTab "CurrentPaneDomain" },
        { key = "w", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentTab { confirm = false } },
        { key = "Tab", mods = "CTRL", action = wezterm.action.ActivateTabRelative(1) },
        { key = "Tab", mods = "CTRL|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },
        { key = "1", mods = "CTRL", action = wezterm.action.ActivateTab(0) },
        { key = "2", mods = "CTRL", action = wezterm.action.ActivateTab(1) },
        { key = "3", mods = "CTRL", action = wezterm.action.ActivateTab(2) },

        -- Splits
        { key = "h", mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" } },
        { key = "v", mods = "CTRL|SHIFT", action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" } },
        { key = "LeftArrow",  mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection "Left" },
        { key = "RightArrow", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection "Right" },
        { key = "UpArrow",    mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection "Up" },
        { key = "DownArrow",  mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection "Down" },
        { key = "x", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentPane { confirm = false } },

        -- Redimensionner les splits
{ key = "LeftArrow",  mods = "CTRL|ALT", action = wezterm.action.AdjustPaneSize { "Left", 5 } },
{ key = "RightArrow", mods = "CTRL|ALT", action = wezterm.action.AdjustPaneSize { "Right", 5 } },
{ key = "UpArrow",    mods = "CTRL|ALT", action = wezterm.action.AdjustPaneSize { "Up", 5 } },
{ key = "DownArrow",  mods = "CTRL|ALT", action = wezterm.action.AdjustPaneSize { "Down", 5 } },
    },
}

return config