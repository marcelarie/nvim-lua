return {
	"olimorris/persisted.nvim",
	config = true,
	lazy = false,
	keys = {
		{
			"n",
			"<Leader>se",
			":Telescope persisted<cr>",
			desc = "Telescope Persisted",
		},
		{
			"n",
			"<Leader>sel",
			":SessionLoadLast<cr>",
			desc = "Load Last Session",
		},
		{
			"n",
			"<Leader>ts",
			":Telescope persisted<cr>",
			desc = "Telescope Persisted",
		},
	},
}
