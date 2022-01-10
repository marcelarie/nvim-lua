---@diagnostic disable: undefined-global, lowercase-global

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

vim.cmd("packadd packer.nvim")
vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require("packer").startup(function() -- Packer can manage itself as an optional plugin
	use({ "wbthomason/packer.nvim", opt = true })
	use({ "lewis6991/impatient.nvim", rocks = "mpack" })

	-- Colorschemes
	use("tjdevries/colorbuddy.nvim")
	use("lifepillar/vim-gruvbox8")
	use("phanviet/vim-monokai-pro")
	use("mhartington/oceanic-next")
	use("fenetikm/falcon")
	use({
		"jhchabran/monarized",
		config = function()
			vim.g.monarized_lualine = true
			vim.g.monarized_kitty_colors = true
		end,
	})
	-- use 'morhetz/gruvbox'
	use("npxbr/gruvbox.nvim")
	use("eddyekofo94/gruvbox-flat.nvim")
	use("rktjmp/lush.nvim")
	use("savq/melange")
	use("ishan9299/modus-theme-vim")
	use("ishan9299/nvim-solarized-lua")
	use("RRethy/nvim-base16")

	-- Telescope
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")

	-- skim
	use({ "lotabout/skim", dir = "~/.skim", run = "./install" })
	use("lotabout/skim.vim")

	-- use("nvim-telescope/telescope.nvim")
	use("~/clones/forks/telescope.nvim")

	use("nvim-telescope/telescope-media-files.nvim")
	use("nvim-telescope/telescope-fzy-native.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("nvim-telescope/telescope-symbols.nvim")
	use("dhruvmanila/telescope-bookmarks.nvim")
	use("nvim-telescope/telescope-github.nvim")
	use({
		"nvim-telescope/telescope-arecibo.nvim",
		rocks = { "openssl", "lua-http-parser" },
	})
	use("nvim-telescope/telescope-packer.nvim")
	use("jvgrootveld/telescope-zoxide")
	-- use("nvim-telescope/telescope-node-modules.nvim")

	-- Fuzzy
	use({ "octaltree/linearf", merged = 0 })
	use("octaltree/linearf-my-flavors")

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
	use("hrsh7th/cmp-cmdline")
	use("ray-x/cmp-treesitter")
	use("hrsh7th/cmp-nvim-lua")
	use("f3fora/cmp-spell")
	use("petertriho/cmp-git")
	-- use({ "~/clones/own/cmp-package" })
	use("quangnguyen30192/cmp-nvim-ultisnips")
	use("quangnguyen30192/cmp-nvim-tags")
	use("mfussenegger/nvim-dap")
	use("octaltree/cmp-look")
	use("lukas-reineke/cmp-rg")
	use({ "tzachar/cmp-tabnine", run = "./install.sh" })
	use("jubnzv/virtual-types.nvim")
	--  use("datwaft/bubbly.nvim") -- try other bubble for lsp
	--  use("f3fora/cmp-nuspell")

	use("tjdevries/complextras.nvim")
	use("tjdevries/nlua.nvim")
	use("tjdevries/lsp_extensions.nvim")
	use("jose-elias-alvarez/nvim-lsp-ts-utils")
	-- use("simrat39/symbols-outline.nvim")
	use("ray-x/lsp_signature.nvim")

	-- LSP Saga
	--  use("glepnir/lspsaga.nvim")
	-- LSP Utils
	use("RishabhRD/popfix")
	use("RishabhRD/nvim-lsputils")

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
	-- use("famiu/feline.nvim")
	use("hoob3rt/lualine.nvim")

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
	--  use("winston0410/commented.nvim") -- NVIM Commenter
	use("numToStr/Comment.nvim")
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
	--  use("rmagatti/auto-session")
	-- use("rmagatti/session-lens") -- < with tree sitter
	-- use("folke/persistence.nvim")
	use("~/clones/forks/persistence.nvim")

	-- use("Shatur/neovim-session-manager")
	use("KabbAmine/vCoolor.vim") -- color picker
	use("jakerobers/vim-hexrgba") -- hex rgba toggle
	use("amadeus/vim-convert-color-to") -- color converter
	use("nacro90/numb.nvim")
	use({ "oberblastmeister/neuron.nvim", branch = "unstable" }) -- note taker
	use("folke/todo-comments.nvim") -- TODO finder
	use("ThePrimeagen/harpoon")
	-- use("ThePrimeagen/refactoring.nvim")
	use("fladson/vim-kitty") -- syntax highlight on kitty conf
	use("beauwilliams/focus.nvim") -- handle splits resize
	use("AckslD/nvim-neoclip.lua") -- clipboard manager with telescope
	use("nvim-neorg/neorg")
	use("chipsenkbeil/distant.nvim")
	use("tridactyl/vim-tridactyl")
	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})
	use("airblade/vim-rooter")
	use("arkav/lualine-lsp-progress")
	use("goolord/alpha-nvim")
	use({
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	})
	use("kosayoda/nvim-lightbulb")
	use("folke/which-key.nvim")
	use({ "ray-x/guihua.lua", run = "cd lua/fzy && make" }) -- lua GUI lib
	use("ray-x/sad.nvim")
	use({ "ellisonleao/glow.nvim" })
	use("nathom/filetype.nvim")
	use("Pocco81/TrueZen.nvim")
	use({
		"luukvbaal/stabilize.nvim",
		config = function()
			require("stabilize").setup()
		end,
	})
	use({ "tami5/sqlite.lua", module = "sqlite" })

	-- use("marcelarie/telescope-cheat.nvim")
	-- /// MYBE LATER ///
	-- spell
	-- use("f3fora/lua-nuspell")

	-- Change root folder to the one opened with vim

	-- spellsitter
	-- use("lewis6991/spellsitter.nvim")

	-- Maybe later
	-- use("gennaro-tedesco/nvim-peekup")
	if packer_bootstrap then
		require("packer").sync()
	end
end)
