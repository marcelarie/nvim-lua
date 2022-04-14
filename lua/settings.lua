-- Global options (o)
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.splitright = true -- Vertical splits will automatically be to the right
-- vim.o.timeoutlen = O.timeoutlen
-- vim.o.guifont = "FiraCode Nerd Font:h30"

vim.o.expandtab = true
vim.o.smarttab = true
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.cmdheight = 2 -- More space for displaying messages
vim.o.mouse = "a" -- Mouse support --
vim.o.updatetime = 100 -- Faster completion

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
vim.o.cursorline = true -- Enable highlighting of the current line
vim.wo.signcolumn = "yes"
vim.wo.colorcolumn = "80"

-- highlight on yank
vim.cmd([[
au TextYankPost * silent! lua require("vim.highlight").on_yank({ higroup = 'IncSearch', timeout = 300 })
]])

-- vim.api.nvim_set_option("syntax on")
-- vim.cmd('set path+=**')
vim.api.nvim_set_option("undofile", true)
vim.api.nvim_set_option("undodir", "~/.vim/undodir")
vim.cmd("set laststatus=3")
vim.cmd("set undofile")
vim.cmd("set undodir=~/.vim/undodir")
vim.cmd("set undolevels=1000")
vim.cmd("set undoreload=10000")
vim.cmd("set noswapfile")
vim.cmd("set nohlsearch")
vim.cmd("set list listchars=tab:⤑\\ ,trail:∙,eol:↲")

-- vim.api.nvim_set_option('spelllang', 'en')
vim.api.nvim_set_option("showcmd", false)
vim.api.nvim_set_option("hlsearch", false)
vim.api.nvim_set_option("incsearch", true)
vim.api.nvim_set_option("compatible", false)
vim.api.nvim_set_option("errorbells", false)
vim.api.nvim_set_option("swapfile", false)
vim.api.nvim_set_option("backup", false)
-- vim.cmd('set backupdir=~/.vim/backup') -- vim.api.nvim_set_option('backupdir', "~/.vim/backup")
-- vim.api.nvim_set_option('writebackup', true)
-- vim.api.nvim_set_option('backupcopy', 'yes')
