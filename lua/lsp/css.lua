-- npm install -g vscode-css-languageserver-bin
require'lspconfig'.cssls.setup {
    on_attach = On_attach
    -- filetypes = {
    --     "css", "scss", "less", "javascriptreact", "javascript", "typescript",
    --     "typescriptreact"
    -- }
}
