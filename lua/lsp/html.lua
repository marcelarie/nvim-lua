-- npm install -g vscode-html-languageserver-bin

require'lspconfig'.html.setup {
    capabilities = capabilities,
    on_attach = On_attach
}
