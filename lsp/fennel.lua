return {
	-- fennel-ls: more mature, I think less fast
	cmd = { "fennel-ls" },
	capabilities = {
		offsetEncoding = { "utf-8", "utf-16" },
	},
	filetypes = { "fennel" },
	settings = {},

	-- fennel-language-server: rust alternative, still early dev
	-- cmd = { "fennel-language-server" },
	-- filetypes = { "fennel" },
	-- settings = {},
}
