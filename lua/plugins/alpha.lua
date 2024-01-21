return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require "alpha"
		local startify = require "alpha.themes.startify"

		startify.section.top_buttons.val = {
			-- I would like to cd into the directory first
			startify.button(
				"rc",
				"vim config",
				"<cmd>cd ~/.config/nvim/<CR><cmd>e init.lua<CR>"
			),
			startify.button(
				"se",
				"reload last session",
				"<cmd>SessionLoadLast<cr>"
			),
			startify.button(
				"ss",
				"select session",
				"<cmd>Telescope persisted<cr>"
			),

			-- while also maintaining the format of the normal bookmark file button like this one:
			startify.file_button("~/.config/nvim/init.lua", "vit"),
		}

		startify.section.bottom_buttons.val = {
			startify.button("q", "quit nvim", "<cmd>qa<CR>"),
			startify.button("e", "new file", "<cmd>ene <BAR> startinsert <CR>"),
		}

		local version = vim.version()

		startify.section.header.val = {
			[[                                   __                ]],
			[[      ___     ___    ___   __  __ /\_\    ___ ___    ]],
			[[     / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
			[[    /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
			[[    \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
			[[     \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
			string.format(
				[[                                               v: %s%s%s ]],
				version.major,
				".",
				version.minor
			),
		}

		alpha.setup(startify.opts)
	end,
	-- keys = {
	-- 	{ "<Leader>al", ":Alpha<cr>", desc = "Alpha menu" },
	-- },
}
