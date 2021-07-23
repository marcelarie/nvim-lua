vim.api.nvim_set_keymap('n', '<Leader>sr',
                        [[:%s/\<<C-r><C-w>\>//g<Left><Left>]],
                        {noremap = true, silent = false})
