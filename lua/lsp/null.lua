local null_ls = require("null-ls")
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

null_ls.setup({
	sources = {
		formatting.stylua,
		formatting.prettier,
		formatting.prettier_d_slim,
		formatting.alejandra,
		-- formatting.eslint,
		-- completion.spell,
		-- require("null-ls").builtins.diagnostics.eslint, -- eslint-ls already setup at ./eslint.lua
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
		end
	end,
})

vim.api.nvim_set_keymap("v", "ff", ":lua vim.lsp.buf.range_formatting()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "ff", ":lua vim.lsp.buf.formatting_sync()<cr>", { noremap = true, silent = true })
