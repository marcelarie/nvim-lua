return {
	"tadmccorkle/markdown.nvim",
	ft = "markdown", -- or 'event = "VeryLazy"'
	config = function()
		require("markdown").setup {}

		vim.keymap.set(
			"n",
			"<leader>to",
			":MDTaskToggle<cr>",
			{ desc = "Toggle todo item" }
		)

		vim.keymap.set(
			"n",
			"<leader>tn",
			":MDListItemBelow<cr>",
			{ desc = "Add todo item below" }
		)
	end,
}
