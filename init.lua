-- /// BASE ///.
require("colorscheme") -- ./lua/colorscheme.lua
require("plugins") -- ./lua/plugins.lua
require("settings") -- ./lua/settings.lua
require("aliases") -- ./lua/aliases.lua
require("globals") -- ./lua/globals.lua
require("autocommands") -- ./lua/autocommands.lua

-- /// REMAPS ///.
require("leader-remaps") -- ./lua/remaps.lua
require("remaps") -- ./lua/remaps.lua
-- require('ts-utils-remaps') -- ./lua/ts-utils-remaps.lua

-- /// TREE & EXPLORERS ///.
require("undo-tree") -- ./lua/undo-tree/init.lua
require("netrw") -- ./lua/netrw
require("feline-status") -- ./lua/feline-status/init.lua
require("tree-keybindings") -- ./lua/tree-keybindings/init.lua
require("vim-keybindings") -- ./lua/vim-keybindings/init.lua
-- require('lualine-config') -- ./lua/lualine-config

-- /// NAVIGATION ///.
require("nv-telescope") -- ./lua/nv-telescope/init.lua
require("telescope-keybindings") -- ./lua/telescope-keybindings.lua
require("dashboard") -- ./lua/dashboard/init.lua
require("quick-scope") -- ./lua/quick-scope/init.lua
-- require('surround-lua') -- ./lua/surround-lua/init.lua

-- /// LS & SYNTAX ///.
require("compe-setup") -- ./lua/compe-setup/init.lua
require("treesitter") -- ./lua/treesitter/init.lua
require("context-print") -- ./lua/context-print/init.lua
require("lsp") -- ./lua/lsp/
require("lsp.lua") -- ./lua/lsp/lua.lua
require("lsp.rust") -- ./lua/lsp/rust.lua
require("lsp.bash") -- ./lua/lsp/bash.lua
require("lsp.json") -- ./lua/lsp/json.lua
require("lsp.html") -- ./lua/lsp/html.lua
require("lsp.css") -- ./lua/lsp/css.lua
require("lsp.php") -- ./lua/lsp/php.lua
require("lsp.vimls") -- ./lua/lsp/vimls.lua
require("lsp.tsserver") -- ./lua/lsp/tsserver.lua
require("lsp.latex") -- ./lua/lsp/latex.lua
require("lsp.docker") -- ./lua/lsp/docker.lua
require("lsp.sql") -- ./lua/lsp/sql.lua
require("lsp.yaml") -- ./lua/lsp/yaml.lua
require("lsp.znote") -- ./lua/lsp/znote.lua
require("lsp.perlpls") -- ./lua/lsp/perlpls.lua
require("lsp.c") -- ./lua/lsp/c.lua
require("lsp.clangd") -- ./lua/lsp/clangd.lua
-- require('lsp.perl') -- ./lua/lsp/perl.lua
-- require("lsp-saga") -- ./lua/lsp-saga/init.lua
require("lsp-kind") -- ./lua/lsp-kind/init.lua
-- require('lsp-sign') -- ./lua/lsp-sign/init.lua
-- require('lsp.deno') -- ./lua/lsp/deno.lua <- not now
-- require('lsp.stylelint') -- ./lua/lsp/stylelint.lua
require("formatting") -- ./lua/formatting.lua
require("lsp.formatter") -- ./lua/lsp/formatter.lua
require("lsp-trouble") -- ./lua/lsp-trouble/init.lua
require("lsp-trouble-keybindings") -- ./lua/lsp-trouble-keybindings.lua
require("symbols-outline") -- ./lua/symbols/init.lua

-- /// OTHERS ///.
require("vimg") -- ./lua/vimg/init.lua
require("web-devicons") -- ./lua/web-devicons/init.lua
require("cheatsh") -- ./lua/cheatsh/init.lua
require("colorizer-setup") -- ./lua/colorizer-setup/init.lua
require("nvim-commented") -- ./lua/nvim-commented/init.lua
require("lua-autopairs") -- (?) --./lua/lua-autopairs/init.lua
require("git-related") -- ./lua/git-related/init.lua
require("git-blame") -- ./lua/git-blame/init.lua
require("markdown-preview") -- ./lua/markdown-preview/init.lua
require("g-worktree") -- ./lua/g-worktree/init.lua
require("prime-harpoon") -- ./lua/prime-harpoon/init.lua
require("git-sings") -- ./lua/git-sings/init.lua
require("autosession") -- ./lua/autosession/init.lua
require("numb-nvim") -- ./lua/numb-nvim/init.lua
require("octo") -- ./lua/octo/init.lua
require("vimtex") -- ./lua/vimtex/init.lua
require("todo-finder") -- ./lua/todo-finder/init.lua
require("rs-tools") -- ./lua/rs-tools/init.lua
require("trim-lua") -- ./lua/trim-lua/init.lua
require("perl-omni") -- ./lua/perl-omni/init.lua
require("refactor") -- ./lua/refactor/init.lua
-- require("range-high") -- ./lua/range-high/init.lua
-- require('t-zen') -- ./lua/t-zen/init.lua
-- require('nvim-commenter') -- ./lua/nvim-commenter/init.lua
-- require('complition-setup') --./lua/complition-setup/init.lua
-- require('neo-git') -- ./lua/neo-git/init.lua
-- require('diff-view') -- ./lua/diff-view/init.lua
-- require('ts-autotags') -- ./lua/ts-autotags/init.lua
-- require('neo-scroll') -- ./lua/neo-scroll/init.lua
-- require('fterm') -- ./lua/fterm/init.lua
-- require('toggleterm') -- ./lua/toggleterm/init.lua
-- require('lir') -- ./lua/lir/init.lua
-- require('spell-sitter') -- ./lua/spell-sitter/init.lua
-- require('neuron-nvim') -- ./lua/neuron-nvim/init.lua
-- require('shade-windows') -- ./lua/shade-windows/init.lua
-- require('autopairs') -- (?) --./lua/autopairs/init.lua
-- require('nerd-commenter') --./lua/nerd-commenter/init.lua

-- /// TODO: ///.
--
