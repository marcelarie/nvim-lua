-- npm install -g vscode-html-languageserver-bin
local on_attach = require'completion'.on_attach
require'lspconfig'.html.setup {capabilities = capabilities, on_attach = on_attach}
