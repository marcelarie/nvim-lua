return {
	"olimorris/codecompanion.nvim",
	opts = {},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"ravitemer/mcphub.nvim",
	},
	config = function()
		local cc = require "codecompanion"

		cc.setup {
			strategies = {
				chat = {
					adapter = "anthropic",
					keymaps = {
						send = {
							modes = { n = "<C-s>", i = "<C-s>" },
							opts = { silent = false },
						},
						close = {
							modes = { n = "<C-c>", i = "<C-c>" },
							opts = { silent = false },
						},
					},
				},
				inline = { adapter = "anthropic" },
			},
			extensions = {
				mcphub = {
					callback = "mcphub.extensions.codecompanion",
					opts = {
						make_vars = true,
						make_slash_commands = true,
						show_result_in_chat = true,
					},
				},
			},
		}

		vim.keymap.set(
			"n",
			"<leader>cc",
			cc.chat,
			{ desc = "Open Code Companion Chat" }
		)
	end,
}
