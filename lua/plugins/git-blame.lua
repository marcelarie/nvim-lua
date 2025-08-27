return {
	"f-person/git-blame.nvim",
	config = function()
		require("gitblame").setup {
			enabled = false,
			date_format = "%x",
			message_when_not_committed = "",
			highlight_group = "GitSignsCurrentLineBlame",
		}

		vim.keymap.set(
			"n",
			"<Leader>go",
			":GitBlameOpenFileURL<cr>",
			{ noremap = true, silent = false }
		)

		vim.keymap.set(
			"n",
			"<Leader>yl",
			":GitBlameCopyFileURL<cr>",
			{ noremap = true, silent = false }
		)
	end,
}
