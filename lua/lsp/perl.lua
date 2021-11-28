-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
require("lspconfig").perlls.setup({
	cmd = {
		"perl",
		"-MPerl::LanguageServer",
		"-e",
		"Perl::LanguageServer::run",
		"--",
		-- "--debug",
		"--port 13603",
		"--nostdio 0",
		"--version 2.3.0",
	},
	-- capabilities = capabilities,
	filetypes = { "perl" },
	root_dir = vim.loop.cwd,
	single_file_mode = true,
	settings = {
		perl = {
			fileFilter = { ".pm", ".pl" },
			ignoreDirs = ".git",
			perlCmd = "perl",
			perlInc = " ",
		},
	},
})
