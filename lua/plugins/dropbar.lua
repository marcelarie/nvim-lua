return {
	{
		"Bekaboo/dropbar.nvim",
		-- enabled = false,
		dependencies = {
			-- optional, but required for fuzzy finder support
			"nvim-telescope/telescope-fzf-native.nvim",
		},
		opts = {
			-- bar = {
			-- 	sources = {
			-- 		treesitter = {},
			-- 		lsp = {},
			-- 	},
			-- },
			icons = {
				enable = true,
				ui = {
					bar = {
						separator = " ",
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
		},
	},
}
