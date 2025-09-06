return {
	"tanvirtin/vgit.nvim",
	branch = "v1.0.x", -- or tag = 'v1.0.2',
	enabled = false,
	dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
	-- Lazy loading on 'VimEnter' event is necessary.
	event = "VimEnter",
	config = function()
		require("vgit").setup {
			settings = {
				live_blame = { enabled = false },
				signs = {
					definitions = {
						GitSignsAdd = { text = "" },
						GitSignsDelete = { text = "" },
						GitSignsChange = { text = "" },
					},
				},
			},
		}
	end,
}
