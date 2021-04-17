-- vim.cmd([[autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)]]);
-- vim.cmd([[autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)]]);
-- vim.cmd([[autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)]]);
-- vim.cmd([[autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 100)]]);
-- vim.cmd([[autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 100)]]);
--
vim.cmd([[autocmd BufWritePost *.lua silent! Neoformat]]);
vim.cmd([[autocmd BufWritePost *.js silent! Neoformat]]);
vim.cmd([[autocmd BufWritePost *.jsx silent! Neoformat]]);
vim.cmd([[autocmd BufWritePost *.ts silent! Neoformat]]);
vim.cmd([[autocmd BufWritePost *.tsx silent! Neoformat]]);
vim.cmd([[autocmd BufWritePost *.json silent! Neoformat]]);
vim.cmd([[autocmd BufWritePost *.html silent! Neoformat]]);
vim.cmd([[autocmd BufWritePost *.css silent! Neoformat]]);
vim.cmd([[autocmd BufWritePost *.scss silent! Neoformat]]);
vim.cmd([[autocmd BufWritePost *.sass silent! Neoformat]]);
vim.cmd([[autocmd BufWritePost *.yaml silent! Neoformat]]);
vim.cmd([[autocmd BufWritePost *.md silent! Neoformat]]);
