return {
	"freddiehaddad/feline.nvim",
	config = function(_, opts)
		local vi_mode = require "feline.providers.vi_mode"
		local separators =
			require("feline.defaults").statusline.separators.default_value

		vi_mode = {
			provider =  {
				name = "vi_mode",
			},
			hl = function()
				return {
					name = require("feline.providers.vi_mode").get_mode_highlight_name(),
					fg = require("feline.providers.vi_mode").get_mode_color(),
					style = "bold",
				}
			end,
			left_sep = {
				always_visible = true,
				str = separators.slant_left,
				hl = function()
					return { fg = vi_mode.get_mode_color(), bg = "none" }
				end,
			},
			right_sep = {
				always_visible = true,
				str = separators.slant_left,
				hl = function()
					return {
						fg = "#000000",
						bg = vi_mode.get_mode_color(),
					}
				end,
			},
		}

		local c = {
			active = {
				{ vi_mode }, -- left
				{}, -- right
			},
			-- inactive = {},
		}

		-- TODO: Fix this
		-- opts.components = c

		require("feline").setup(opts)

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
