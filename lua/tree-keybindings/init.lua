vim.api.nvim_set_keymap('n', '<Leader><Tab>', ':NvimTreeToggle<cr>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>ma', ':set ma<cr>',
                        {noremap = true, silent = true})

-- config
-- vim.cmd('let g:nvim_tree_auto_open = 1')
-- vim.cmd('let g:nvim_tree_quit_on_open = 1')
vim.cmd('let g:nvim_tree_hijack_netrw = 0')
