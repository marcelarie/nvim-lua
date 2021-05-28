vim.api.nvim_command([[
     augroup Fugitive
     autocmd FileType fugitive nnoremap <Leader>c :Git commit<cr>
     augroup END
]])

-- vim.api.nvim_command([[
--     autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
-- ]])

