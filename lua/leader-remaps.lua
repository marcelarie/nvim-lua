-- -- space as leader key
vim.g.mapleader = " "
vim.keymap.set("n", "<Space>", "<NOP>", { noremap = true, silent = true })

-- leader w to save
vim.keymap.set("n", "<Leader>w", ":w<cr>", { noremap = true, silent = true })
-- leader W to save
vim.keymap.set("n", "<Leader>W", ":w!<cr>", { noremap = true, silent = true })
-- leader W with no autocmd
vim.keymap.set(
	"n",
	"<Leader>nw",
	":noautocmd w<cr>",
	{ noremap = true, silent = true }
)
-- leader W to save ON SUDO
vim.keymap.set("c", "w!!", "SudaWrite<cr>", { noremap = false, silent = false })

-- leader q to quit
vim.keymap.set("n", "<Leader>q", ":q<cr>", { noremap = true, silent = true })
-- leader Q to quit!
vim.keymap.set("n", "<Leader>Q", ":qa!<cr>", { noremap = true, silent = true })
-- leader a to autoread current file
vim.keymap.set("n", "<Leader>e", ":e<cr>", { noremap = true, silent = true })

-- horizontal split
vim.keymap.set(
	"n",
	"<Leader>sj",
	":split<cr>",
	{ noremap = true, silent = true }
)

-- vertical split
vim.keymap.set(
	"n",
	"<Leader>sl",
	":vsplit<cr>",
	{ noremap = true, silent = true }
)

vim.keymap.set(
	"n",
	"<Leader>o",
	":luafile %<cr>",
	{ noremap = true, silent = false }
)
vim.keymap.set(
	"n",
	"<Leader>so",
	":luafile ~/.config/nvim/nix.init.lua<cr>",
	{ noremap = true, silent = false }
)

-- switch windows vertically
vim.keymap.set(
	"n",
	"<Leader>l",
	":wincmd L<cr>",
	{ noremap = true, silent = true }
)
-- switch windows horizontally
vim.keymap.set(
	"n",
	"<Leader>j",
	":wincmd J<cr>",
	{ noremap = true, silent = true }
)

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

-- open file path under cursor vertical split
-- vim.keymap.set('n', '<Leader>gf', ':vertical wincmd f<cr>',
--                         {noremap = true, silent = true})
