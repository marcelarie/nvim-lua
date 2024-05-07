return {
	"roobert/hoversplit.nvim",
	config = function()
		require("hoversplit").setup {
			key_bindings = {
				split = "<leader>hz",
				vsplit = "<leader>hV",
			},
		}
	end,
}
