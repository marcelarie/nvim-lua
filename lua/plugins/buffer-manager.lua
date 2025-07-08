return {
	"j-morano/buffer_manager.nvim",
	event = "BufWinEnter",
	config = function()
		require("buffer_manager").setup {
			line_keys = "1234567890",
			select_menu_item_commands = {
				edit = {
					key = "<CR>",
					command = "edit",
				},
			},
			focus_alternate_buffer = false,
			width = 0.40,
			height = 0.30,
			short_file_names = false,
			show_depth = true,
			short_term_names = false,
			loop_nav = true,
			-- highlight = "Normal:BufferManagerBorder",
			win_extra_options = {},
			borderchars = {
				-- "─", "│", "─", "│", "╭", "╮", "╯", "╰",
				"",
				"",
				"",
				"",
				"",
				"",
				"",
				"",
			},
			format_function = nil,
			order_buffers = nil,
			show_indicators = nil,
			toggle_key_bindings = { "<leader>q" },
		}

		local bmui = require "buffer_manager.ui"
		vim.keymap.set({ "t", "n" }, "gb", bmui.toggle_quick_menu)
	end,
}
