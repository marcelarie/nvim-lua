require("lighthaus").setup {
	-- set true to use dark bg by default
	bg_dark = vim.env.SYS_THEME == "dark" and true or false,
	-- see colors.lua to see colors table, set overrides here to be merged with defaultsk
	colors = {
		-- black = '#0E0E10',
		-- black = '#1e1d23',
		black = "#111111",
		fg_nc_statusline = "#888888",
		-- bg = 'Red'
	},
	-- set to 'underline' to replace undercurl with underline
	-- or empty string '' to disable
	lsp_underline_style = "undercurl",
}
