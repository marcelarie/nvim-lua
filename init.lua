-- /// BASE ///.
require('colorscheme')
require('plugins')
require('settings')
require('aliases')
require('globals')

-- /// REMAPS ///.
require('leader-remaps')
require('remaps')

-- /// TREE & EXPLORERS ///.
require('undo-tree')
require('netrw')
require('lualine-config')
require('tree-keybindings')
-- require('nvim-tree')
-- require('lightline')

-- /// NAVIGATION ///.
require('telescope')
require('telescope-keybindings')
require('dashboard')
require('quick-scope')
require('rnvimr')

-- /// LS & SYNTAX ///.
-- require('complition-setup')
require('compe-setup')
require('treesitter')
require('lsp')
require('lsp.tsserver')
require('lsp.lua')
require('lsp.formatter')
require('lsp.rust')
require('lsp.json')
require('lsp.html')
require('lsp.css')
require('lsp.php')
require('lsp.vimls')
require('formatting')
require('lsp-saga')

require('vimg')
require('web-devicons')
require('cheatsh')
require('colorizer')
require('nerd-commenter')
-- require('autopairs') -- (?)
require('lua-autopairs') -- (?)
require('ts-autotags')
require('fugitive')

-- /// TODO: ///.
-- try lualine -> vim.cmd('source ~/.config/nvim/vimscript/lualine.vim')
