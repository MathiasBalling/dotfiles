local wezterm = require("wezterm")

local config = {
	default_prog = { "/bin/sh", "-c", "tmux attach-session -t home || tmux new-session -s home" },
	font_size = 16,
	window_decorations = "RESIZE",
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},

	colors = {
		background = "#000111",
		cursor_bg = "#57bfff",
		cursor_fg = "#1e1e1e",
		selection_bg = "#57bfff",
		selection_fg = "#1e1e1e",
		cursor_border = "#57bfff",
	},

	enable_tab_bar = false,
	-- If tab bar is enabled:
	hide_tab_bar_if_only_one_tab = true,
	show_tab_index_in_tab_bar = false,
	show_new_tab_button_in_tab_bar = false,
	tab_bar_style = {},

	send_composed_key_when_left_alt_is_pressed = false,
	send_composed_key_when_right_alt_is_pressed = false,
}
return config
