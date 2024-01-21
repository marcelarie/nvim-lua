return {
	"f-person/git-blame.nvim",
	opts = {
		enabled = false,
		date_format = "%x",
		message_when_not_committed = "",
		highlight_group = "GitSignsCurrentLineBlame",
	},
	-- Key mappings for GitBlame
	keys = {
		{
			"n",
			"<Leader>gt",
			":GitBlameToggle<cr>",
			desc = "Toggle Git Blame",
		},
		{
			"n",
			"<Leader>go",
			":GitBlameOpenFileURL<cr>",
			desc = "Open Git Blame URL",
		},
	},
}
