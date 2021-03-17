require('colorscheme')
require('plugins')
require('leader-remaps')
require('settings')
require('aliases')
require('netrw')
require('colorizer')
require('nerd-commenter')
require('autopairs')
require('undo-tree')
require('vimg')
require('web-devicons')

require('treesitter')

require('cheatsh')

require('telescope')
require('telescope-keybindings')

require('lsp')
require('lsp.tsserver')
require('lsp.lua')
require('lsp.lua-formatter')
require('lsp.json')
require('lsp.html')
require('lsp.css')
require('lsp.php')

require('formatting')
-- require('lspsaga')
--
-- require('nvim-tree')
-- require('lightline')
-- require('galaxyline')

-- vim.cmd('source ~/.config/nvim/vimscript/lualine.vim')
-- vim.cmd([[augroup highlight_yank autocmd!  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40}) augroup END]]);

