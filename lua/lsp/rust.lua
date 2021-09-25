-- sudo pacman -S rust-analazyer
require("lspconfig").rust_analyzer.setup({
	on_attach = On_attach,
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			procMacro = { enable = true },
			cargo = { loadOutDirsFromCheck = { enable = true } },
			diagnostics = {
				enable = true,
				disabled = { "unresolved-proc-macro", "macro_error" },
				enableExperimental = true,
			},
		},
	},
})
