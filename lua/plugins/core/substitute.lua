return {
	"gbprod/substitute.nvim",
	lazy = false,
	config = function()
		require("substitute").setup {}
		local kset = vim.keymap.set
		kset("n", "s", require("substitute").operator, { noremap = true })
		kset("n", "ss", require("substitute").line, { noremap = true })
		kset("n", "S", require("substitute").eol, { noremap = true })
		kset("x", "s", require("substitute").visual, { noremap = true })
	end,
}
