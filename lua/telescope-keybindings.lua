local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<Leader>f", ":Telescope find_files<cr>", opts)
map("n", "<Leader>k", ":Telescope keymaps<cr>", opts)
map("n", "<Leader>em", ":Telescope symbols<cr>", opts)
map("n", "<Leader>gr", ":Telescope lsp_references<cr>", opts)
-- map("n", "<Leader>b", ":Telescope bookmarks<cr>", opts)
map("n", "<Leader>gs", ":Telescope git_status<cr>", opts)
map("n", "<Leader>gb", ":Telescope git_branches<cr>", opts)
map("n", "<Leader>tb", ":Telescope buffers<cr>", opts)
map("n", "<Leader>th", ":Telescope help_tags<cr>", opts)
map(
	"n",
	"<leader>rg",
	[[<cmd> lua require('telescope.builtin').grep_string({ search = vim.fn.input("grep for > ") })<cr>]],
	opts
)

map(
	"n",
	"<leader>rw",
	[[<cmd> lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>") })<cr>]],
	opts
)
map("n", "<leader>r", [[<cmd> lua require('telescope.builtin').live_grep()<cr>]], opts)

map("n", "<leader>rh", [[<cmd> lua require('telescope.builtin').help_tags()<cr>]], opts)

map(
	"n",
	"<leader>rc",
	[[<cmd> lua require("telescope.builtin").find_files( {prompt_title = "< vimrc >", cwd = "$home/.config/nvim/"}) <cr>]],
	opts
)

map("n", "<leader>zo", ":lua require'telescope'.extensions.zoxide.list{}<cr>", opts)
