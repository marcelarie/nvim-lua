lua require("telescope")

nnoremap <leader>rg :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
" nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>rf :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>r :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>rh :lua require('telescope.builtin').help_tags()<CR>


