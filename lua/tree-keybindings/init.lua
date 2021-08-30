vim.api.nvim_set_keymap(
	"n",
	"<Leader><Tab>",
	":NvimTreeToggle<cr> | :normal 0<cr>",
	{ noremap = true, silent = true }
)
-- vim.api.nvim_set_keymap("n", "<Leader>ma", ":set ma<cr>", { noremap = true, silent = true })

-- config
-- vim.cmd('let g:nvim_tree_auto_open = 1')
-- vim.cmd('let g:nvim_tree_quit_on_open = 1')
-- vim.cmd("let g:nvim_tree_hijack_netrw = 0")
vim.cmd("let g:nvim_tree_width = 40")
--  vim.cmd("let g:nvim_tree_side = 'right'")
vim.cmd("let g:nvim_tree_follow_update_path = 1")
-- vim.cmd("let g:nvim_tree_git_hl = 1")
vim.cmd("let g:nvim_tree_highlight_opened_files = 1")
--  vim.cmd("let g:nvim_tree_hijack_netrw = 0")
vim.cmd("let g:nvim_tree_lsp_diagnostics = 1")
vim.cmd("let g:nvim_tree_respect_buf_cwd = 1")
