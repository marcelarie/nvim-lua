local ts = require("typescript")

ts.setup {
	disable_commands = false, -- prevent the plugin from creating Vim commands
	debug = false, -- enable debug logging for commands
	go_to_source_definition = {
		fallback = true, -- fall back to standard LSP definition on failure
	},
	server = { -- pass options to lspconfig's setup method
		on_attach = On_attach,
		-- cmd = {
		-- 	"typescript-language-server",
		-- 	"--stdio",
		-- 	"--tsserver-path=/Users/m.manzanares/node_modules/typescript/bin/tsserver",
		-- },
	},
}

local opts = { silent = true }
vim.keymap.set("n", "gs", ts.actions.organizeImports, opts)
vim.keymap.set("n", "gr", ts.renameFile, opts)
vim.keymap.set("n", "ga", ts.actions.addMissingImports, opts)
vim.keymap.set("n", "gi", ":TSLspImportCurrent<CR>", opts)
vim.keymap.set("n", "gsd", ":TypescriptGoToSourceDefinition<CR>", opts)
vim.keymap.set("n", "gfa", ts.actions.fixAll, opts)
