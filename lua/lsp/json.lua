-- npm install -g vscode-json-languageserver
--
local on_attach = require'completion'.on_attach
require'lspconfig'.jsonls.setup {on_attach = on_attach}
