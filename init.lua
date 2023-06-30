require "plugins"

if vim.env.FIRST_TIME then
	vim.cmd "PackerSync"
	return
end

require "settings"
require "colorscheme"
require "aliases"
require "global"
require "globals"
require "autocommands"
require "impatient"

-- require "remaps"
require "leader-remaps"

require "plugins.undo-tree"
require "plugins.netrw"
require "plugins.lualine-status"
-- require "plugins.heirline"
require "plugins.nvim-tree"
require "vim-keybindings"
require "mappings"
-- require "plugins.whichkey"

require "nv-telescope"
require "telescope-keybindings"
require "plugins.quick-scope"

require "plugins.luasnip"
-- require "plugins.comment-box"

-- require "plugins.coq"
require "plugins.cmp-setup"
require "plugins.treesitter"
require "plugins.surround"
-- require "plugins.context-print"
require "plugins.neodev"
require "plugins.gitlinker"
require "lsp"
-- require "lsp.eslint"
require "lsp.bash"
require "lsp.c"
require "lsp.clangd"
require "lsp.css"
-- require "lsp.ruby"
require "lsp.marksman"
-- require "lsp.deno"
require "lsp.docker"
require "lsp.html"
require "lsp.json"
require "lsp.latex"
require "lsp.ltex"
require "lsp.lua"
require "lsp.nix"
require "lsp.null"
require "lsp.perl"
require "lsp.perlpls"
require "lsp.php"
require "lsp.python"
require "lsp.rust"
require "lsp.sql"
-- require "lsp.tsserver" -- now using typescript.nvim
-- require "lsp.vtsls" -- language features for ts/js
require "lsp.vimls"
-- require "lsp.yaml"
require "lsp.zk"
require "lsp.go"
require "plugins.lsp-uti"

require "plugins.neoroot"

-- require "lsp-sign"
vim.cmd [[
	if exists("g:neovide")
	    let g:neovide_cursor_animation_length=0
	    let g:neovide_cursor_trail_length=0
	    let g:neovide_cursor_animation_style="blink"
	endif
]]

if not vim.g.started_by_firenvim then
	-- require "plugins.lightbulb"

	require "formatting"
	require "lsp-trouble"
	require "lsp-trouble-keybindings"
	require "plugins.nvim-commented"
	require "symbols-outline"

	require "plugins.web-devicons"
	-- require "plugins.colorizer-setup"
	require "plugins.nvim-highlight-colors"
	-- require "plugins.markdown-preview"
	require "plugins.peek"
	require "plugins.numb-nvim"
	require "plugins.vimtex"
	require "plugins.todo-finder"
	require "plugins.neoclip"
	-- require "plugins.bubbly"
	require "plugins.color-buddy"
	require "plugins.sad"
	require "plugins.substitute"
	require "plugins.better-esc"

	require "git-related"
	require "git-blame"
	require "git-sings"
	-- require "diff-view"
	-- require "octo"

	-- /// Rust ///
	require "plugins.crates"
	require "plugins.rs-tools"

	require "plugins.carbon"
	require "plugins.persistence"
	require "plugins.alpha-menu"
	require "plugins.trim-lua"
	require "plugins.ts-nvim"
	require "plugins.git-conflict"
	require "plugins.easy-pick"
	-- require "plugins.nvim-cursorline"
	require "plugins.lsp-lines"
	require "plugins.trevj"
	-- require "plugins.autosession"
	require "plugins.dressing"
	-- require "plugins.inc-rename"
	-- require "plugins.highlight-curr-n"
	-- require "plugins.notify"
	-- require "plugins.notifier"
	require "plugins.fidget"
	require "plugins.open"
	require "plugins.winbar"
	require "plugins.mason"
	-- require "plugins.numbers"
	-- require "plugins.pairs"
	-- require "g-worktree"
	-- require "plugins.focus"
	require "plugins.neorg"
	require "plugins.telekasten"
	require "custom-syntax"
	require "plugins.vim-ai"
	-- require "plugins.autoclose"
	require "plugins.hbac"
	-- require "plugins.prime-harpoon"
else
	require "firenvim_config"
end

vim.cmd ":highlight Search guibg=#000 guifg=#ED722E gui=boldunderline"
vim.opt.laststatus = 3
