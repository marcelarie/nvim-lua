require("zk").setup {
	-- can be "telescope", "fzf" or "select" (`vim.ui.select`)
	-- it's recommended to use "telescope" or "fzf"
	picker = "telescope",

	lsp = {
		-- `config` is passed to `vim.lsp.start_client(config)`
		config = {
			cmd = { "zk", "lsp" },
			name = "zk",
			-- on_attach = ...
			-- etc, see `:h vim.lsp.start_client()`
		},

		-- automatically attach buffers in a zk notebook that match the given filetypes
		auto_attach = {
			enabled = true,
			filetypes = { "markdown" },
		},
	},
}

-- TODO: do this with vim.chdir
vim.keymap.set("n", "<Leader>zk", function()
	vim.fn.chdir "~/clones/pers/notes/"
	vim.cmd "ZkNotes"
	vim.fn.chdir "-"
	print "Notes opened"
end)

vim.keymap.set("n", "<Leader>zn", function()
	vim.fn.chdir "~/clones/pers/notes/"
	vim.cmd "ZkNotes"
	vim.fn.chdir "-"
	print "New note created"
end)
