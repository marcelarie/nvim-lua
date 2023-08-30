local opts = { noremap = true, silent = true }

-- space as leader key
vim.g.mapleader = " "
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
vim.keymap.set("n", "<Leader>Q", ":qa!<cr>", opts)
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

-- GitBlame
vim.keymap.set(
	"n",
	"<Leader>gt",
	":GitBlameToggle<cr>",
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
