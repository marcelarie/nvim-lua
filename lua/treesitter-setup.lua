-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
-- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
vim.defer_fn(function()
	require("nvim-treesitter.configs").setup {
		auto_install = true,
		highlight = {
			enable = true,
			disable = function(_, bufnr)
				return vim.api.nvim_buf_line_count(bufnr) > 5000
			end,
			additional_vim_regex_highlighting = {
				"org",
				"diff",
				"gitcommit",
			},
		},
	}
end, 0)

-- vim: ts=2 sts=2 sw=2 et
