-------------------------------------------------------------------------------
--                    Marcel Arie's neovim configuration                       |
-------------------------------------------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require "profiler"
require "global"
require "options"

require "lazy-bootstrap"
require "lazy-plugins"

require "treesitter-setup"
require "commands"
require "keymaps"
require "autocmd"
require "color-settings"
-- require "ziggy"
require "zig-official-color"
require "sys-clip"
require "tmux"
require "lsp"
require "lsp-setup"

-- features
require "features.persistend-qfl"
require "features.update-fe-version"

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

-------------------------------------------------------------------------------
-- vim: ts=2 sts=2 sw=2 et
