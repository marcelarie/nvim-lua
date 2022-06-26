-- keybindings
vim.api.nvim_set_keymap(
	"n",
	"<Leader>mp",
	':execute "Glance" | !open http://localhost:8765<cr>',
	{ noremap = true, silent = false }
)
