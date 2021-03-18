-- npm install -g vscode-css-languageserver-bin
local on_attach = require'completion'.on_attach
require'lspconfig'.cssls.setup {on_attach = on_attach}
