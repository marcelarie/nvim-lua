return {
	"hrsh7th/nvim-automa",
	enabled = false,
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
