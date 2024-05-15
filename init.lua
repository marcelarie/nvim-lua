-------------------------------------------------------------------------------
--                    Marcel Arie's neovim configuration                       |
-------------------------------------------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require "global"

require "lazy-bootstrap"
require "lazy-plugins"
--
require "treesitter-setup"
require "options"
require "keymaps"
require "autocmd"
require "commands"
require "color-settings"
require "lsp-setup"

-------------------------------------------------------------------------------
-- vim: ts=2 sts=2 sw=2 et
