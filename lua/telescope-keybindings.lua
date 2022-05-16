local map = vim.keymap.set
local opts = { silent = true }

map("n", "<Leader>f", ":Telescope find_files<cr>", opts)
map("n", "<Leader>k", ":Telescope keymaps<cr>", opts)
map("n", "<Leader>em", ":Telescope symbols<cr>", opts)
map("n", "<Leader>gr", ":Telescope lsp_references<cr>", opts)
map("n", "<Leader>gs", ":Telescope git_status<cr>", opts)
map("n", "<Leader>gb", ":Telescope git_branches<cr>", opts)
map("n", "<Leader>tb", ":Telescope buffers<cr>", opts)

map("n", "<leader>rg", function()
	require("telescope.builtin").grep_string {
		search = vim.fn.input "grep for > ",
	}
end, opts)

map("n", "<leader>rw", function()
	require("telescope.builtin").grep_string {
		search = vim.fn.expand "<cword>",
	}
end, opts)

map("n", "<leader>r", function()
	require("telescope.builtin").live_grep()
end, opts)

map("n", "<leader>th", function()
	require("telescope.builtin").help_tags {}
end, opts)

map("n", "<leader>br", function()
	require("telescope.builtin").current_buffer_fuzzy_find {
		default_text = vim.fn.expand "<cword>",
	}
end, opts)

map("n", "<leader>bu", function()
	require("telescope.builtin").current_buffer_fuzzy_find {}
end, opts)

map("n", "<leader>rc", function()
	require("telescope.builtin").find_files {
		prompt_title = "< vimrc >",
		cwd = "~/.config/nvim/",
	}
end, opts)

map("n", "<leader>zo", function()
	require("telescope").extensions.zoxide.list {}
end, opts)
