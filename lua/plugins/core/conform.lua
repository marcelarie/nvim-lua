return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup {
			formatters = {
				black = { prepend_args = { "--line-length", "100" } },
				tombi = { -- for some reason this one does not work
					command = "tombi",
					prepend_args = { "format", "--offline", "-v" },
				},
				cbfmt = {
					prepend_args = {
						"--config",
						vim.env.HOME .. "/.config/cbfmt/cbfmt.toml",
					},
				},
				dprint = {
					timeout_ms = 500,
					lsp_format = "prefer",
					condition = function(ctx)
						return vim.fs.find(
							{ "dprint.json" },
							{ path = ctx.filename, upward = true }
						)[1]
					end,
				},
			},
			formatters_by_ft = {
				lua = { "stylua" },
				json = { "fixjson" },
				jsonc = { "deno_fmt", "prettierd", "prettier", "biome", stop_after_first = true },
				toml = { "tombi", lsp_format = "fallback" },
				-- Conform will run multiple formatters sequentially
				python = { "isort", "black" },
				-- You can customize some of the format options for the filetype (:help conform.format)
				rust = { "rustfmt", lsp_format = "fallback" },
				nix = { "alejandra", lsp_format = "fallback" },
				-- Conform will run the first available formatter
				typescript = {
					-- "eslint",
					"eslint_d",
					"prettierd",
					"prettier",
					stop_after_first = true,
				},
				typescriptreact = {
					-- "eslint",
					"eslint_d",
					"prettierd",
					"prettier",
					stop_after_first = true,
				},
				javascript = {
					-- "eslint",
					"eslint_d",
					"prettierd",
					"prettier",
					stop_after_first = true,
				},
				javascriptreact = {
					-- "eslint",
					"eslint_d",
					"prettierd",
					"prettier",
					stop_after_first = true,
				},
				css = { "prettierd", "prettier", stop_after_first = true },
				scss = { "prettierd", "prettier", stop_after_first = true },
				markdown = { "dprint", "cbfmt" },
				sh = { "shfmt" },
				bash = { "shfmt" },
			},
		}
	end,
}
