require("lighthaus").setup {
	-- set true to use dark bg by default
	bg_dark = true,
	-- see colors.lua to see colors table, set overrides here to be merged with defaultsk
	colors = {
		-- black = '#0E0E10',
		-- black = '#1e1d23',
		black = "#111111",
		fg_nc_statusline = "#888888",
		red = "#FC2929",
		red2 = "#FF5050",
		blue = "#1D918B",
		blue2 = "#47A8A1",
		blue3 = "#0db9d7",
		hl_yellow = "#FFFF00",
		hl_orange = "#FF4D00",
		hl_bg = "#fff",
		hl_bg_dark = "#282c34",
		gutter_bg = "#282c34",
		non_text = "#373C45",
		lsp_error = "#db4b4b",
		lsp_warning = "#e0af68",
		lsp_information = "#0db9d7",
		lsp_hint = "#10B981",
		-- bg = 'Red'
	},
	-- set to 'underline' to replace undercurl with underline
	-- or empty string '' to disable
	lsp_underline_style = "undercurl",
}
