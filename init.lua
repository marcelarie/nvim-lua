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
--
require "treesitter-setup"
require "commands"
require "keymaps"
require "autocmd"
require "color-settings"
require "tmux"
require "lsp-setup"

-------------------------------------------------------------------------------
-- vim: ts=2 sts=2 sw=2 et
