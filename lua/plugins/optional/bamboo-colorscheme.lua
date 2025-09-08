return {
	"ribru17/bamboo.nvim",
	lazy = false,
	priority = 1000,
	enabled = false,
	config = function()
		require("bamboo").setup {
			-- optional configuration here
		}
		require("bamboo").load()
	end,
}
