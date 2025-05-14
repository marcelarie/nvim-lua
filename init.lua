-------------------------------------------------------------------------------
--                    Marcel Arie's neovim configuration                       |
-------------------------------------------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- To hide deprecation warning
---@diagnostic disable-next-line: duplicate-set-field
-- vim.deprecate = function() end

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

if vim.g.neovide then
	vim.o.guifont = "BlexMono Nerd Font:h9"
	vim.opt.guicursor = "i-v:hor20-Cursor/lCursor" -- Add unerline cursor on Insert and Visual mode
end

-------------------------------------------------------------------------------
-- vim: ts=2 sts=2 sw=2 et
