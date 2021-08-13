require("lspconfig").perlpls.setup({
	cmd = { "/home/marcel/perl5/bin/pls" },
	filetypes = { "perl" },
	settings = { perl = { perlcritic = { enabled = false } } },
})
