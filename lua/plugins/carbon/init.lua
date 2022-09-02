require("carbon").setup {
	auto_open = false,
	sidebar_width = 65,
}

vim.keymap.set("n", "<leader>c", ":Carbon<cr>")
vim.keymap.set("n", "<leader>cf", ":Fcarbon<cr>")
vim.keymap.set("n", "<leader>cl", ":Lcarbon<cr>")
