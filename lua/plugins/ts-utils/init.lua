local opts = { silent = true }
vim.keymap.set("n", "gs", ":TSLspOrganize<CR>", opts)
vim.keymap.set("n", "gr", ":TSLspRenameFile<CR>", opts)
vim.keymap.set("n", "ga", ":TSLspImportAll<CR>", opts)
vim.keymap.set("n", "gi", ":TSLspImportCurrent<CR>", opts)
vim.keymap.set("n", "gh", ":TSLspToggleInlayHints<CR>", opts)
