-- npm install -g typescript typescript-language-server
require'lspconfig'.tsserver.setup {
    on_attach = On_attach,
    -- on_attach = require'lsp'.common_on_attach,
    filetypes = {
        "javascript", "javascriptreact", "javascript.jsx", "typescript",
        "typescriptreact", "typescript.tsx"
    }
    -- settings = {documentFormatting = false}
}

