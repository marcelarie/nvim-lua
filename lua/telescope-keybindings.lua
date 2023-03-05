local ts = require "telescope"
local tbi = require "telescope.builtin"
local map = vim.keymap.set
local opts = { silent = true }

map("n", "<Leader>f", ":Telescope find_files<cr>", opts)
-- map("n", "<Leader>f", function()
-- 	bi.find_files {
-- 		previewer = false,
-- 		layout_strategy = "horizontal",
-- 	}
-- end)

map(
	"n",
	"<leader>do",
	":Telescope find_files hidden=true no_ignore=true<cr>",
	opts
)
map("n", "<Leader>k", ":Telescope keymaps<cr>", opts)
map("n", "<Leader>em", ":Telescope symbols<cr>", opts)
map("n", "<Leader>gr", ":Telescope lsp_references<cr>", opts)
map("n", "<Leader>gs", ":Telescope git_status<cr>", opts)
map("n", "<Leader>gb", ":Telescope git_branches<cr>", opts)
map("n", "<Leader>tb", ":Telescope buffers<cr>", opts)

map("n", "<leader>rg", function()
	tbi.grep_string {
		search = vim.fn.input "grep for > ",
	}
end, opts)

map("n", "<leader>rw", function()
	tbi.grep_string {
		search = vim.fn.expand "<cword>",
	}
end, opts)

map("n", "<leader>r", tbi.live_grep, opts)

map("n", "<leader>th", function()
	tbi.help_tags {}
end, opts)

map("n", "<leader>br", function()
	tbi.current_buffer_fuzzy_find {
		default_text = vim.fn.expand "<cword>",
	}
end, opts)

map("n", "<leader>bu", function()
	tbi.current_buffer_fuzzy_find {}
end, opts)

map("n", "<leader>rc", function()
	tbi.find_files {
		prompt_title = "< vimrc >",
		cwd = "~/.config/nvim/",
	}
end, opts)

map("n", "<leader>nf", function()
	tbi.grep_string {
		search = vim.fn.input "grep for > ",
		cwd = "./node_modules",
	}
end, opts)

map("n", "<leader>nm", function()
	tbi.live_grep {
		cwd = "./node_modules",
	}
end, opts)

map("n", "<leader>zo", function()
	ts.extensions.zoxide.list {}
end, opts)

map("n", "<leader>rh", ts.extensions.http.list, opts)
