vim.o.termguicolors = true
-- vim.o.background = "light"
vim.o.background = "dark"
vim.wo.colorcolumn = "80"

vim.cmd "set t_Co=256"

-- require "plugins.catpuccin" -- ./lua/plugins/catpuccin/init.lua
require "plugins.lighthaus" -- ./lua/plugins/lighthaus/init.lua
-- require("no-clown-fiesta").setup { type = "bold,italic" }

-- vim.cmd.colorscheme "lighthaus_dark"
-- vim.cmd("colorscheme base16-equilibrium-light")

-- vim.g.gruvbox_flat_style = "dark"
-- vim.g.gruvbox_flat_style = "light"

-- BASE 16 light
-- use("base16-colorscheme").setup({ base00 = "#f6f7f6", base01 = "#2c313c", base02 = "#f6f7f6", base03 = "#6c7891", base04 = "#565c64", base05 = "#abb2bf", base06 = "#9a9bb3", base07 = "#c5c8e6", base08 = "#e06c75", base09 = "#d19a66", base0A = "#e5c07b", base0B = "#98c379", base0C = "#56b6c2", base0D = "#0184bc", base0E = "#c678dd", base0F = "#a06949", })
