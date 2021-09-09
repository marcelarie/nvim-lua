-- /// BASE ///.
require("impatient") -- ./lua/impatient/init.lua
require("colorscheme") -- ./lua/colorscheme.lua
require("plugins") -- ./lua/plugins.lua
require("settings") -- ./lua/settings.lua
require("aliases") -- ./lua/aliases.lua
require("globals") -- ./lua/globals.lua
require("autocommands") -- ./lua/autocommands.lua

-- /// REMAPS ///.
require("leader-remaps") -- ./lua/remaps.lua
require("remaps") -- ./lua/remaps.lua

-- /// TREE & EXPLORERS ///.
require("undo-tree") -- ./lua/undo-tree/init.lua
require("netrw") -- ./lua/netrw/init.lua
require("feline-status") -- ./lua/feline-status/init.lua
require("tree-keybindings") -- ./lua/tree-keybindings/init.lua
require("vim-keybindings") -- ./lua/vim-keybindings/init.lua

-- /// NAVIGATION ///.
require("nv-telescope") -- ./lua/nv-telescope/init.lua
require("telescope-keybindings") -- ./lua/telescope-keybindings.lua
require("quick-scope") -- ./lua/quick-scope/init.lua

-- /// LS & SYNTAX ///.
require("cmp-setup") -- ./lua/cmp-setup/init.lua
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
-- require('lsp.stylelint') -- ./lua/lsp/stylelint.lua
-- require('lsp.deno') -- ./lua/lsp/deno.lua <- not now
require("lsp-saga") -- ./lua/lsp-saga/init.lua
require("lsp-kind") -- ./lua/lsp-kind/init.lua
-- require("lsp-sign") -- ./lua/lsp-sign/init.lua

require("formatting") -- ./lua/formatting.lua
require("lsp.formatter") -- ./lua/lsp/formatter.lua
require("lsp-trouble") -- ./lua/lsp-trouble/init.lua
require("lsp-trouble-keybindings") -- ./lua/lsp-trouble-keybindings.lua
require("symbols-outline") -- ./lua/symbols/init.lua
require("nvim-commented") -- ./lua/nvim-commented/init.lua

-- /// OTHERS ///.
require("web-devicons") -- ./lua/web-devicons/init.lua
require("colorizer-setup") -- ./lua/colorizer-setup/init.lua
require("lua-autopairs") -- (?) --./lua/lua-autopairs/init.lua
require("markdown-preview") -- ./lua/markdown-preview/init.lua
require("prime-harpoon") -- ./lua/prime-harpoon/init.lua
require("autosession") -- ./lua/autosession/init.lua
require("numb-nvim") -- ./lua/numb-nvim/init.lua
require("vimtex") -- ./lua/vimtex/init.lua
require("todo-finder") -- ./lua/todo-finder/init.lua
require("trim-lua") -- ./lua/trim-lua/init.lua
require("refactor") -- ./lua/refactor/init.lua

-- /// Rust ///
require("crates") -- ./lua/crates/init.lua
require("rs-tools") -- ./lua/rs-tools/init.lua

-- /// Git ///
require("octo") -- ./lua/octo/init.lua
require("git-related") -- ./lua/git-related/init.lua
require("git-blame") -- ./lua/git-blame/init.lua
require("git-sings") -- ./lua/git-sings/init.lua
require("g-worktree") -- ./lua/g-worktree/init.lua
require("diff-view") -- ./lua/diff-view/init.lua

-- /// TODO: ///.
