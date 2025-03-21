return {
	"renerocksai/telekasten.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	opts = {
		home = vim.fn.expand "~/clones/pers/notes",
	},
	keys = {
		{
			"<Space>to",
			function()
				require("telekasten").toggle_todo()
			end,
			desc = "Toggle Todo",
		},
		{
			"<Space>to",
			function()
				require("telekasten").toggle_todo { v = true }
			end,
			desc = "Toggle Todo (Visual Mode)",
		},
	},
}
