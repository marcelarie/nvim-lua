local saga = require 'lspsaga'

saga.init_lsp_saga {rename_prompt_prefix = '➤'}

-- // KEYBINDINGS //.
vim.api.nvim_set_keymap('n', '<Leader>rn',
                        "<cmd>lua require('lspsaga.rename').rename()<CR>",
                        {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<Leader>a',
                        "<cmd>lua require('lspsaga.codeaction').code_action()<CR>",
                        {noremap = true, silent = true})

-- vim.api.nvim_set_keymap('n', '[',
                        -- "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<cr>",
                        -- {noremap = true, silent = true})

-- vim.api.nvim_set_keymap('n', ']',
                        -- "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<cr>",
                        -- {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<Leader>gf',
                        "<cmd>lua require('lspsaga.provider').lsp_finder()<CR>",
                        {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<Leader>d',
                        "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>",
                        {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<Leader>sh',
                        "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>",
                        {noremap = true, silent = true})

-- vim.api.nvim_set_keymap('n', '<Leader>d',
--                         "<cmd>lua require('lspsaga.provider').preview_definition()<CR>",
--                         {noremap = true, silent = true})

-- vim.api.nvim_set_keymap('n', '<Leader>x',
--                         "<cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>",
--                         {noremap = true, silent = true})

