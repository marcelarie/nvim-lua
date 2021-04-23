vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>oi", ":TSLspOrganize<CR>",
                            {silent = true})
vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>fx", ":TSLspFixCurrent<CR>",
                            {silent = true})
vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>rf", ":TSLspRenameFile<CR>",
                            {silent = true})
vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>ia", ":TSLspImportAll<CR>",
                            {silent = true})
