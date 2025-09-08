return {
	"roobert/hoversplit.nvim",
	enabled = false,
	config = function()
		require("hoversplit").setup {
			key_bindings = {
				split = "<leader>hz",
				vsplit = "<leader>hV",
			},
		}
	end,
}
