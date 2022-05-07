-- paru bash-language-server
local capabilities = require("cmp_nvim_lsp").update_capabilities(
	vim.lsp.protocol.make_client_capabilities()
)
require("lspconfig").bashls.setup {
	on_attach = On_attach,
	capabilities = capabilities,
}
