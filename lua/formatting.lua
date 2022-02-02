-- vim.cmd([[autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)]]);
-- vim.cmd([[autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)]]);
-- vim.cmd([[autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)]]);
-- vim.cmd([[autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 100)]]);
-- vim.cmd([[autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 100)]]);

vim.cmd([[autocmd BufWritePre *.lua silent! Neoformat]])

-- JavaScript
-- vim.cmd([[autocmd BufWritePre *.js silent! Neoformat]])
vim.cmd([[autocmd BufWritePre *.jsx silent! Neoformat]])
vim.cmd([[autocmd BufWritePre *.ts silent! Neoformat]])
vim.cmd([[autocmd BufWritePre *.tsx silent! Neoformat]])
vim.cmd([[autocmd BufWritePre *.json silent! Neoformat]])

vim.cmd([[autocmd BufWritePre *.html silent! Neoformat]])
vim.cmd([[autocmd BufWritePre *.css silent! Neoformat]])
vim.cmd([[autocmd BufWritePre *.scss silent! Neoformat]])
vim.cmd([[autocmd BufWritePre *.sass silent! Neoformat]])

vim.cmd([[autocmd BufWritePre *.yaml silent! Neoformat]])
-- vim.cmd([[autocmd BufWritePre *.md silent! Neoformat]])
vim.cmd([[autocmd BufWritePre *.rs silent! Neoformat]])
vim.cmd([[autocmd BufWritePre *.tex silent! Neoformat]])

vim.cmd([[autocmd BufWritePre *.sh silent! Neoformat]])
vim.cmd([[autocmd BufWritePre *.fish silent! Neoformat]])
-- Perl
-- vim.cmd([[autocmd BufWritePre *.pl silent! ]])
-- vim.cmd([[autocmd BufWritePre *.pm silent! ]])
--
--'
vim.api.nvim_set_keymap("v", "ff", ":'<,'>Neoformat<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>nw", ":Neoformat<cr>:w<cr>", { noremap = true, silent = false })
