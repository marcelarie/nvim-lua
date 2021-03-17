-- Open directly
vim.cmd('let g:netrw_browse_split = 0')
-- No banner
vim.cmd('let g:netrw_banner = 0')
-- Winsize 
vim.cmd('let g:netrw_winsize = 25')
-- Open folders right there
vim.cmd('let g:netrw_liststyle = 3')

vim.cmd("let g:netrw_localrmdir='rm -r'")

vim.api.nvim_set_keymap('n', '<Leader>e', ':Lexplore<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ee', ':Ex<cr>', { noremap = true, silent = true })
