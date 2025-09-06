if vim.g.neovide then
	vim.o.guifont = "BlexMono Nerd Font:h9"
	vim.g.neovide_cursor_trail_size = 0.1
	vim.g.neovide_cursor_antialiasing = true
	vim.opt.guicursor = "i-v:hor20-Cursor/lCursor"
	vim.g.neovide_cursor_animation_length = 0.03 -- Subtle animation instead of 0
	vim.g.neovide_remember_window_size = true
	vim.g.neovide_padding_top = 0
	vim.g.neovide_padding_bottom = 0
	vim.g.neovide_padding_right = 0
	vim.g.neovide_padding_left = 0
	vim.g.neovide_refresh_rate = 60
	vim.g.neovide_refresh_rate_idle = 5
	vim.g.neovide_no_idle = true
	vim.g.neovide_opacity = 0.7
	vim.g.neovide_scroll_animation_length = 0.2
end
