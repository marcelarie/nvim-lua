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
