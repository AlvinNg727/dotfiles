local wezterm = require("wezterm")

local one_dark = wezterm.color.get_builtin_schemes()["One Dark (Gogh)"]

one_dark.foreground = "#abb2bf"
one_dark.ansi = {
	"#1e2127",
	"#e06c75",
	"#98c379",
	"#d19a66",
	"#61afef",
	"#c678dd",
	"#56b6c2",
	"#abb2bf",
}
one_dark.brights = {
	"#5c6370",
	"#e06c75",
	"#98c379",
	"#d19a66",
	"#61afef",
	"#c678dd",
	"#56b6c2",
	"#ffffff",
}

return one_dark
