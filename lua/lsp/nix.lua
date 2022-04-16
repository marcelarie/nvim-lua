-- nix-env -i -f https://github.com/nix-community/rnix-lsp/archive/master.tar.gz
require("lspconfig").rnix.setup({
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end,
})
