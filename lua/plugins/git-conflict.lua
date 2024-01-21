return {
	"akinsho/git-conflict.nvim",
	version = "*",
	config = true,
	keys = {
		{
			"n",
			"<Leader>cq",
			":GitConflictListQf<cr>",
			desc = "Git Conflict List Quickfix",
		},
		{
			"n",
			"<Leader>cn",
			":GitConflictNextConflict<cr>",
			desc = "Git Conflict Next Conflict",
		},
		{
			"n",
			"<Leader>cp",
			":GitConflictPrevConflict<cr>",
			desc = "Git Conflict Previous Conflict",
		},
	},
}
