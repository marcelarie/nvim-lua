-- following options are the default
require("nvim-tree").setup {
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = {},
	hijack_cursor = false,
	update_cwd = false,
	-- update_to_buf_dir = {
	-- 	enable = true,
	-- 	auto_open = true,
	-- },
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = false,
		update_cwd = false,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	filters = {
		dotfiles = false,
		custom = {},
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 500,
	},
	view = {
		width = 40,
		-- height = 30,
		hide_root_folder = false,
		side = "left",
		-- auto_resize = false,
		mappings = {
			custom_only = false,
			list = {},
		},
		number = false,
		relativenumber = true,
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
}

-- vim.api.nvim_set_keymap(
-- 	"n",
-- 	"<Leader><Tab>",
-- 	":NvimTreeToggle<cr>",
-- 	{ noremap = true, silent = true }
-- )
-- vim.api.nvim_set_keymap("n", "<Leader>ma", ":set ma<cr>", { noremap = true, silent = true })

vim.cmd "let g:nvim_tree_highlight_opened_files = 1"
