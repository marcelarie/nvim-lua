return {
	"dmmulroy/tsc.nvim",
	config = function()
		require("tsc").setup()
	end,
	cmd = { "TSC", "TSCOpen" },
}
