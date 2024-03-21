return {
	"freddiehaddad/feline.nvim",
	config = function(_, _opts)
		require("feline").setup()

		local lighthaus_theme = {
			fg = "#DCD7BA",
			bg = "#1F1F28",
			black = "#16161D",
			skyblue = "#16161D",
			cyan = "#6A9589",
			green = "#76946A",
			-- oceanblue = "#658594",
			oceanblue = "#1F1F28",
			magenta = "#D27E99",
			orange = "#FFA066",
			red = "#E82424",
			violet = "#957FB8",
			white = "#DCD7BA",
			yellow = "#FF9E3B",
		}

		require("feline").use_theme(lighthaus_theme)

		-- require("feline").winbar.setup()
	end,
}
