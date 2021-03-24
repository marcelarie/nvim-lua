local saga = require 'lspsaga'

saga.init_lsp_saga()

vim.api.nvim_set_keymap('n', '<Leader>rn',
                        "<cmd>lua require('lspsaga.rename').rename()<CR>",
                        {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<Leader>a',
                        "<cmd>lua require('lspsaga.codeaction').code_action()<CR>",
                        {noremap = true, silent = true})
