local wezterm = require("wezterm")

local config = {}
-- Use config builder object if possible
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Settings
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold" })
config.font_size = 14
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

-- Config tab_bar
config.show_new_tab_button_in_tab_bar = false
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.colors = {
	background = "#1e1f28",
	tab_bar = {
		background = "#282a36",
		active_tab = {
			bg_color = "#44475A",
			fg_color = "#ddd7ba",
			intensity = "Bold",
		},
		inactive_tab = {
			bg_color = "#282a36",
			fg_color = "#ddd7ba",
		},
	},
	cursor_bg = "#ddd7ba",
	cursor_border = "#ddd7ba",
}

return config
