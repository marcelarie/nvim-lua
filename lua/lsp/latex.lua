-- sudo pacman -S texlab
require("lspconfig").texlab.setup {
	cmd = { "texlab" },
	filetypes = { "tex", "bib" },
	settings = {
		texlab = {
			auxDirectory = ".",
			bibtexFormatter = "texlab",
			build = {
				args = {
					"-pdf",
					"-interaction=nonstopmode",
					"-synctex=1",
					"%f",
				},
				executable = "latexmk",
				isContinuous = false,
			},
			chktex = { onEdit = true, onOpenAndSave = true },
			diagnosticsDelay = 300,
			formatterLineLength = 80,
			forwardSearch = { args = {} },
		},
	},
}
