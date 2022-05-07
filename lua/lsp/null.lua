local null_ls = require "null-ls"
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format {
		filter = function(clients)
			-- filter out clients that you don't want to use
			return vim.tbl_filter(function(client)
				return client.name ~= "tsserver" or client.name ~= "rnix"
			end, clients)
		end,
		bufnr = bufnr,
	}
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
	sources = {
		formatting.stylua,
		-- formatting.prettier,
		formatting.prettierd,
		formatting.alejandra,
		formatting.shfmt,
		formatting.fish_indent,
		-- formatting.prettier_d_slim,
		-- formatting.eslint,
		-- completion.spell,
		-- require("null-ls").builtins.diagnostics.eslint, -- eslint-ls already setup at ./eslint.lua
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

vim.api.nvim_set_keymap(
	"v",
	"ff",
	":lua vim.lsp.buf.range_formatting()<cr>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"ff",
	":lua vim.lsp.buf.formatting_sync()<cr>",
	{ noremap = true, silent = true }
)
