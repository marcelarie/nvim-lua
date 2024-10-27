return {
	"numToStr/Comment.nvim",
	opts = {},
	lazy = true,
	enabled = false, -- gcc comes from nvim core now
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("Comment").setup {
			pre_hook = require(
				"ts_context_commentstring.integrations.comment_nvim"
			).create_pre_hook(),
		}

		local comment_ft = require "Comment.ft"
		comment_ft.set("fish", { "# %s", "# %s #" })
		comment_ft.set("bash", { "# %s", "# %s #" })
		comment_ft.set("sh", { "# %s", "# %s #" })
		comment_ft.set("", { "# %s", "# %s #" })
		comment_ft.set("typ", { "// %s", "/* %s */" })
	end,
	keys = {
		{ "n", "gcc", ":Comment<cr>", { noremap = false } },
		{ "v", "gc", ":Comment<cr>", { noremap = false } },
	},
}
