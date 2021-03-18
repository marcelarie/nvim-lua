-- npm i -g bash-language-server
local on_attach = require'completion'.on_attach
require'lspconfig'.bashls.setup {on_attach = on_attach}
