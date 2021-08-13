vim.api.nvim_set_keymap("n", "<Right>", ":vertical resize -5<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<Left>", ":vertical resize +5<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<Up>", ":resize +5<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<Down>", ":resize -5<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "J", "mzJ`z", { noremap = true, silent = true })

vim.api.nvim_set_keymap(
	"n",
	"<expr> k",
	[[ (v:count > 5 ? "m'" . v:count : "") . 'k' ]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<expr> j",
	[[ (v:count > 5 ? "m'" . v:count : "") . 'j' ]],
	{ noremap = true, silent = true }
)

-- vim.api.nvim_set_keymap('v', '<C-r>',
-- ':hy:%Subvert/<C-r>h//gc<left><left><left>',
-- {noremap = true, silent = false})

-- search and replace
vim.api.nvim_set_keymap("n", "cn", "*``cgn", { noremap = true, silent = true })

-- LuaFormatter off
vim.api.nvim_set_keymap("n", "cN", "*``cgN", { noremap = true, silent = true })

-- better tabbing
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "^v", "^v<Esc>", { noremap = true, silent = true })
