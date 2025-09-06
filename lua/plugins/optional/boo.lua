-- This plugins seems to be a reimplementation of the LSP hover feature
-- For now I will keep it disabled, since I am not sure if I will use it

return {
	"LukasPietzschmann/boo.nvim",
	enabled = false,
	config = function()
		require("boo").setup {
			-- win_opts will be used when creating the window. You can put everything here,
			-- that vim.api.nvim_open_win (https://neovim.io/doc/user/api.html#nvim_open_win())
			-- can handle.
			win_opts = {
				title = "",
				title_pos = "center",
				relative = "cursor",
				row = 1,
				col = 0,
				style = "minimal",
				border = "rounded",
				focusable = true,
			},
			-- The window will not be wider than max_width (in character cells)
			max_width = 80,
			-- The window will not be taller than max_height (in character cells)
			max_height = 20,
			-- When the boo window is focused, pressing one of these will close it.
			-- They will only be mapped in normalmode
			escape_mappings = { "q", "<esc>" },
			-- Focus boo's window automatically after it's created
			focus_on_open = true,
			-- When the boo window is focused, and you'll focus another buffer,
			-- the window will be closed when this is set to true
			close_on_leave = true,
			-- When moving the cursor in the buffer that boo was opened from, boo
			-- will be closed. This makes most sense when paired with
			-- `focus_on_open = false`
			close_on_mouse_move = true,
		}

		vim.keymap.set("n", "gh", function()
			-- then here you can add more logic
			require("boo").boo()
		end, { desc = "Show LSP descr" })
	end,
}
