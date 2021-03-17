print('nvim-tree')


-- vim.api.nvim_set_keymap('n', '<Leader>e', [[:NvimTreeToggle<cr>]], { noremap = true, silent = true })

vim.cmd([[
let g:nvim_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
    ]])
