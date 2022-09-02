require "plugins"

if vim.env.FIRST_TIME then
	vim.cmd "PackerSync"
	return
end

require "settings"
require "colorscheme"
require "aliases"
require "globals"
require "autocommands"
require "impatient"

require "remaps"
require "leader-remaps"

require "plugins.undo-tree"
require "plugins.netrw"
require "plugins.lualine-status"
require "plugins.nvim-tree"
require "vim-keybindings"
require "plugins.whichkey"

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
require "lsp"
-- require "lsp.eslint"
require "lsp.bash"
require "lsp.c"
require "lsp.clangd"
require "lsp.css"
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
require "lsp.tsserver"
require "lsp.vimls"
require "lsp.yaml"
require "lsp.zk"
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
	require "plugins.lightbulb"

	require "formatting"
	require "lsp-trouble"
	require "lsp-trouble-keybindings"
	require "plugins.nvim-commented"
	require "symbols-outline"

	require "plugins.web-devicons"
	require "plugins.colorizer-setup"
	require "plugins.markdown-preview"
	require "plugins.numb-nvim"
	require "plugins.vimtex"
	require "plugins.todo-finder"
	require "plugins.neoclip"
	require "plugins.bubbly"
	require "plugins.color-buddy"
	require "plugins.sad"
	require "plugins.substitute"
	require "plugins.better-esc"

	require "git-related"
	require "git-blame"
	require "git-sings"
	require "diff-view"

	-- /// Rust ///
	require "plugins.crates"
	require "plugins.rs-tools"

	require "plugins.carbon"
	require "plugins.persistence"
	require "plugins.alpha-menu"
	require "plugins.trim-lua"
	require "plugins.ts-utils"
	require "plugins.git-conflict"
	require "plugins.easy-pick"
	require "plugins.nvim-cursorline"
	require "plugins.lsp-lines"
	-- require "plugins.autosession"
	require "plugins.dressing"
	require "plugins.inc-rename"
	-- require "plugins.notify"
	-- require "plugins.pairs"
	-- require "g-worktree"
	-- require "plugins.focus"
	-- require "plugins.neorg"
	-- require "plugins.prime-harpoon"
else
	require "firenvim_config"
end

vim.cmd "set laststatus=3"
