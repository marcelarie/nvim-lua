vim.api.nvim_set_keymap("n", "<Leader>sw", [[:%s/\<<C-r><C-w>\>//g<Left><Left>]], { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>nn", ":e ~/clones/pers/notes/notes.md<cr>", { noremap = true, silent = false })
