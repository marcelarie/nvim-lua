local diff_colors = {
	delete = "#681300",
	add = "#055800",
	base_text = "#000000",
}

return {
	"akinsho/git-conflict.nvim",
	version = "*",
	lazy = false,
	config = function()
		vim.api.nvim_set_hl(0, "DiffTextConflict", {
			fg = "#000000",
			bg = diff_colors.base_text,
		})
		vim.api.nvim_set_hl(
			0,
			"DiffAddConflict",
			{ fg = "#ffffff", bg = diff_colors.add }
		)
		vim.api.nvim_set_hl(
			0,
			"DiffDeleteConflict",
			{ fg = "#ffffff", bg = diff_colors.delete }
		)
		require("git-conflict").setup {
			default_mappings = true, -- disable buffer local mapping created by this plugin
			disable_diagnostics = true, -- This will disable the diagnostics in a buffer whilst it is conflicted

			-- They must have background color, otherwise the default color will be used
			highlights = {
				incoming = "DiffDeleteConflict",
				current = "DiffAddConflict",
				ancestor = "DiffTextConflict",
			},
		}
	end,
	keys = {
		{
			"n",
			"<Leader>cq",
			":GitConflictListQf<cr>",
			desc = "Git Conflict List Quickfix",
		},
		{
			"n",
			"<Leader>cn",
			":GitConflictNextConflict<cr>",
			desc = "Git Conflict Next Conflict",
		},
		{
			"n",
			"<Leader>cp",
			":GitConflictPrevConflict<cr>",
			desc = "Git Conflict Previous Conflict",
		},
	},
}
