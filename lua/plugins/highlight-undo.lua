return {
	"tzachar/highlight-undo.nvim",
	enabled = false,
	opts = {
		duration = 100,
		undo = {
			hlgroup = "HighlightUndo",
			mode = "n",
			lhs = "u",
			map = "undo",
			opts = {},
		},
		redo = {
			hlgroup = "HighlightRedo",
			mode = "n",
			lhs = "U",
			map = "redo",
			opts = {},
		},
		highlight_for_count = true,
	},
}
