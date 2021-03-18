-- npm install -g vim-language-server
local on_attach = require'completion'.on_attach
require'lspconfig'.vimls.setup {on_attach = on_attach}
