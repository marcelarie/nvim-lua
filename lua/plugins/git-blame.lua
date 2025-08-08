return {
	"f-person/git-blame.nvim",
	config = function()
		local l = 1
		require("gitblame").setup {
			enabled = false,
			date_format = "%x",
			message_when_not_committed = "",
			highlight_group = "GitSignsCurrentLineBlame",
		}

		local l = 1

		vim.keymap.set(
			"n",
			"<Leader>go",
			":GitBlameOpenFileURL<cr>",
			{ noremap = true, silent = false }
		)
	end,
}
