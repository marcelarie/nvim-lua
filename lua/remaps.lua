vim.api.nvim_set_keymap('n', '<Right>', ':vertical resize -5<cr>',
                        {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<Left>', ':vertical resize +5<cr>',
                        {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<Up>', ':resize +5<cr>',
                        {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<Down>', ':resize -5<cr>',
                        {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<Leader>so',
                        ':luafile ~/.config/nvim/init.lua<cr>',
                        {noremap = true, silent = false})
