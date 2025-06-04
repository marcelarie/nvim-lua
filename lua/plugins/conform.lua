return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup {
			formatters = {
				black = {
					-- command = "black",
					prepend_args = { "--line-length", "100" },
				},
			},
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "isort", "black" },
				-- You can customize some of the format options for the filetype (:help conform.format)
				rust = { "rustfmt", lsp_format = "fallback" },
				nix = { "alejandra", lsp_format = "fallback" },
				-- Conform will run the first available formatter
				typescript = {
					"eslint",
					"eslint_d",
					"prettierd",
					"prettier",
					stop_after_first = true,
				},
				typescriptreact = {
					"eslint",
					"eslint_d",
					"prettierd",
					"prettier",
					stop_after_first = true,
				},
				javascript = {
					"eslint",
					"eslint_d",
					"prettierd",
					"prettier",
					stop_after_first = true,
				},
				javascriptreact = {
					"eslint",
					"eslint_d",
					"prettierd",
					"prettier",
					stop_after_first = true,
				},
				javascript = {
					"eslint",
					"eslint_d",
					"prettierd",
					"prettier",
					stop_after_first = true,
				},
				css = {
					"eslint",
					"eslint_d",
					"prettierd",
					"prettier",
					stop_after_first = true,
				},
				scss = {
					"eslint",
					"eslint_d",
					"prettierd",
					"prettier",
					stop_after_first = true,
				},
				bash = { "shfmt" },
			},
		}
	end,
}
