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
    autocmd FileType perl filetype indent on
    autocmd FileType perl set autoindent|set smartindent
    autocmd FileType perl let perl_extended_vars = 1
]])

vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	callback = function() end,
})

--  vim.api.nvim_command([[
--  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
--  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
--  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
--  ]])
-- LSP
-- vim.api.nvim_command([[
--     autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
-- ]])
--
