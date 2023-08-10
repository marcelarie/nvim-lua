-- sudo pacman -S rust-analazyer
local capabilities = require("cmp_nvim_lsp").default_capabilities(
	vim.lsp.protocol.make_client_capabilities()
)
require("lspconfig").rust_analyzer.setup {
	on_attach = On_attach,
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			procMacro = { enable = true },
			cargo = { loadOutDirsFromCheck = { enable = true } },
			diagnostics = {
				enable = true,
				-- disabled = { "unresolved-proc-macro", "macro_error" },
				enableExperimental = true,
			},
		},
	},
}
