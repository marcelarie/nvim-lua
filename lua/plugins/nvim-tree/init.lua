-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

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
		enable = false,
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
		enable = false,
		ignore = false,
		timeout = 500,
	},
	-- renderer = {
	-- 	icons = {
	-- 		show = {
	-- 			file = false,
	-- 			folder = false,
	-- 			folder_arrow = true,
	-- 			git = true
	-- 		},
	-- 	},
	-- },
	view = {
		adaptive_size = true,
		width = 40,
		-- height = 30,
		hide_root_folder = false,
		side = "left",
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

vim.api.nvim_set_keymap(
	"n",
	"<Leader><Tab>",
	":NvimTreeToggle<cr>",
	{ noremap = true, silent = true }
)
-- vim.api.nvim_set_keymap("n", "<Leader>ma", ":set ma<cr>", { noremap = true, silent = true })

vim.cmd "let g:nvim_tree_highlight_opened_files = 1"

-- HELP:
--    bmv : bulk_move
--  <C-]> : cd
-- <2-RightMouse> : cd
--      F : clear_live_filter
--      q : close
--   <BS> : close_node
--      W : collapse_all
--      c : copy
--     gy : copy_absolute_path
--      y : copy_name
--      Y : copy_path
--      a : create
--      x : cut
--      - : dir_up
--   <CR> : edit
--      o : edit
-- <2-LeftMouse> : edit
--  <C-e> : edit_in_place
--      O : edit_no_picker
--      E : expand_all
--      K : first_sibling
--  <C-r> : full_rename
--      J : last_sibling
--      f : live_filter
--     ]e : next_diag_item
--     ]c : next_git_item
--      > : next_sibling
--      P : parent_node
--      p : paste
--     [e : prev_diag_item
--     [c : prev_git_item
--      < : prev_sibling
--  <Tab> : preview
--      R : refresh
--      d : remove
--      r : rename
--      e : rename_basename
--      . : run_file_command
--      S : search_node
--  <C-x> : split
--      s : system_open
--  <C-t> : tabnew
--      U : toggle_custom
--      H : toggle_dotfiles
--  <C-k> : toggle_file_info
--      C : toggle_git_clean
--      I : toggle_git_ignored
--     g? : toggle_help
--      m : toggle_mark
--      B : toggle_no_buffer
--      D : trash
--  <C-v> : vsplit
