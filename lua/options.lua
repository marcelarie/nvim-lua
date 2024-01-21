-- [[ Setting options ]]
-- See `:help vim.o`
-- Global options (o)
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.splitright = true -- Vertical splits will automatically be to the right
-- vim.o.timeoutlen = O
-- vim.o.guifont = "FiraCode Nerd Font:h15"
vim.opt.guicursor = "i-v:hor20-Cursor/lCursor" -- Add unerline cursor on Insert and Visual mode

vim.o.expandtab = true
vim.o.smarttab = true
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.cmdheight = 1
vim.o.mouse = "a" -- Mouse support --
vim.o.updatetime = 100 -- Faster completion
vim.o.cursorline = true -- Enable highlighting of the current line

vim.o.hidden = true -- Opening a new file when the current buffer has unsaved changes cause files to be hidden instead of closed.

vim.o.smartcase = true -- Case sensitive search.
vim.o.scrolloff = 8 -- 8 lines on top/bottom of cursor when scrolling.
vim.o.timeoutlen = 500 -- Vim will wait for 500 ms after keystroke for the mappings.
vim.o.updatetime = 300 -- Vim waits 300 ms after you stop before it triggers the plugin.

-- Buffer local options (bo?)

-- Window-local options (wo)
vim.wo.wrap = false -- Display long lines as just one line
-- vim.wo.relativenumber = true -- Relative numbers
vim.wo.nu = true -- Show line number
vim.wo.foldnestmax = 1
vim.wo.cursorline = true -- Enable highlighting of the current line
vim.wo.signcolumn = "yes"
vim.wo.colorcolumn = "80"

-- vim.api.nvim_set_option("syntax on")
-- vim.cmd('set path+=**')
vim.opt.laststatus = 3
vim.cmd "set undolevels=10000"
vim.cmd "set undoreload=10000"
-- vim.cmd "set nohlsearch"
vim.opt.listchars = {
	tab = "∙ ",
	trail = "∙",
	eol = "↲",
	extends = "❯",
}
vim.opt.list = true

-- undo
vim.opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- vim.api.nvim_set_option('spelllang', 'en')
vim.api.nvim_set_option("showcmd", false)
-- vim.api.nvim_set_option("hlsearch", false)
vim.api.nvim_set_option("incsearch", true)
vim.api.nvim_set_option("compatible", false)
vim.api.nvim_set_option("errorbells", false)
-- vim.cmd('set backupdir=~/.vim/backup') -- vim.api.nvim_set_option('backupdir', "~/.vim/backup")
-- vim.api.nvim_set_option('writebackup', true)
-- vim.api.nvim_set_option('backupcopy', 'yes')

vim.diagnostic.config {
	-- virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = false,
	-- virtual_text = {
	-- 	source = "if_many", -- Or "if_many"
	-- },
	virtual_lines = false,
	virtual_text = {
		prefix = "●", -- Could be '●', '▎', 'x'
	},
	float = {
		source = "always", -- Or "if_many"
	},
}

-- local border = {
-- 	{ "🭽", "FloatBorder" },
-- 	{ "▔", "FloatBorder" },
-- 	{ "🭾", "FloatBorder" },
-- 	{ "▕", "FloatBorder" },
-- 	{ "🭿", "FloatBorder" },
-- 	{ "▁", "FloatBorder" },
-- 	{ "🭼", "FloatBorder" },
-- 	{ "▏", "FloatBorder" },
-- }

vim.cmd [[
	autocmd BufEnter * lua vim.diagnostic.hide(nil,0)
]]

-- vim.cmd [[autocmd ColorScheme * highlight NormalFloat guibg=#000]]
-- vim.cmd [[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#f29]]

-- Change border of documentation hover window, See https://github.com/neovim/neovim/pull/13998.
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	-- border = border, -- single, rounded. double
	border = "rounded", -- single, rounded. double
})

-- vim.lsp.handlers["textDocument/signatureHelp"] =
-- 	vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })

local signs = { Error = "e ", Warn = "w ", Hint = "h ", Info = "i " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- vim: ts=2 sts=2 sw=2 et
