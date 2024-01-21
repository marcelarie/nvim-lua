-- Complition
-- On_attach = require("lspconfig").on_attach
local nvim_lsp = require "lspconfig"

On_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

end

Capabilities = vim.lsp.protocol.make_client_capabilities()
Capabilities.textDocument.completion.completionItem.snippetSupport = true
Capabilities.textDocument.completion.completionItem.preselectSupport = true
Capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
Capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
Capabilities.textDocument.completion.completionItem.deprecatedSupport = true
Capabilities.textDocument.completion.completionItem.commitCharactersSupport =
	true
Capabilities.textDocument.completion.completionItem.tagSupport = {
	valueSet = { 1 },
}
Capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	},
}

Capabilities = require("cmp_nvim_lsp").default_capabilities(Capabilities)

DATA_PATH = vim.fn.stdpath "data"
