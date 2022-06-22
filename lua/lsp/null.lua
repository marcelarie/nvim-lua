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

null_ls.setup {
	sources = {
		formatting.stylua,
		formatting.alejandra,
		formatting.shfmt,
		formatting.fish_indent,

		code_actions.eslint_d,
		diagnostics.eslint_d,
		formatting.eslint_d,

		-- formatting.rustfmt,
		-- formatting.eslint,
		-- completion.spell,
		-- formatting.prettier_d_slim,
		-- formatting.prettier,
		-- formatting.prettierd,
	},
	on_attach = function(client, bufnr)
		if client.supports_method "textDocument/formatting" then
			vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- lsp_formatting(bufnr)
					vim.lsp.buf.format { bufnr = bufnr }
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
