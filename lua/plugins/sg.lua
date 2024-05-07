return {
	"sourcegraph/sg.nvim",
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
