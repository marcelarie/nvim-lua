require("lspconfig").lua_ls.setup {
	settings = {
		Lua = {
			workspace = {
				checkThirdParty = false,
			},
			completion = {
				callSnippet = "Replace",
			},
			hint = { enable = true },
		},
	},
}
