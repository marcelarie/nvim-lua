return {
	"f-person/git-blame.nvim",
	cmd = {
		"GitBlameToggle",
		"GitBlameEnable",
		"GitBlameOpenCommitURL",
		"GitBlameOpenFileURL",
		"GitBlameCopySHA",
		"GitBlameCopyFileURL",
	},
	keys = {
		{
			"<Leader>go",
			"<cmd>GitBlameOpenFileURL<cr>",
			desc = "Open file URL in git blame",
		},
		{
			"<Leader>yl",
			function()
				vim.cmd.GitBlameCopyFileURL()
				vim.notify("Copied file URL from git blame")
			end,
			desc = "Copy file URL from git blame",
		},
	},
	event = "VeryLazy",
	config = function()
		require("gitblame").setup {
			enabled = false,
			date_format = "%x",
			message_when_not_committed = "",
			highlight_group = "GitSignsCurrentLineBlame",
		}
	end,
}
