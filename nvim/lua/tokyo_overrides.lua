-- tokyo_overrides.lua
local M = {}

M.default = {
	transparent = true,
	_style = "night",
}
-- M.default = {
-- 	transparent = true,
-- 	bg = "#011628",
-- 	bg_dark = "#011423",
-- 	bg_highlight = "#143652",
-- 	bg_search = "#0A64AC",
-- 	bg_visual = "#275378",
-- 	fg = "#CBE0F0",
-- 	fg_dark = "#B4D0E9",
-- 	fg_gutter = "#627E97",
-- 	border = "#547998",
-- }

M.maple_dark = {
	_name = "maple_dark",
	_style = "storm",
	transparent = true,

	-- Core colors
	bg = "#1e1e1f",
	fg = "#cbd5e1",
	fg_dark = "#b5c1cf",
	fg_float = "#cbd5e1",
	fg_sidebar = "#cbd5e1",
	fg_gutter = "#666666",

	-- Backgrounds
	bg_dark = "#1a1a1b",
	bg_dark1 = "#141415",
	bg_float = "#1e1e1f",
	bg_highlight = "#2a2a2c",
	bg_popup = "#1e1e1f",
	bg_search = "#666666",
	bg_sidebar = "#1e1e1f",
	bg_statusline = "#1e1e1f",
	bg_visual = "#2f2f31",

	-- Colors
	black = "#333333",
	red = "#edabab",
	red1 = "#ffc4c4",
	green = "#a4dfae",
	green1 = "#bdf8c7",
	green2 = "#a4dfae",
	yellow = "#eecfa0",
	orange = "#ffe8b9",
	blue = "#8fc7ff",
	blue0 = "#8fc7ff",
	blue1 = "#a8e0ff",
	blue2 = "#a8e0ff",
	blue5 = "#a8e0ff",
	blue6 = "#bafffe",
	blue7 = "#666666",
	magenta = "#d2ccff",
	magenta2 = "#ebe5ff",
	purple = "#d2ccff",
	teal = "#a1e8e5",
	cyan = "#a1e8e5",
	hint = "#a1e8e5",
	info = "#8fc7ff",
	warning = "#ffe8b9",
	error = "#ffc4c4",
	comment = "#666666",
	todo = "#a8e0ff",

	border = "#666666",
	border_highlight = "#a8e0ff",

	-- Special groups
	terminal_black = "#414868",

	-- Git diff
	diff = {
		add = "#2d3f2f",
		change = "#3a3d2f",
		delete = "#4b2d2f",
		text = "#2f3f4b",
	},

	git = {
		add = "#a4dfae",
		change = "#eecfa0",
		delete = "#edabab",
		ignore = "#666666",
	},

	rainbow = {
		"#8fc7ff",
		"#ffe8b9",
		"#a4dfae",
		"#a1e8e5",
		"#d2ccff",
		"#ebe5ff",
		"#ffc4c4",
		"#f3f2f2",
	},

	terminal = {
		black = "#333333",
		black_bright = "#666666",
		red = "#edabab",
		red_bright = "#ffc4c4",
		green = "#a4dfae",
		green_bright = "#bdf8c7",
		yellow = "#eecfa0",
		yellow_bright = "#ffe8b9",
		blue = "#8fc7ff",
		blue_bright = "#a8e0ff",
		magenta = "#d2ccff",
		magenta_bright = "#ebe5ff",
		cyan = "#a1e8e5",
		cyan_bright = "#bafffe",
		white = "#f3f2f2",
		white_bright = "#ffffff",
	},
}

return M
