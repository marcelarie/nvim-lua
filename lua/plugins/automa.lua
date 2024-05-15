return {
	"hrsh7th/nvim-automa",
	config = function()
		require("automa").setup {
			mapping = {
				["."] = {
					{ 'n#' },
				},
			},
		}
	end,
}
