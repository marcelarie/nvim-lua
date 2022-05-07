require("lspconfig").perlpls.setup {
	cmd = { "/home/marcel/perl5/bin/pls" },
	filetypes = { "perl" },
	settings = {
		perl = {
			perlcritic = { enabled = true },
			syntax = {
				perl = "perl",
				enabled = true,
			},
		},
	},
	single_file_support = true,
}
