-- Fugitive
vim.api.nvim_command([[
     augroup Fugitive
     autocmd FileType fugitive nnoremap <Leader>c :Git commit<cr>
     autocmd FileType fugitive nnoremap <Leader>p :Git push<cr>
     augroup END
]])
-- Perl
vim.api.nvim_command([[
    autocmd FileType perl filetype indent on
]])

-- LSP
-- vim.api.nvim_command([[
--     autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
-- ]])
