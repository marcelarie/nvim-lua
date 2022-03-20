-- /// BASE ///.
require("plugins") -- ./lua/plugins.lua
require("settings") -- ./lua/settings.lua
require("colorscheme") -- ./lua/colorscheme.lua
require("aliases") -- ./lua/aliases.lua
require("globals") -- ./lua/globals.lua
require("autocommands") -- ./lua/autocommands.lua
require("impatient") -- ./lua/impatient/init.lua
-- /// REMAPS ///.
require("remaps") -- ./lua/remaps.lua
require("leader-remaps") -- ./lua/leader-remaps.lua

-- /// TREE & EXPLORERS ///.
require("plugins.undo-tree") -- ./lua/plugins/undo-tree/init.lua
require("plugins.netrw") -- ./lua/plugins/netrw/init.lua
require("plugins.lualine-status") -- ./lua/plugins/lualine-status/init.lua
require("plugins.nvim-tree") -- ./lua/plugins/nvim-tree/init.lua
require("vim-keybindings") -- ./lua/vim-keybindings/init.lua
--  require("plugins.feline-status") -- ./lua/plugins/feline-status/init.lua
-- require("plugins.difbuf") -- ./lua/plugins/difbuf/init.lua
--
-- /// NAVIGATION ///.
require("nv-telescope") -- ./lua/nv-telescope/init.lua
require("telescope-keybindings") -- ./lua/telescope-keybindings.lua
require("plugins.quick-scope") -- ./lua/plugins/quick-scope/init.lua
require("plugins.linearf") -- ./lua/plugins/linearf/init.lua

-- /// SNIPPETS ///
require("plugins.luasnip") -- ./lua/plugins/luasnip/init.lua

-- /// LS & SYNTAX ///.
require("plugins.cmp-setup") -- ./lua/plugins/cmp-setup/init.lua
require("plugins.treesitter") -- ./lua/plugins/treesitter/init.lua
require("plugins.context-print") -- ./lua/plugins/context-print/init.lua
require("lsp") -- ./lua/lsp/
require("lsp.lua") -- ./lua/lsp/lua.lua
require("lsp.rust") -- ./lua/lsp/rust.lua
require("lsp.bash") -- ./lua/lsp/bash.lua
require("lsp.json") -- ./lua/lsp/json.lua
require("lsp.html") -- ./lua/lsp/html.lua
require("lsp.css") -- ./lua/lsp/css.lua
require("lsp.php") -- ./lua/lsp/php.
require("lsp.vimls") -- ./lua/lsp/vimls.lua
require("lsp.tsserver") -- ./lua/lsp/tsserver.lua
require("lsp.eslint") -- ./lua/lsp/eslint.lua
require("lsp.latex") -- ./lua/lsp/latex.lua
require("lsp.docker") -- ./lua/lsp/docker.lua
require("lsp.sql") -- ./lua/lsp/sql.lua
require("lsp.yaml") -- ./lua/lsp/yaml.lua
require("lsp.perlpls") -- ./lua/lsp/perlpls.lua
require("lsp.perl") -- ./lua/lsp/perl.lua
require("lsp.c") -- ./lua/lsp/c.lua
require("lsp.clangd") -- ./lua/lsp/clangd.lua
require("lsp.nix") -- ./lua/lsp/nix.lua
require("lsp.ltex") -- ./lua/lsp/ltex.lua
require("lsp.null") -- ./lua/lsp/null.lua
require("plugins.lsp-uti") -- ./lua/plugins/lsp-uti/init.lua
require("lsp-kind") -- ./lua/lsp-kind/init.lua
-- require("plugins.neoroot") -- ./lua/plugins/neoroot/init.lua
-- require("lsp.znote") -- ./lua/lsp/znote.lua
-- require("lsp.formatter") -- ./lua/lsp/formatter.lua
-- require('lsp.stylelint') -- ./lua/lsp/stylelint.lua
-- require('lsp.deno') -- ./lua/lsp/deno.lua <- not now
--  require("lsp-saga") -- ./lua/lsp-saga/init.lua
-- require("lsp-sign") -- ./lua/lsp-sign/init.lua

if not vim.g.started_by_firenvim then
	require("plugins.lightbulb") -- ./lua/plugins/lightbulb/init.lua

	require("formatting") -- ./lua/formatting.lua
	require("lsp-trouble") -- ./lua/lsp-trouble/init.lua
	require("lsp-trouble-keybindings") -- ./lua/lsp-trouble-keybindings.lua
	require("plugins.nvim-commented") -- ./lua/plugins/nvim-commented/init.lua
	require("symbols-outline") -- ./lua/symbols/init.lua
	-- require("plugins.whichkey") -- ./lua/plugins/whichkey/init.lua

	-- /// OTHERS ///.
	require("plugins.web-devicons") -- ./lua/plugins/web-devicons/init.lua
	require("plugins.colorizer-setup") -- ./lua/plugins/colorizer-setup/init.lua
	require("plugins.markdown-preview") -- ./lua/plugins/markdown-preview/init.lua
	require("plugins.prime-harpoon") -- ./lua/plugins/prime-harpoon/init.lua
	require("plugins.numb-nvim") -- ./lua/plugins/numb-nvim/init.lua
	require("plugins.vimtex") -- ./lua/plugins/vimtex/init.lua
	require("plugins.todo-finder") -- ./lua/plugins/todo-finder/init.lua
	require("plugins.focus") -- ./lua/plugins/focus/init.lua
	require("plugins.neoclip") -- ./lua/plugins/neoclip/init.lua
	require("plugins.bubbly") -- ./lua/plugins/bubbly/init.lua
	require("plugins.color-buddy") -- ./lua/plugins/color-buddy/init.lua
	require("plugins.neorg") -- ./lua/plugins/neorg/init.lua
	require("plugins.sad") -- ./lua/plugins/sad/init.lua
	require("plugins.substitute") -- ./lua/plugins/substitute/init.lua
	require("plugins.better-esc") -- ./lua/better-esc/init.lua
	-- require("plugins.pairs") -- ./lua/plugins/pairs/init.lua
	require("plugins.regexplainer") -- ./lua/plugins/regexplainer/init.lua
	-- require("plugins.autopairs") -- (?) --./lua/plugins/autopairs/init.lua
	-- require("plugins.distant") -- ./lua/plugins/distant/init.lua
	-- require("plugins.fidget") -- ./lua/fidget/init.lua
	-- require("plugins.autosession") -- ./lua/plugins/autosession/init.lua
	-- require("plugins.session-manager") -- ./lua/plugins/session-manager/init.lua
	-- require("plugins.refactor") -- ./lua/plugins/refactor/init.lua

	-- /// Git ///
	-- require("octo") -- ./lua/octo/init.lua
	require("git-related") -- ./lua/git-related/init.lua
	require("git-blame") -- ./lua/git-blame/init.lua
	require("git-sings") -- ./lua/git-sings/init.lua
	require("g-worktree") -- ./lua/g-worktree/init.lua
	require("diff-view") -- ./lua/diff-view/init.lua

	--/// Firenvim ///
	-- /// Rust ///
	require("plugins.crates") -- ./lua/plugins/crates/init.lua
	--  require("plugins.rs-tools") -- ./lua/rs-tools/init.lua

	require("plugins.persistence") -- ./lua/plugins/persistence/init.lua
	require("plugins.alpha-menu") -- ./lua/plugins/alpha-menu/init.lua
	require("plugins.trim-lua") -- ./lua/plugins/trim-lua/init.lua
else
	require("firenvim_config")
end
