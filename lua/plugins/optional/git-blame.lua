return {
	"f-person/git-blame.nvim",
	cmd = { "GitBlameToggle", "GitBlameEnable", "GitBlameOpenCommitURL", "GitBlameOpenFileURL", "GitBlameCopySHA", "GitBlameCopyFileURL" },
	keys = {
		{ "<Leader>go", "<cmd>GitBlameOpenFileURL<cr>", desc = "Open file URL in git blame" },
		{ "<Leader>yl", "<cmd>GitBlameCopyFileURL<cr>", desc = "Copy file URL from git blame" },
	},
	lazy = true,
	config = function()
		require("gitblame").setup {
			enabled = false,
			date_format = "%x",
			message_when_not_committed = "",
			highlight_group = "GitSignsCurrentLineBlame",
		}
	end,
}
