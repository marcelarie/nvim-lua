vim.api.nvim_buf_set_keymap(
	0,
	"n",
	"<Leader>st",
	[[cd->_stash(<c-r> "<esc>)|0]],
	{ noremap = false, silent = true }
)
