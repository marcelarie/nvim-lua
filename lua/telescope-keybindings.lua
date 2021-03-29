vim.api.nvim_set_keymap('n', '<Leader>f',
                        [[<Cmd> lua require('telescope.builtin').find_files()<cr>]],
                        {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<Leader>rg',
                        [[<Cmd> lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<cr>]],
                        {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<Leader>r',
                        [[<Cmd> lua require('telescope.builtin').live_grep()<cr>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>rh',
                        [[<Cmd> lua require('telescope.builtin').help_tags()<cr>]],
                        {noremap = true, silent = true})

-- Add these when I learn how to use theme similar to Fugitive
-- vim.api.nvim_set_keymap('n', '<Leader>g', [[<Cmd> lua require('telescope.builtin').git_status()<cr>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>gb',
                        [[<Cmd> lua require('telescope.builtin').git_branches()<cr>]],
                        {noremap = true, silent = true})
