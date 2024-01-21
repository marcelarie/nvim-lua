local opts = { noremap = true, silent = true }
-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set(
	"n",
	"k",
	"v:count == 0 ? 'gk' : 'k'",
	{ expr = true, silent = true }
)
vim.keymap.set(
	"n",
	"j",
	"v:count == 0 ? 'gj' : 'j'",
	{ expr = true, silent = true }
)

-- Diagnostic keymaps
vim.keymap.set(
	"n",
	"[d",
	vim.diagnostic.goto_prev,
	{ desc = "Go to previous diagnostic message" }
)
vim.keymap.set(
	"n",
	"]d",
	vim.diagnostic.goto_next,
	{ desc = "Go to next diagnostic message" }
)
vim.keymap.set(
	"n",
	"<leader>e",
	vim.diagnostic.open_float,
	{ desc = "Open floating diagnostic message" }
)
vim.keymap.set(
	"n",
	"<leader>q",
	vim.diagnostic.setloclist,
	{ desc = "Open diagnostics list" }
)

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group =
	vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

vim.api.nvim_set_keymap(
	"n",
	"<Leader>sw",
	[[:%s/\<<C-r><C-w>\>//g<Left><Left>]],
	{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>nn",
	":e ~/clones/pers/notes/notes.md<cr>",
	{ noremap = true, silent = false }
)

vim.api.nvim_set_keymap(
	"n",
	"<Leader>x",
	":normal ddGp<cr>",
	{ noremap = true, silent = false }
)

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
-- vim.keymap.set("n", "<Down>", ":resize -5<cr>", opt_ns)
-- vim.keymap.set("n", "<Up>", ":resize +5<cr>", opt_ns)
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

-- space as leader key
vim.keymap.set("n", "<Space>", "<NOP>", opts)

-- leader w to save
vim.keymap.set("n", "<Leader>w", ":w<cr>", opts)
-- leader W to save
vim.keymap.set("n", "<Leader>W", ":w!<cr>", opts)
-- leader W with no autocmd
vim.keymap.set("n", "<Leader>nw", ":noautocmd w<cr>", opts)
-- leader W to save ON SUDO
vim.keymap.set("c", "w!!", "SudaWrite<cr>", { noremap = false, silent = false })

vim.keymap.set("c", "w!!", "SudaWrite<cr>", { noremap = false, silent = false })

-- leader q to quit
vim.keymap.set("n", "<Leader>q", ":q<cr>", opts)
-- leader Q to quit!
vim.keymap.set("n", "<Leader>Q", function()
	vim.cmd "qa!"
end, opts)
-- leader a to autoread current file
vim.keymap.set("n", "<Leader>e", ":e<cr>", opts)

-- horizontal & vertical split
vim.keymap.set("n", "<Leader>sj", ":split<cr>", opts)
vim.keymap.set("n", "<Leader>sl", ":vsplit<cr>", opts)

vim.keymap.set(
	"n",
	"<Leader>o",
	":luafile %<cr>",
	{ noremap = true, silent = false }
)
vim.keymap.set(
	"n",
	"<Leader>so",
	":luafile ~/.config/nvim/init.lua<cr>",
	{ noremap = true, silent = false }
)

-- switch windows vertically
vim.keymap.set("n", "<Leader>l", ":wincmd L<cr>", opts)
-- switch windows horizontally
vim.keymap.set("n", "<Leader>j", ":wincmd J<cr>", opts)

-- Packer
vim.keymap.set(
	"n",
	"<Leader>pi",
	":PackerInstall<cr>",
	{ noremap = true, silent = false }
)
vim.keymap.set(
	"n",
	"<Leader>pu",
	":PackerUpdate<cr>",
	{ noremap = true, silent = false }
)
vim.keymap.set(
	"n",
	"<Leader>pc",
	":PackerClean<cr>",
	{ noremap = true, silent = false }
)
vim.keymap.set(
	"n",
	"<Leader>ps",
	":PackerSync<cr>",
	{ noremap = true, silent = false }
)

-- lsp
-- vim.keymap.set("n", "<Leader>dd", function()
-- 	vim.diagnostic.config {
-- 		virtual_text = false,
-- 		signs = true,
-- 		underline = false,
-- 	}
-- 	print "LSP warnings disabled."
-- end, { noremap = true, silent = false })

function Disable_lsp_virtual_text()
	print "LSP warnings disabled."
	return {
		virtual_text = false,
		signs = true,
		underline = false,
	}
end

function Enable_lsp_virtual_text()
	print "LSP warnings enabled."
	return {
		virtual_text = true,
		signs = true,
		underline = false,
	}
end

local function lsp_diagnostic_toggle()
	local diagnostic_config
	local virtual_text_is_enabled = vim.diagnostic.config().virtual_text == true
	if virtual_text_is_enabled then
		diagnostic_config = Disable_lsp_virtual_text()
	else
		diagnostic_config = Enable_lsp_virtual_text()
	end
	return diagnostic_config, virtual_text_is_enabled
end

function Lsp_diagnostic_toggle_with_message(force_config)
	force_config = force_config or false
	local diagnostic_config = force_config and force_config
		or lsp_diagnostic_toggle()
	vim.diagnostic.config(diagnostic_config)
end

vim.keymap.set(
	"n",
	"<Leader>di",
	Lsp_diagnostic_toggle_with_message,
	{ noremap = true, silent = false }
)

-- ; for :
vim.keymap.set("n", ";", ":", { noremap = true, silent = false })
vim.keymap.set("n", ":", ";", { noremap = true, silent = false })

-- alpha
vim.keymap.set("n", "<Leader>al", ":Alpha<cr>", { silent = true })

-- quickfix
vim.keymap.set("n", "<Leader>cn", ":cn<cr>")
vim.keymap.set("n", "<Leader>cp", ":cp<cr>")

-- nohighlight
vim.keymap.set("n", "<Leader>nh", ":noh<cr>")

-- rename
vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename)

-- copy relative filename to clipboard
vim.keymap.set("n", "<Leader>yf", ':let @+ = expand("%")<cr>')

-- AI
vim.keymap.set("n", "<Leader>ac", ":AIChat<cr>")
vim.keymap.set("n", "<Leader>ai", ":AI ")
vim.keymap.set("v", "<Leader>ae", ":AIEdit ")
vim.keymap.set("n", "<leader>gc", ":GitCommitMessage<cr>")

-- open file path under cursor vertical split
-- vim.keymap.set('n', '<Leader>gf', ':vertical wincmd f<cr>',
--                         {noremap = true, silent = true})




-- vim.keymap.set('v', '<C-r>',
-- ':hy:%Subvert/<C-r>h//gc<left><left><left>',
-- {noremap = true, silent = false})
-- vim.keymap.set("n", "vv", "V", opt_ns)
-- vim.keymap.set("n", "V", "v$", opt_ns)
-- vim.keymap.set("n", "<Leader>Y", '"+y$l', opt_ns)

-- vim: ts=2 sts=2 sw=2 et
