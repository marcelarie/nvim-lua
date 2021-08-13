-- npm install -g vscode-css-languageserver-bin
-- Enable completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").cssls.setup({
	on_attach = On_attach,
	capabilities = capabilities,
	-- filetypes = {
	--     "css", "scss", "less", "javascriptreact", "javascript", "typescript",
	--     "typescriptreact"
	-- }
	cmd = { "vscode-css-language-server", "--stdio" },
})
