-- space as leader key
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' '

-- leader w to save
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<cr>', { noremap = true, silent = true })
-- leader W to save
vim.api.nvim_set_keymap('n', '<Leader>w!', ':w!<cr>', { noremap = true, silent = true })
-- leader q to quit
vim.api.nvim_set_keymap('n', '<Leader>q', ':q<cr>', { noremap = true, silent = true })
-- leader Q to quit!
vim.api.nvim_set_keymap('n', '<Leader>Q', ':q!<cr>', { noremap = true, silent = true })
-- leader a to autoread current file
vim.api.nvim_set_keymap('n', '<Leader>a', ':e<cr>', { noremap = true, silent = true })

-- horizontal split
vim.api.nvim_set_keymap('n', '<Leader>s', ':split<cr>', { noremap = true, silent = true })
-- vertical split
vim.api.nvim_set_keymap('n', '<Leader>ss', ':vsplit<cr>', { noremap = true, silent = true })

-- change left window
vim.api.nvim_set_keymap('n', '<Leader>h', ':wincmd h<cr>', { noremap = true, silent = true })
-- change right window
vim.api.nvim_set_keymap('n', '<Leader>l', ':wincmd l<cr>', { noremap = true, silent = true })
-- change bottom window
vim.api.nvim_set_keymap('n', '<Leader>j', ':wincmd j<cr>', { noremap = true, silent = true })
-- change top window
vim.api.nvim_set_keymap('n', '<Leader>k', ':wincmd k<cr>', { noremap = true, silent = true })


