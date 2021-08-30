---@diagnostic disable: undefined-global
vim.cmd([[packadd packer.nvim]])

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	execute(
		"!git clone https://github.com/wbthomason/packer.nvim " .. install_path
	)
	execute("packadd packer.nvim")
end

return require("packer").startup(
	function() -- Packer can manage itself as an optional plugin
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
		-- use("nvim-telescope/telescope-node-modules.nvim")
		use("dhruvmanila/telescope-bookmarks.nvim")
		use("nvim-telescope/telescope-github.nvim")
		use({
			"nvim-telescope/telescope-arecibo.nvim",
			rocks = { "openssl", "lua-http-parser" },
		})
		use("tami5/sql.nvim") -- ↴
		use("marcelarie/telescope-cheat.nvim")

		-- LSP
		use("neovim/nvim-lsp")
		use("onsails/lspkind-nvim")
		use("neovim/nvim-lspconfig")
		--  use("hrsh7th/nvim-compe")
		use({ "hrsh7th/nvim-cmp", requires = { "hrsh7th/cmp-buffer" } })
		use("hrsh7th/cmp-nvim-lsp")
		use("saadparwaiz1/cmp_luasnip")
		use("hrsh7th/cmp-path")
		use("hrsh7th/cmp-vsnip")
		use("hrsh7th/cmp-emoji")
		use("hrsh7th/cmp-calc")
		use("hrsh7th/cmp-latex-symbols")
		--  use("tamago324/compe-zsh")
		use("tjdevries/nlua.nvim")
		use("tjdevries/lsp_extensions.nvim")
		use("jose-elias-alvarez/nvim-lsp-ts-utils")
		use("simrat39/symbols-outline.nvim")
		-- use 'kosayoda/nvim-lightbulb'
		-- use 'mattn/vim-lsp-settings'
		-- use 'nvim-lua/completion-nvim'
		-- use 'steelsojka/completion-buffers'
		--
		use("ray-x/lsp_signature.nvim")

		-- LSP Saga
		use("glepnir/lspsaga.nvim")

		-- Git
		use("tpope/vim-fugitive")
		use("lewis6991/gitsigns.nvim")
		use("f-person/git-blame.nvim")
		use("tpope/vim-abolish")
		-- use 'rhysd/committia.vim'
		-- use 'TimUntersberger/neogit'
		use("sindrets/diffview.nvim")

		-- worktrees
		use("ThePrimeagen/git-worktree.nvim")

		-- Formater
		use("sbdchd/neoformat")

		-- TreeSitter
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		use("nvim-treesitter/playground")
		-- use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
		use("JoosepAlviste/nvim-ts-context-commentstring")
		use("nvim-treesitter/nvim-treesitter-textobjects")

		-- print on cursor
		use("bryall/contextprint.nvim")

		-- Polyglot (?)
		-- use 'sheerun/vim-polyglot'

		-- Perl
		-- use 'vim-perl/vim-perl'
		use("c9s/perlomni.vim")
		-- use 'BrandonRoehl/auto-omni'

		-- System Copy
		use("christoomey/vim-system-copy")

		-- Cheat Sheet
		use("dbeniamine/cheat.sh-vim")

		-- Colorizer
		use("norcalli/nvim-colorizer.lua")

		-- AutoPairs
		-- use 'jiangmiao/auto-pairs'
		-- light lua auto pairs
		use("windwp/nvim-autopairs")

		-- Autotags
		use("windwp/nvim-ts-autotag")

		-- Vim Surround
		use("tpope/vim-surround")

		-- Nvim Surround
		-- use 'blackCauldron7/surround.nvim'

		-- NVIM Commenter
		-- use "terrortylor/nvim-comment"
		use("winston0410/commented.nvim")

		-- Undo Tree
		use("mbbill/undotree")

		-- lua development
		use("rafcamlet/nvim-luapad")

		-- perl development
		-- use 'vim-perl/vim-perl'

		-- vimG
		use("szw/vim-g")

		-- vim closetag
		use("alvan/vim-closetag")

		-- lua line
		-- use 'hoob3rt/lualine.nvim'
		-- galaxyline
		-- use 'glepnir/galaxyline.nvim'
		use("famiu/feline.nvim")

		-- nvim web devicons
		use("kyazdani42/nvim-web-devicons")
		use("ryanoasis/vim-devicons")

		-- Startup time
		use("tweekmonster/startuptime.vim")

		-- Nvim tree
		use("kyazdani42/nvim-tree.lua")

		-- React TESTING
		-- use 'MaxMEllon/vim-jsx-pretty'
		-- use 'neoclide/vim-jsx-improve'

		use("junegunn/vim-emoji")

		-- UltiSnips and vim snips
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
		use("folke/lsp-trouble.nvim")
		-- use 'thomasfaingnaert/vim-lsp-ultisnips'

		-- JS
		-- use 'styled-components/vim-styled-components'
		-- use 'pangloss/vim-javascript'
		-- use 'styled-components/vscode-styled-components'

		-- Change root folder to the one opened with vim
		-- use 'airblade/vim-rooter'

		-- markdown preview
		use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install" })

		-- welcome dashboard on start
		-- use 'glepnir/dashboard-nvim'

		-- An always-on highlight for a unique character in every word on a line to help you use f, F and family
		use("unblevable/quick-scope")

		-- Ranger inside vim
		use("kevinhwang91/rnvimr")

		-- Smooth scrolling
		-- use 'karb94/neoscroll.nvim'

		-- Dimm inactive windows
		use("sunjon/shade.nvim")

		-- Terminal
		-- use 'numToStr/FTerm.nvim'
		-- use "akinsho/nvim-toggleterm.lua"

		-- http calls inside vim
		use("nicwest/vim-http")

		-- spellsitter
		-- use 'lewis6991/spellsitter.nvim'

		-- autosession
		use("rmagatti/auto-session")
		use("rmagatti/session-lens") -- < with tree sitter

		-- file explorer lir
		-- use 'tamago324/lir.nvim'

		-- color picker
		use("KabbAmine/vCoolor.vim")
		-- hex rgba toggle
		use("jakerobers/vim-hexrgba")
		-- color converter
		use("amadeus/vim-convert-color-to")
		-- numbers
		use("nacro90/numb.nvim")

		-- note taker
		use({ "oberblastmeister/neuron.nvim", branch = "unstable" })
		-- octo nvim
		use("pwntester/octo.nvim")

		-- Latex
		use("lervag/vimtex")

		-- registers
		use("tversteeg/registers.nvim")

		-- restart/reload nvim
		use("famiu/nvim-reload")

		-- true zen
		-- use "Pocco81/TrueZen.nvim"

		-- ascii graphs
		use("jbyuki/venn.nvim")

		-- http rest
		use("NTBBloodbath/rest.nvim")

		-- harpoon
		use("ThePrimeagen/harpoon")

		-- TODO finder
		use("folke/todo-comments.nvim")

		-- whitespace
		-- use 'bronson/vim-trailing-whitespace'
		use("cappyzawa/trim.nvim")

		-- buffer menu
		use("matbme/JABS.nvim")

		-- rust tools
		use("simrat39/rust-tools.nvim")

		-- refactring
		use("ThePrimeagen/refactoring.nvim")

		-- syntax highlight on kitty conf
		use("fladson/vim-kitty")

		-- range - highlight
		-- use("winston0410/range-highlight.nvim")
		-- use("winston0410/cmd-parser.nvim")

		-- Maybe later
		-- use 'gennaro-tedesco/nvim-peekup''
	end
)
