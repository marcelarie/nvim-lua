local colors = {
	bg = "#202328",
	fg = "#bbc2cf",
	yellow = "#ECBE7B",
	cyan = "#008080",
	darkblue = "#081633",
	green = "#98be65",
	orange = "#FF8800",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	blue = "#51afef",
	red = "#ec5f67",
}

require("lualine").setup {
	options = {
		icons_enabled = true,
		--  theme = "gruvbox",
		--  theme = require("monarized.lualine"),
		-- theme = "gruvbox",
		theme = "lighthaus",
		component_separators = { ".", "." },
		--  section_separators = { "", "" },
		section_separators = { "", "" },
		disabled_filetypes = {},
	},
	sections = {
		lualine_a = {
			{
				"mode",
				lower = true,
				format = function(mode)
					return mode:sub(1, 1)
				end,
			},
		},
		lualine_b = { "branch" },
		lualine_c = {
			{ "filename", path = 1, file_status = true, icons_enabled = true },
		-- 	{
		-- 		"lsp_progress",
		-- 		display_components = {
		-- 			"lsp_client_name",
		-- 			{
		-- 				"title",
		-- 				"percentage",
		-- 				"lsp_progress_percentage",
		-- 			},
		-- 		},
		-- 		colors = {
		-- 			percentage = colors.blue,
		-- 			-- title = colors.green,
		-- 			message = colors.fg,
		-- 			-- spinner = colors.cyan,
		-- 			lsp_client_name = colors.cyan,
		-- 			use = true,
		-- 		},
		-- 		spinner_symbols = {
		-- 			"🌑 ",
		-- 			"🌒 ",
		-- 			"🌓 ",
		-- 			"🌔 ",
		-- 			"🌕 ",
		-- 			"🌖 ",
		-- 			"🌗 ",
		-- 			"🌘 ",
		-- 		},
		-- 	},
		},
		lualine_d = {},
		lualine_x = {
			-- { require("auto-session-library").current_session_name },
			"encoding",
			"fileformat",
			"filetype",
		},
		lualine_y = {
			"progress",
		},
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
}

vim.cmd "set laststatus=3"
