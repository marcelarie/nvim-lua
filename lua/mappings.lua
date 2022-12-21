local opt_ns = { noremap = true, silent = true }

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

vim.keymap.set("n", "<Right>", ":vertical resize -5<cr>", opt_ns)
vim.keymap.set("n", "<Left>", ":vertical resize +5<cr>", opt_ns)
vim.keymap.set("n", "<Down>", ":resize -5<cr>", opt_ns)
vim.keymap.set("n", "<Up>", ":resize +5<cr>", opt_ns)
vim.keymap.set("n", "Y", "y$", opt_ns)

-- christoomey/vim-system-copy
vim.keymap.set("n", "cpp", "Vcp", { noremap = false, silent = true })
vim.keymap.set("n", "cP", "cp$", { noremap = false, silent = true })

vim.keymap.set("n", "n", "nzzzv", opt_ns)
vim.keymap.set("n", "N", "Nzzzv", opt_ns)
vim.keymap.set("n", "J", "mzJ`z", opt_ns)

-- redo
vim.keymap.set("n", "U", "<C-R>", opt_ns)

vim.keymap.set(
	"n",
	"<expr> k",
	[[ (v:count > 5 ? "m'" . v:count : "") . 'k' ]],
	opt_ns
)
vim.keymap.set(
	"n",
	"<expr> j",
	[[ (v:count > 5 ? "m'" . v:count : "") . 'j' ]],
	opt_ns
)

-- search and replace
vim.keymap.set("n", "cn", "*``cgn", opt_ns)
-- LuaFormatter off
vim.keymap.set("n", "cN", "*``cgN", opt_ns)
-- better tabbing
vim.keymap.set("v", "<", "<gv", opt_ns)
vim.keymap.set("v", ">", ">gv", opt_ns)
vim.keymap.set("n", "^v", "^v<Esc>", opt_ns)

-- quick cd to buffer file
vim.keymap.set("n", "<leader>cd", ":cd %:p:h<cr>:pwd<cr>", opt_ns)
-- complextras
vim.keymap.set(
	"i",
	"<c-x>",
	":lua require('complextras').complete_line_from_cwd()",
	opt_ns
)

vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]
)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- vim.keymap.set('v', '<C-r>',
-- ':hy:%Subvert/<C-r>h//gc<left><left><left>',
-- {noremap = true, silent = false})
-- vim.keymap.set("n", "vv", "V", opt_ns)
-- vim.keymap.set("n", "V", "v$", opt_ns)
-- vim.keymap.set("n", "<Leader>Y", '"+y$l', opt_ns)
