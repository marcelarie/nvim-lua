return {
	"kylechui/nvim-surround",
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("nvim-surround").setup {}
	end,
}
