vim.cmd([[autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)]]);
vim.cmd([[autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)]]);
vim.cmd([[autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)]]);
vim.cmd([[autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 100)]]);
vim.cmd([[autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 100)]]);
