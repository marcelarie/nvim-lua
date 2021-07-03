require("harpoon").setup({
    global_settings = {save_on_toggle = false, save_on_change = true}
    -- ... your other configs ...
})

-- vim.cmd("tnoremap <Esc> <C-\\><C-n>")

vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Space>x',
                        ':lua require("harpoon.term").gotoTerminal(1) <cr>',
                        {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<Space>hf',
                        ':lua require("harpoon.mark").add_file() <cr>',
                        {noremap = true, silent = false})

vim.api.nvim_set_keymap('n', '<Space>hq',
                        ':lua require("harpoon.ui").toggle_quick_menu() <cr>',
                        {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<Space>hn',
                        ':lua require("harpoon.ui").nav_file()',
                        {noremap = true, silent = false})
