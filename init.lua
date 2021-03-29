-- /// BASE ///.
require('colorscheme')
require('plugins')
require('settings')
require('aliases')
require('globals')

-- /// REMAPS ///.
require('leader-remaps')

-- /// TREE & EXPLORERS ///.
require('undo-tree')
require('netrw')
require('lightline')
require('tree-keybindings')
-- require('nerd-tree')
-- require('nvim-tree')

-- /// NAVIGATION ///.
require('telescope')
require('telescope-keybindings')
require('dashboard')
require('quick-scope')
require('rnvimr')

-- /// LS & SYNTAX ///.
require('complition-setup')
require('treesitter')
require('lsp')
require('lsp.lua')
require('lsp.rust')
require('lsp.bash')
require('lsp.json')
require('lsp.html')
require('lsp.css')
require('lsp.php')
require('lsp.vimls')
require('lsp.tsserver')
require('lsp-saga')
require('formatting')
require('lsp.formatter')

require('vimg')
require('web-devicons')
require('cheatsh')
require('colorizer-setup')
require('nerd-commenter')
-- require('autopairs') -- (?)
require('lua-autopairs') -- (?)
require('ts-autotags')
require('fugitive')

-- /// TODO: ///.
-- try lualine -> vim.cmd('source ~/.config/nvim/vimscript/lualine.vim')
