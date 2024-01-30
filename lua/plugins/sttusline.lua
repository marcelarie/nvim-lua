---@diagnostic disable: param-type-mismatch
local colors = {
	default_font = "#ffffff",
	grey_font = "#b3b3b3",
	dark_red = "#e06c75",
	dark_grey = "#3c4452",
	dark_green = "#98c379",
	dark_white = "#abb2bf",
}

return {
	"sontungexpt/sttusline",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = { "BufEnter" },
	branch = "main",
	config = function()
		local filename = require "sttusline.components.filename"
		local git_branch = require "sttusline.components.git-branch"
		local lsps_formatters = require "sttusline.components.lsps-formatters"
		local nvim_info = {
			name = "nvim_info",
			padding = 1,
			colors = { fg = colors.dark_white },
			separator = { left = "", right = "" },
			event = { "ModeChanged", "VimResized" },
			user_event = "VeryLazy",
			update = function()
				local nvim_version = vim.version()
				return string.format(
					"  v%d.%d",
					nvim_version.minor,
					nvim_version.patch
				)
			end,
		}

		filename.colors = {
			{},
			{ fg = colors.default_font },
		}
		git_branch.colors = { fg = colors.dark_red }

		filename.update = function()
			local fn = vim.fn.expand "%"
			local home = os.getenv "HOME"
			if fn == "" then
				return "No Name"
			end
			fn = fn:gsub(home, "~")
			fn = fn:gsub("~/clones/work/", ""):gsub("~/clones/own/", "")
			return fn
		end

		lsps_formatters.colors = {
			fg = colors.grey_font,
		}

		require("sttusline").setup {
			statusline_color = "#000000",
			-- statusline_color = "StatusLine",

			laststatus = 3,
			disabled = {
				filetypes = {
					-- "NvimTree",
					-- "lazy",
				},
				buftypes = {
					-- "terminal",
				},
			},
			components = {
				nvim_info,
				"mode",
				git_branch,
				"%=",
				filename,
				"git-diff",
				"%=",
				-- "filesize",
				"diagnostics",
				lsps_formatters,
				-- "copilot",
				"indent",
				"encoding",
				-- "pos-cursor",
				-- "pos-cursor-progress",
			},
		}
	end,
}
