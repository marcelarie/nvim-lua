return {
	"freddiehaddad/feline.nvim",
	config = function(_, opts)
		local vi_mode = {
			provider = function()
				local fel_vim_mode = require "feline.providers.vi_mode"
				return string.format(" %s ", fel_vim_mode.get_vim_mode())
			end,
			left_sep = " ",
			right_sep = " ",
		}

		local file_name = {
			provider = "file_info",
			hl = {
				fg = "#DCD7BA",
			},
			separator = " ",
		}

		local git_branch = {
			provider = function()
				local git = require "feline.providers.git"
				local branch, icon = git.git_branch()
				local s
				if #branch > 0 then
					s = string.format(" %s%s ", icon, branch)
				else
					s = string.format(" %s ", "Untracked")
				end
				return s
			end,
			left_sep = "",
			right_sep = "  ",
		}

		local c = {
			active = {
				{ -- left
					vi_mode,
					git_branch,
					file_name,
				},
				{ -- right
				},
			},
			-- inactive = {},
		}

		-- opts.components = c -- Comment this to use default bar

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
