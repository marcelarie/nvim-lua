require("persistence").setup({
	dir = vim.fn.expand(vim.fn.stdpath("config") .. "/sessions/"), -- directory where session files are saved
	options = { "buffers", "curdir", "tabpages", "winsize" }, -- sessionoptions used for saving
})
vim.api.nvim_set_keymap(
	"n",
	"<leader>lo",
	[[<cmd>lua require("persistence").load({ last = true })<cr>]],
	{ noremap = true, silent = false }
)
