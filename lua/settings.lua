-- Still on research (?)
vim.cmd('set spelllang=en,es')
vim.cmd('set undofile')
vim.cmd('set undodir=~/.vim/undodir')
vim.cmd('set backup')
vim.cmd('set backupdir=~/.vim/backup')
vim.cmd('set writebackup')
vim.cmd('set backupcopy=yes')
vim.cmd('set noshowcmd')
vim.cmd('set nohlsearch')
vim.cmd('set incsearch')
vim.cmd('set nocompatible')
vim.cmd('set noerrorbells')
vim.cmd('set noswapfile')

-- Global options
vim.o.splitbelow=true  -- Horizontal splits will automatically be below
vim.o.splitright=true  -- Vertical splits will automatically be to the right

vim.o.expandtab=true
vim.o.smarttab=true
vim.o.smartindent=true
vim.o.tabstop=4 
vim.o.softtabstop=4
vim.o.shiftwidth=4

vim.o.hidden=true -- Opening a new file when the current buffer has unsaved changes 
                  -- cause files to be hidden instead of closed.  

vim.o.smartcase=true -- Case sensitive search.
vim.o.scrolloff=8 -- 8 lines on top/bottom of cursor when scrolling.
vim.o.timeoutlen=500 -- Vim will wait for 500 ms after keystroke for the mappings.
vim.o.updatetime=300 -- Vim waits 300 ms after you stop before it triggers the plugin.   



-- Buffer local options

-- Window-local options
vim.wo.wrap=false -- Display long lines as just one line
vim.wo.relativenumber=true -- Relative numbers
vim.wo.nu =true -- Show line number
vim.wo.foldnestmax=1 
vim.wo.cursorline=true                          --Enable highlighting of the current line
vim.wo.signcolumn="yes"




