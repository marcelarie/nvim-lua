local null_ls = require "null-ls"

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion
local code_actions = null_ls.builtins.code_actions

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format {
		filter = function(clients)
			-- filter out clients that you don't want to use
			return vim.tbl_filter(function(client)
				return client.name ~= "tsserver"
			end, clients)
		end,
		bufnr = bufnr,
		timeout_ms = 2000,
	}
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local eslint_condition = function(utils)
	return utils.root_has_file { ".eslintrc", ".eslintrc.js", ".eslintrc.json" }
end

local deno_condition = function(utils)
	return utils.root_has_file { "deno.json", "deno.jsonc" }
end

null_ls.setup {
	sources = {
		formatting.stylua,
		-- formatting.alejandra
		formatting.nixfmt,
		formatting.shfmt,
		formatting.fish_indent,
		-- formatting.markdownlint,
		formatting.mdformat,
		formatting.prettierd,

		formatting.rubocop,
		diagnostics.rubocop,
		diagnostics.shellcheck,
		diagnostics.eslint_d.with { condition = eslint_condition },
		formatting.eslint_d.with { condition = eslint_condition },
		code_actions.eslint_d.with { condition = eslint_condition },
		code_actions.gitsigns,
		code_actions.shellcheck,
		code_actions.gitrebase,
		code_actions.refactoring,
		-- code_actions.ltrs, -- LanguageTool API

		-- formatting.deno_fmt.with { condition = deno_condition },
		-- diagnostics.gitlint,
		-- diagnostics.selene,
		-- diagnostics.commitlint,
		diagnostics.luacheck,
		diagnostics.fish,
		diagnostics.flake8,
		-- diagnostics.ltrs, -- LanguageTool API
		formatting.black,
		formatting.taplo,

		formatting.fixjson,

		formatting.perltidy,
		formatting.gofumpt,
		-- formatting.rustfmt,
		-- formatting.eslint,
		-- completion.spell,
		-- formatting.prettier_d_slim,
		-- formatting.prettier,
		-- formatting.prettierd,
	},
	on_attach = function(client, bufnr)
		-- if client.supports_method "textDocument/formatting" then
		-- 	vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
		-- 	vim.api.nvim_create_autocmd("BufWritePre", {
		-- 		group = augroup,
		-- 		buffer = bufnr,
		-- 		callback = function()
		-- 			-- lsp_formatting(bufnr)
		-- 			vim.lsp.buf.format { bufnr = bufnr }
		-- 		end,
		-- 	})
		-- end
	end,
}

-- just trying
local vim_modes = "vn"
for mode in string.gmatch(vim_modes, "%a") do
	vim.keymap.set(mode, "ff", vim.lsp.buf.format) -- { timeout_ms = 2000 }
end
