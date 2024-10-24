return {
	"sourcegraph/sg.nvim",
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		enable_cody = true,
		accept_tos = true,
		download_binaries = true,
	},
}
