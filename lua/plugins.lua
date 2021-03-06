---@diagnostic disable: undefined-global
vim.cmd([[packadd packer.nvim]])

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute("packadd packer.nvim")
end

return require("packer").startup(function() -- Packer can manage itself as an optional plugin
	use({ "wbthomason/packer.nvim", opt = true })
	use({ "lewis6991/impatient.nvim", rocks = "mpack" })

	-- Colorschemes
	use("lifepillar/vim-gruvbox8")
	use("phanviet/vim-monokai-pro")
	use("mhartington/oceanic-next")
	use("fenetikm/falcon")
	-- use 'morhetz/gruvbox'
	use("npxbr/gruvbox.nvim")
	use("eddyekofo94/gruvbox-flat.nvim")
	use("rktjmp/lush.nvim")
	use("savq/melange")
	use("ishan9299/modus-theme-vim")
	use("ishan9299/nvim-solarized-lua")

	-- Telescope
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-media-files.nvim")
	use("nvim-telescope/telescope-fzy-native.nvim")
	use("nvim-telescope/telescope-symbols.nvim")
	use("dhruvmanila/telescope-bookmarks.nvim")
	use("nvim-telescope/telescope-github.nvim")
	use({
		"nvim-telescope/telescope-arecibo.nvim",
		rocks = { "openssl", "lua-http-parser" },
	})
	-- use("nvim-telescope/telescope-node-modules.nvim")

	-- LSP
	use("neovim/nvim-lsp")
	use("onsails/lspkind-nvim")
	use("neovim/nvim-lspconfig")
	use({ "hrsh7th/nvim-cmp", requires = { "hrsh7th/cmp-buffer" } })
	use("hrsh7th/cmp-nvim-lsp")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/cmp-emoji")
	use("hrsh7th/cmp-calc")
	use("hrsh7th/cmp-latex-symbols")
	use("ray-x/cmp-treesitter")
	use("hrsh7th/cmp-nvim-lua")
	use("f3fora/cmp-spell")
	use("quangnguyen30192/cmp-nvim-ultisnips")
	use("quangnguyen30192/cmp-nvim-tags")
	--  use("f3fora/cmp-nuspell")

	use("tjdevries/nlua.nvim")
	use("tjdevries/lsp_extensions.nvim")
	use("jose-elias-alvarez/nvim-lsp-ts-utils")
	use("simrat39/symbols-outline.nvim")
	use("ray-x/lsp_signature.nvim")

	-- LSP Saga
	use("glepnir/lspsaga.nvim")

	-- Git
	use("tpope/vim-fugitive")
	use("lewis6991/gitsigns.nvim")
	use("f-person/git-blame.nvim")
	use("tpope/vim-abolish")
	use("sindrets/diffview.nvim")
	use("ThePrimeagen/git-worktree.nvim")
	use("pwntester/octo.nvim")
	-- use 'rhysd/committia.vim'

	-- Formatter
	use("sbdchd/neoformat")

	-- TreeSitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/playground")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("nvim-treesitter/nvim-treesitter-textobjects")

	-- print on cursor
	use("bryall/contextprint.nvim")

	-- Perl

	-- Nvim line
	use("famiu/feline.nvim")

	-- Startup time
	use("tweekmonster/startuptime.vim")

	-- Nvim tree
	use("kyazdani42/nvim-tree.lua")

	--  Snippets
	use("L3MON4D3/LuaSnip")
	use("honza/vim-snippets")
	use("SirVer/ultisnips")
	use("thomasfaingnaert/vim-lsp-snippets")
	use("mlaursen/vim-react-snippets")
	use("dsznajder/vscode-es7-javascript-react-snippets")
	use("hrsh7th/vim-vsnip")
	use("hrsh7th/vim-vsnip-integ")
	use("ChristianChiarulli/html-snippets")
	use("rafamadriz/friendly-snippets")

	-- Latex
	use("lervag/vimtex")

	-- Rust
	use("simrat39/rust-tools.nvim")
	use("saecki/crates.nvim")

	-- Others
	use("christoomey/vim-system-copy") -- System Copy
	use("norcalli/nvim-colorizer.lua") -- Colorizer
	use("windwp/nvim-autopairs") -- AutoPairs
	use("windwp/nvim-ts-autotag") -- Autotags
	use("tpope/vim-surround") -- Vim Surround
	use("winston0410/commented.nvim") -- NVIM Commenter
	use("mbbill/undotree")
	use("rafcamlet/nvim-luapad")
	use("alvan/vim-closetag")
	use("kyazdani42/nvim-web-devicons")
	use("ryanoasis/vim-devicons")
	use("folke/lsp-trouble.nvim")
	use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install" })
	use("cappyzawa/trim.nvim")
	use("unblevable/quick-scope") -- An always-on highlight for a unique character in every word on a line to help you use f, F and family
	use("tversteeg/registers.nvim")
	use("rmagatti/auto-session")
	use("rmagatti/session-lens") -- < with tree sitter
	use("KabbAmine/vCoolor.vim") -- color picker
	use("jakerobers/vim-hexrgba") -- hex rgba toggle
	use("amadeus/vim-convert-color-to") -- color converter
	use("nacro90/numb.nvim")
	use({ "oberblastmeister/neuron.nvim", branch = "unstable" }) -- note taker
	use("folke/todo-comments.nvim") -- TODO finder
	use("ThePrimeagen/harpoon")
	use("ThePrimeagen/refactoring.nvim")
	use("fladson/vim-kitty") -- syntax highlight on kitty conf
	use("beauwilliams/focus.nvim") -- handle splits resize

	--  use("marcelarie/telescope-cheat.nvim")
	-- /// MYBE LATER ///
	-- spell
	--  use("f3fora/lua-nuspell")
	--
	-- Change root folder to the one opened with vim
	-- use 'airblade/vim-rooter'
	--
	-- spellsitter
	-- use 'lewis6991/spellsitter.nvim'

	-- Maybe later
	-- use 'gennaro-tedesco/nvim-peekup''
end)
