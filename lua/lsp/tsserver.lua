-- npm install -g typescript typescript-language-server
local on_attach = require'completion'.on_attach
require'lspconfig'.tsserver.setup {
    on_attach = on_attach,
    filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"}
}

