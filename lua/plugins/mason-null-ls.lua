return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"nvimtools/none-ls.nvim",
	},
	config = function()
		local null_ls = require "null-ls"
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		-- local completion = null_ls.builtins.completion
		local code_actions = null_ls.builtins.code_actions

		null_ls.setup {
			sources = {
				-- formatting.stylua,
				formatting.shfmt,
				-- formatting.fixjson,
				formatting.fish_indent,
				-- formatting.mdformat,
				formatting.prettierd,
				formatting.ocamlformat,
				formatting.typstyle,

				formatting.rubocop,
				-- diagnostics.rubocop,
				-- diagnostics.shellcheck,
				-- diagnostics.eslint_d,
				-- formatting.eslint_d,
				-- code_actions.eslint_d,
				code_actions.gitsigns,
				-- code_actions.shellcheck,
				code_actions.gitrebase,
				code_actions.refactoring,
				-- code_actions.ltrs, -- LanguageTool API

				-- formatting.deno_fmt.with { condition = deno_condition },
				-- diagnostics.gitlint,
				-- diagnostics.selene,
				-- diagnostics.commitlint,
				-- diagnostics.luacheck,
				diagnostics.fish,
				-- diagnostics.ltrs, -- LanguageTool API

				-- PYTHON
				-- formatting.ruff,
				-- diagnostics.ruff,
				-- formatting.black,
				-- diagnostics.flake8,

				-- formatting.taplo,

				-- formatting.fixjson,

				-- formatting.perltidy,
				-- formatting.gofumpt,
				formatting.gofmt,
			},
		}

		require("mason-null-ls").setup {
			ensure_installed = { "stylua" },
			handlers = {
				stylua = function(source_name, methods)
					null_ls.register(null_ls.builtins.formatting.stylua)
				end,
				shfmt = function(source_name, methods)
					-- custom logic
					require("mason-null-ls").default_setup(source_name, methods) -- to maintain default behavior
				end,
			},
		}
	end,
}
