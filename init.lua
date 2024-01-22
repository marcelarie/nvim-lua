--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ Install `lazy.nvim` plugin manager ]]
require "lazy-bootstrap"

-- [[ Configure plugins ]]
require "lazy-plugins"

-- [[ Setting options ]]
require "options"

-- [[ Basic Keymaps ]]
require "keymaps"

-- [[ Autocommands ]]
require "autocmd"

-- [[ Colorscheme settings ]]
require "color-settings"

-- [[ Configure Treesitter ]]
-- (syntax parser for highlighting)
require "treesitter-setup"

-- [[ Configure LSP ]]
-- (Language Server Protocol)
require "lsp-setup"

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
