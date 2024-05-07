return {
	"Bekaboo/dropbar.nvim",
	-- enabled = false,
	dependencies = {
		"nvim-telescope/telescope-fzf-native.nvim",
	},
	config = function()
		local sources = require "dropbar.sources"

		require("dropbar").setup {
			-- bar = {
			-- 	sources = {
			-- 		sources.path,
			-- 		sources.markdown,
			-- 		-- sources.lsp,
			-- 		-- sources.treesitter,
			-- 	},
			-- },
			icons = {
				enable = true,
				ui = {
					bar = {
						separator = " ",
						-- separator = " > ",
						extends = "…",
					},
					menu = {
						separator = " ",
						indicator = " ",
					},
				},
				kinds = {
					use_devicons = true,
				},
			},
		}
	end,
}
