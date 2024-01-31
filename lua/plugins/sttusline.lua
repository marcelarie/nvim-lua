---@diagnostic disable: param-type-mismatch
local colors = {
	default_font = "#ffffff",
	grey_font = "#b3b3b3",
	dark_red = "#e06c75",
	dark_grey = "#3c4452",
	dark_green = "#98c379",
	dark_white = "#abb2bf",
	blue = "#61afef",
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

		local file_type_logo = {
			name = "file_type_logo",
			padding = 2,
			colors = { fg = colors.grey_font, },
			separator = { left = "", right = "" },
			event = { "BufEnter", "BufWritePost", "BufReadPost" },
			user_event = "VeryLazy",
			update = function()
				-- local ft = vim.bo.filetype
				local icon = require("nvim-web-devicons").get_icon(
					vim.fn.expand "%:t",
					vim.fn.expand "%:e",
					{ default = true }
				)
				-- return string.format("%s %s", icon, ft)
				return string.format("%s", icon)
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
				-- "git-diff",
				"%=",
				-- "filesize",
				file_type_logo,
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
