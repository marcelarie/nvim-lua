-- nix-env -i -f https://github.com/nix-community/rnix-lsp/archive/master.tar.gz
require("lspconfig").rnix.setup({})

vim.cmd([[
    augroup LspFormatting
        autocmd BufWritePre *.nix lua vim.lsp.buf.formatting_sync(nil, 2000)
    augroup END
]])
