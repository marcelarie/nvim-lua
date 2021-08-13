vim.api.nvim_set_keymap(
	"n",
	"<Leader>f",
	[[<Cmd> lua require('telescope.builtin').find_files()<cr>]],
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<Leader>rg",
	[[<Cmd> lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ") })<cr>]],
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<Leader>rw",
	[[<Cmd> lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>") })<cr>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>r",
	[[<Cmd> lua require('telescope.builtin').live_grep()<cr>]],
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<Leader>rh",
	[[<Cmd> lua require('telescope.builtin').help_tags()<cr>]],
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<Leader>kh",
	[[<Cmd> lua require('telescope.builtin').keymaps()<cr>]],
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<Leader>em",
	[[<Cmd> lua require('telescope.builtin').symbols()<cr>]],
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<Leader>gr",
	[[<Cmd> lua require('telescope.builtin').lsp_references()<cr>]],
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<Leader>se",
	[[:lua require('telescope._extensions.session-lens.main').search_session()<cr>]],
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<Leader>b",
	[[:lua require('telescope').extensions.bookmarks.bookmarks(opts)<cr> ]],
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<Leader>gs",
	[[<Cmd> lua require('telescope.builtin').git_status()<cr>]],
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<Leader>gb",
	[[<Cmd> lua require('telescope.builtin').git_branches()<cr>]],
	{ noremap = true, silent = true }
)

-- vim.api.nvim_set_keymap('n', '<Leader>ch',
--                         [[<Cmd> Telescope cheat fcope cheat fd theme=get_dropdown <cr>]],
--                         {noremap = true, silent = true})

vim.api.nvim_set_keymap(
	"n",
	"<Leader>do",
	[[<Cmd> lua require("telescope.builtin").find_files( {prompt_title = "< VimRC >", cwd = "$HOME/"})
<cr>]],
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<Leader>ch",
	[[<Cmd> lua require("telescope.builtin").find_files( {prompt_title = "< Cheats >", cwd = "$HOME/.config/cheat/cheatsheets/personal"})
<cr>]],
	{ noremap = true, silent = true }
)

-- git cli
-- "Using lua function
-- lua require('telescope').extensions.gh.issues()<cr>
-- lua require('telescope').extensions.gh.pull_request()<cr>
-- lua require('telescope').extensions.gh.gist()<cr>
-- lua require('telescope').extensions.gh.run()<cr>
