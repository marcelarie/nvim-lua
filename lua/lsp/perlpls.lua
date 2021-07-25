require'lspconfig'.perlpls.setup({
    cmd = {"pls"},
    filetypes = {"perl"},
    settings = {perl = {perlcritic = {enabled = false}}}
})
