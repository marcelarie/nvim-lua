-- npm install -g typescript typescript-language-server
require'lspconfig'.tsserver.setup {
    on_attach = On_attach,
    filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"}
}

