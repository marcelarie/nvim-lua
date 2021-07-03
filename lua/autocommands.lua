vim.api.nvim_command([[
     augroup Fugitive
     autocmd FileType fugitive nnoremap <Leader>c :Git commit<cr>
     autocmd FileType fugitive nnoremap <Leader>p :Git push<cr>
     augroup END
]])

-- vim.api.nvim_command([[
--     autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
-- ]])

vim.api.nvim_command([[
    autocmd FileType perl filetype indent on
]])


