-- /// BASE ///
require('colorscheme')
require('plugins')
require('settings')
require('aliases')

-- /// REMAPS ///.
require('leader-remaps')

-- /// TREE EXPLORERS ///.
require('undo-tree')
require('netrw')
require('nerd-tree')

-- /// NAVIGATION ///.
require('telescope')
require('telescope-keybindings')

-- /// LS & SYNTAX ///.
require('treesitter')
require('lsp')
require('lsp.tsserver')
require('lsp.lua')
require('lsp.lua-formatter')
require('lsp.json')
require('lsp.html')
require('lsp.css')
require('lsp.php')
require('lsp.vimls')
require('formatting')

require('vimg')
require('web-devicons')
require('cheatsh')
require('colorizer')
require('nerd-commenter')
require('autopairs')

-- /// TODO ///.
-- vim.cmd('source ~/.config/nvim/vimscript/lualine.vim')
-- vim.cmd([[augroup highlight_yank autocmd!  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40}) augroup END]]);
-- require('lspsaga')
-- require('nvim-tree')
-- require('lightline')
-- require('galaxyline')

