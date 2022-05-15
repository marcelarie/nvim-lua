local null_ls = require "null-ls"

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format {
		bufnr = bufnr,
		timeout_ms = 2000,
	}
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
	sources = {
		formatting.stylua,
		formatting.alejandra,
		formatting.shfmt,
		formatting.fish_indent,
		-- formatting.rustfmt,
		formatting.eslint_d,
		-- {
		-- 	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html", "json", "jsonc", "yaml", "markdown", "graphql", "handlebars", "svelte" },
		-- 	only_local = "node_modules/.bin",
		-- }
		-- formatting.prettier,
		-- formatting.prettierd,
		-- formatting.prettier_d_slim,
		-- completion.spell,
	},
	on_attach = function(client, bufnr)
		if client.supports_method "textDocument/formatting" then
			vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
	end,
}

vim.keymap.set("v", "ff", function()
	vim.lsp.buf.range_formatting()
end)

vim.keymap.set("n", "ff", function()
	vim.lsp.buf.format { timeout_ms = 2000 }
end)
