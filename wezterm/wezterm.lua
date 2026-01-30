local wezterm = require("wezterm")

local config = wezterm.config_builder()

local function is_ac_power()
	local power_source = io.popen("pmset -g batt")
	if power_source == nil then
		return false
	end
	local power_source_content = power_source:read("*a")
	power_source:close()
	local is_ac = power_source_content:find("AC Power") ~= nil
	return is_ac
end

-- Example usage:
if is_ac_power() then
	config.max_fps = 120
else
	config.max_fps = 60
end

-- General Look
config.font_size = 16
config.font = wezterm.font("Fira Code")
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.window_background_opacity = 1
config.default_cursor_style = "SteadyBar"

config.colors = {
	background = "#000111",

	cursor_bg = "#57bfff",
	cursor_fg = "#1e1e1e",
	cursor_border = "#57bfff",

	selection_bg = "#57bfff",
	selection_fg = "#1e1e1e",

	split = "#57bfff",

	tab_bar = {
		background = "#000111",
		active_tab = {
			bg_color = "#82A1F1",
			fg_color = "#000000",
			intensity = "Bold",
			underline = "None",
			italic = false,
			strikethrough = false,
		},
		inactive_tab = {
			bg_color = "#000111",
			fg_color = "#bbbbbb",
		},

		inactive_tab_hover = {
			bg_color = "#000111",
			fg_color = "#ffffff",
			italic = false,
		},
	},
}

-- Tab bar
config.hide_tab_bar_if_only_one_tab = true
config.show_tab_index_in_tab_bar = true
config.show_new_tab_button_in_tab_bar = false
config.tab_bar_at_bottom = false
config.tab_and_split_indices_are_zero_based = true
config.show_close_tab_button_in_tabs = false
config.use_fancy_tab_bar = false

-- Key inputs
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

-- config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
config.default_workspace = "~"

-- Key bindings
config.disable_default_key_bindings = true
local act = wezterm.action
config.keys = {
	{ key = "+", mods = "SUPER", action = act.IncreaseFontSize },
	{ key = "-", mods = "SUPER", action = act.DecreaseFontSize },
	{ key = "=", mods = "SUPER", action = act.ResetFontSize },

	{ key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
	{ key = "Tab", mods = "SHIFT|CTRL", action = act.ActivateTabRelative(-1) },
	{ key = "0", mods = "SUPER", action = act.ActivateTab(0) },
	{ key = "1", mods = "SUPER", action = act.ActivateTab(1) },
	{ key = "2", mods = "SUPER", action = act.ActivateTab(2) },
	{ key = "3", mods = "SUPER", action = act.ActivateTab(3) },
	{ key = "4", mods = "SUPER", action = act.ActivateTab(4) },
	{ key = "5", mods = "SUPER", action = act.ActivateTab(5) },
	{ key = "6", mods = "SUPER", action = act.ActivateTab(6) },
	{ key = "7", mods = "SUPER", action = act.ActivateTab(7) },
	{ key = "8", mods = "SUPER", action = act.ActivateTab(8) },
	{ key = "9", mods = "SUPER", action = act.ActivateTab(9) },

	{
		key = "u",
		mods = "SUPER",
		action = act.CharSelect({ copy_on_select = true, copy_to = "ClipboardAndPrimarySelection" }),
	},
	{ key = "v", mods = "SUPER", action = act.PasteFrom("Clipboard") },
	{ key = "c", mods = "SUPER", action = act.CopyTo("Clipboard") },

	{ key = "_", mods = "SUPER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "|", mods = "SUPER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "r", mods = "SUPER", action = act.RotatePanes("Clockwise") },
	{ key = "z", mods = "SUPER", action = act.TogglePaneZoomState },
	{ key = "n", mods = "SHIFT|SUPER", action = act.SpawnWindow },
	{ key = "t", mods = "SUPER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "w", mods = "SUPER", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
	{ key = "w", mods = "SHIFT|SUPER", action = act.CloseCurrentTab({ confirm = true }) },
	{ key = "q", mods = "SUPER", action = act.QuitApplication },

	{ key = "h", mods = "SHIFT|SUPER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "SHIFT|SUPER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "SHIFT|SUPER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "SHIFT|SUPER", action = act.ActivatePaneDirection("Right") },

	{ key = "h", mods = "CTRL|SUPER", action = act.AdjustPaneSize({ "Left", 5 }) },
	{ key = "j", mods = "CTRL|SUPER", action = act.AdjustPaneSize({ "Down", 5 }) },
	{ key = "k", mods = "CTRL|SUPER", action = act.AdjustPaneSize({ "Up", 5 }) },
	{ key = "l", mods = "CTRL|SUPER", action = act.AdjustPaneSize({ "Right", 5 }) },

	{ key = "/", mods = "SUPER", action = act.Search("CurrentSelectionOrEmptyString") },
	{ key = "x", mods = "SUPER", action = act.ActivateCopyMode },
	{ key = "p", mods = "SHIFT|SUPER", action = act.ActivateCommandPalette },
	{ key = "d", mods = "SUPER", action = act.ShowDebugOverlay },

	{ key = "y", mods = "SUPER", action = wezterm.action.SpawnCommandInNewTab({ args = { "yazi" } }) },
	{ key = "n", mods = "SUPER", action = wezterm.action.SpawnCommandInNewTab({ args = { "nvim" } }) },
	{ key = "p", mods = "SUPER", action = wezterm.action.SpawnCommandInNewTab({ args = { "btop" } }) },
	{ key = "l", mods = "SUPER", action = wezterm.action.SpawnCommandInNewTab({ args = { "lazygit" } }) },

	{
		key = "s",
		mods = "SUPER",
		action = workspace_switcher.switch_workspace(),
	},
}

wezterm.on("update-right-status", function(window, pane)
	window:set_right_status(window:active_workspace())
end)

return config
