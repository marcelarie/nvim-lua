-- /// BASE ///.
require('colorscheme') -- ./lua/colorscheme.lua
require('plugins') -- ./lua/plugins.lua
require('settings') -- ./lua/settings.lua
require('aliases') -- ./lua/aliases.lua
-- require('globals') -- ./lua/globals.lua

 
 -- /// REMAPS ///.
 require('leader-remaps') -- ./lua/remaps.lua
 require('remaps') -- ./lua/remaps.lua
 -- require('ts-utils-remaps') -- ./lua/ts-utils-remaps.lua
 
 -- /// TREE & EXPLORERS ///.
 require('undo-tree') -- ./lua/undo-tree/init.lua
 require('netrw') -- ./lua/netrw
 require('lualine-config') -- ./lua/lualine-config
 require('tree-keybindings') -- ./lua/tree-keybindings/init.lua
 
 -- /// NAVIGATION ///.
 require('telescope') -- ./lua/nv-telescope/init.lua
 require('telescope-keybindings') -- ./lua/telescope-keybindings.lua
 require('dashboard') -- ./lua/dashboard/init.lua
 require('quick-scope') -- ./lua/quick-scope/init.lua
 -- require('surround-lua') -- ./lua/surround-lua/init.lua
 
 -- /// LS & SYNTAX ///.
 -- require('complition-setup') --./lua/complition-setup/init.lua
 require('compe-setup') -- ./lua/compe-setup/init.lua
 require('treesitter') -- ./lua/treesitter/init.lua
 require('lsp') -- ./lua/lsp/
 require('lsp.lua') -- ./lua/lsp/lua.lua
 require('lsp.rust') -- ./lua/lsp/rust.lua
 require('lsp.bash') -- ./lua/lsp/bash.lua
 require('lsp.json') -- ./lua/lsp/json.lua
 require('lsp.html') -- ./lua/lsp/html.lua
 require('lsp.css') -- ./lua/lsp/css.lua
 require('lsp.php') -- ./lua/lsp/php.lua
 require('lsp.vimls') -- ./lua/lsp/vimls.lua
 require('lsp.tsserver') -- ./lua/lsp/tsserver.lua
 require('lsp-saga') -- ./lua/lsp-saga/init.lua
 require('formatting') -- ./lua/formatting.lua
 require('lsp.formatter') -- ./lua/lsp/formatter.lua
 require('lsp-trouble') -- ./lua/lsp-trouble/init.lua
 require('symbols-outline') -- ./lua/symbols/init.lua
 
 -- /// OTHERS ///.
 require('vimg') -- ./lua/vimg/init.lua
 require('web-devicons') -- ./lua/web-devicons/init.lua
 require('cheatsh') -- ./lua/cheatsh/init.lua
 require('colorizer-setup') -- ./lua/colorizer-setup/init.lua
 require('nvim-commenter') -- ./lua/nvim-commenter/init.lua
 require('lua-autopairs') -- (?) --./lua/lua-autopairs/init.lua
 require('ts-autotags') -- ./lua/ts-autotags/init.lua
 require('fugitive') -- ./lua/fugitive/init.lua
 require('markdown-preview')
 require('neo-scroll') -- ./lua/neo-scroll/init.lua
 require('g-worktree') -- ./lua/g-worktree/init.lua
 require('fterm') -- ./lua/fterm/init.lua
 require('git-sings') -- ./lua/git-sings/init.lua
 require('spell-sitter') -- ./lua/spell-sitter/init.lua
 require('autosession') -- ./lua/autosession/init.lua
 -- require('neuron') -- ./lua/neuron/init.lua
 -- require('shade-windows') -- ./lua/shade-windows/init.lua
 -- require('autopairs') -- (?) --./lua/autopairs/init.lua
 -- require('nerd-commenter') --./lua/nerd-commenter/init.lua
 
 -- /// TODO: ///.
 --
