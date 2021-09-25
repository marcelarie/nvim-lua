require("neoclip").setup({
	history = 1000,
	filter = nil,
	preview = true,
	default_register = '"',
	content_spec_column = false,
	on_paste = {
		set_reg = false,
	},
	keys = {
		i = {
			select = "<cr>",
			paste = "<c-p>",
			paste_behind = "<c-k>",
		},
		n = {
			select = "<cr>",
			paste = "p",
			paste_behind = "P",
		},
	},
})

vim.api.nvim_set_keymap(
	"n",
	"<Leader>v",
	":lua require('telescope').extensions.neoclip.default()<cr>",
	{ noremap = true, silent = false }
)
