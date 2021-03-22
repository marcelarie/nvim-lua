-- sudo pacman -S rust-analazyer
local on_attach = require'completion'.on_attach
require'lspconfig'.rust_analyzer.setup {on_attach = on_attach}
