return {
	"olimorris/codecompanion.nvim",
	cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions" },
	keys = { "<leader>cc", "<leader>ca" },
	opts = {},
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
		{ "nvim-treesitter/nvim-treesitter", lazy = true },
		{ "ravitemer/mcphub.nvim", lazy = true },
		{ "echasnovski/mini.diff", opts = {}, lazy = true },
	},
	lazy = true,
	config = function()
		---@meta

		---@class CodeCompanion
		local cc = require "codecompanion"

		cc.setup {
			display = {
				-- diff = {
				-- 	provider = "mini_diff",
				-- },
			},
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
			prompt_library = {
				["Generate a Commit Message"] = {
					strategy = "chat",
					description = "Generate a commit message",
					opts = {
						index = 9,
						is_default = true,
						is_slash_cmd = true,
						short_name = "commit",
						auto_submit = true,
						adapter = {
							name = "anthropic",
							model = "claude-3-5-haiku-20241022", -- smaller claude model
						},
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

		vim.keymap.set(
			"v",
			"<leader>cc",
			":'<,'>CodeCompanionChat<cr>",
			{ desc = "Open Code Companion Chat" }
		)
	end,
}
