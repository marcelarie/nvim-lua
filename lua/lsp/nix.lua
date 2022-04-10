-- nix-env -i -f https://github.com/nix-community/rnix-lsp/archive/master.tar.gz
require("lspconfig").rnix.setup({})

vim.cmd([[autocmd BufWritePre *.nix lua vim.lsp.buf.formatting_sync() ]])
