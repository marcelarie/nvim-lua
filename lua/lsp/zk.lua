require("zk").setup {
	picker = "telescope", -- "telescope", "fzf" or "select"
	lsp = {
		config = {
			cmd = { "zk", "lsp" },
			name = "zk",
		},
		auto_attach = {
			enabled = true,
			filetypes = { "markdown" },
		},
	},
}

vim.keymap.set("n", "<Leader>zk", function()
	print "Notes opened"
	vim.fn.chdir "~/clones/pers/notes/"
	vim.cmd "ZkNotes"
	vim.fn.chdir "-"
end)

vim.keymap.set("n", "<Leader>zn", function()
	print "New note created"
	vim.fn.chdir "~/clones/pers/notes/"
	vim.cmd "ZkNew"
	vim.fn.chdir "-"
end)

vim.keymap.set("n", "<Leader>zw", function()
	print "Open work notes"
	vim.fn.chdir "~/clones/pers/notes/"
	vim.cmd "split"
	vim.cmd "e ix07.md"
	vim.fn.chdir "-"
end)

vim.keymap.set("n", "<Leader>zp", function()
	print "Open work notes"
	vim.fn.chdir "~/clones/pers/notes/"
	vim.cmd "split"
	vim.cmd "e hz98.md"
	vim.fn.chdir "-"
end)
