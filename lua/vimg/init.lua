-- "VimG Google:"
vim.cmd([[
let g:vim_g_command = "Go"
let g:vim_g_f_command = "Gf"
]])


vim.api.nvim_set_keymap('n', '<Leader>go', ':Go<cr>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Leader>gf', ':Gf<cr>', { noremap = true, silent = true })

