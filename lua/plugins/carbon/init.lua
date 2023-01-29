require("carbon").setup {
	auto_open = false,
	sidebar_width = 50,
}

vim.keymap.set("n", "<leader>c", ":Carbon<cr>")
-- vim.keymap.set("n", "<leader>cf", ":Fcarbon<cr>")

-- vim.api.nvim_set_keymap(
-- 	"n",
-- 	"<Leader><Tab>",
-- 	":ToggleSidebarCarbon<cr>",
-- 	{ noremap = true, silent = true }
-- )
