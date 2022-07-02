local cmd = {
	vim.env.UNAME == "Darwin"
		and "/Users/m.manzanares/clones/lang_servers/ltex-ls-15.2.0/bin/ltex-ls"
		or "./clones/lang_servers/ltex-ls-15.2.1-nightly/bin/ltex-ls",
}

require("lspconfig").ltex.setup {
	cmd = cmd,
}
