-- /// BASE ///
require('colorscheme')
require('plugins')
require('settings')
require('aliases')
-- /// REMAPS ///.
require('leader-remaps')

-- /// TREE & EXPLORERS ///.
require('undo-tree')
require('netrw')
require('lightline')
-- require('nvim-tree')
require('tree-keybindings')
-- require('nerd-tree')

-- /// NAVIGATION ///.
require('telescope')
require('telescope-keybindings')

-- /// LS & SYNTAX ///.
require('treesitter')
require('lsp')
require('lsp.tsserver')
require('lsp.lua')
require('lsp.lua-formatter')
require('lsp.rust')
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

-- /// TODO: ///.
-- try lualine -> vim.cmd('source ~/.config/nvim/vimscript/lualine.vim')
