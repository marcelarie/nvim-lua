---@diagnostic disable: undefined-global, lowercase-global

local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
end

vim.cmd "packadd packer.nvim"

return require("packer").startup(
	function() -- Packer can manage itself as an optional plugin
		use { "wbthomason/packer.nvim", opt = true }
		use { "lewis6991/impatient.nvim", rocks = "mpack" }

		-- Colorschemes
		use "tjdevries/colorbuddy.nvim"
		use "lifepillar/vim-gruvbox8"
		use { "mrjones2014/lighthaus.nvim" }
		use "phanviet/vim-monokai-pro"
		use "mhartington/oceanic-next"
		use "fenetikm/falcon"
		use {
			"jhchabran/monarized",
			config = function()
				vim.g.monarized_lualine = true
				vim.g.monarized_kitty_colors = true
			end,
		}
		-- use 'morhetz/gruvbox'
		use { "shaeinst/roshnivim-cs" }
		use "npxbr/gruvbox.nvim"
		use "eddyekofo94/gruvbox-flat.nvim" -- <-- original
		use "rktjmp/lush.nvim"
		use "savq/melange"
		use "ishan9299/modus-theme-vim"
		use "ishan9299/nvim-solarized-lua"
		use "RRethy/nvim-base16"

		-- Telescope
		use "nvim-lua/popup.nvim"
		use "nvim-lua/plenary.nvim"
		use "nvim-telescope/telescope.nvim"
		use "nvim-telescope/telescope-media-files.nvim"
		use "nvim-telescope/telescope-fzy-native.nvim"
		use "nvim-telescope/telescope-symbols.nvim"
		use "dhruvmanila/telescope-bookmarks.nvim"
		use "nvim-telescope/telescope-github.nvim"
		use "nvim-telescope/telescope-packer.nvim"
		use "cljoly/telescope-repo.nvim"
		use "jvgrootveld/telescope-zoxide"
		-- use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
		-- use("nvim-telescope/telescope-node-modules.nvim")

		-- LSP
		use "neovim/nvim-lsp"
		use "onsails/lspkind-nvim"
		use "neovim/nvim-lspconfig"

		-- cmp
		use { "hrsh7th/nvim-cmp", requires = { "hrsh7th/cmp-buffer" } }
		use "hrsh7th/cmp-nvim-lsp"
		use "saadparwaiz1/cmp_luasnip"
		use "hrsh7th/cmp-path"
		use "hrsh7th/cmp-cmdline"
		use "hrsh7th/cmp-nvim-lua"
		-- use { "github/copilot.vim" } -- needed for the auth
		use {
			"zbirenbaum/copilot.lua",
			event = "VimEnter",
			config = function()
				vim.defer_fn(function()
					require("copilot").setup {}
				end, 1000)
			end,
		}
		use { "zbirenbaum/copilot-cmp", after = { "copilot.lua", "nvim-cmp" } }

		use { "jose-elias-alvarez/null-ls.nvim" }
		use { "MunifTanjim/eslint.nvim" }
		use "jose-elias-alvarez/nvim-lsp-ts-utils"
		use "simrat39/symbols-outline.nvim"
		-- use "ray-x/lsp_signature.nvim"
		-- use "mfussenegger/nvim-dap"

		-- LSP Utils
		use "RishabhRD/popfix"
		use "RishabhRD/nvim-lsputils"

		-- Git
		use "tpope/vim-fugitive"
		use "lewis6991/gitsigns.nvim"
		use "f-person/git-blame.nvim"
		use "tpope/vim-abolish"
		use "sindrets/diffview.nvim"
		-- use "pwntester/octo.nvim"

		-- TreeSitter
		use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
		use "nvim-treesitter/playground"
		use "JoosepAlviste/nvim-ts-context-commentstring"
		use { "zsugabubus/crazy8.nvim" }

		-- Nvim statusline
		use "hoob3rt/lualine.nvim"

		-- Startup time
		use "tweekmonster/startuptime.vim"

		-- Nvim tree
		use "kyazdani42/nvim-tree.lua"

		--  Snippets
		use "L3MON4D3/LuaSnip"
		use "honza/vim-snippets"
		use "thomasfaingnaert/vim-lsp-snippets"
		use "mlaursen/vim-react-snippets"
		use "dsznajder/vscode-es7-javascript-react-snippets"
		use "ChristianChiarulli/html-snippets"
		use "rafamadriz/friendly-snippets"

		-- Latex
		use "lervag/vimtex"

		-- Rust
		use "simrat39/rust-tools.nvim"
		use "saecki/crates.nvim"

		-- Others
		use "christoomey/vim-system-copy" -- System Copy
		use "norcalli/nvim-colorizer.lua" -- Colorizer
		use "windwp/nvim-ts-autotag" -- Autotags
		use "tpope/vim-surround" -- Vim Surround
		use "numToStr/Comment.nvim"
		use "mbbill/undotree"
		use "rafcamlet/nvim-luapad"
		use "kyazdani42/nvim-web-devicons"
		use "folke/lsp-trouble.nvim"
		use { "iamcco/markdown-preview.nvim", run = "cd app && npm install" }
		use "cappyzawa/trim.nvim"
		use "unblevable/quick-scope" -- An always-on highlight for a unique character in every word on a line to help you use f, F and family
		use "tversteeg/registers.nvim"
		use "folke/persistence.nvim"
		use "KabbAmine/vCoolor.vim" -- color picker
		use "nacro90/numb.nvim"
		use "folke/todo-comments.nvim" -- TODO finder
		use "fladson/vim-kitty" -- syntax highlight on kitty conf
		use "AckslD/nvim-neoclip.lua" -- clipboard manager with telescope
		use "tridactyl/vim-tridactyl"
		use {
			"glacambre/firenvim",
			run = function()
				vim.fn["firenvim#install"](0)
			end,
		}
		use "arkav/lualine-lsp-progress"
		use "goolord/alpha-nvim"
		use "kosayoda/nvim-lightbulb"
		use "folke/which-key.nvim"
		use { "ray-x/guihua.lua", run = "cd lua/fzy && make" } -- lua GUI lib
		use "ray-x/sad.nvim"
		use { "ellisonleao/glow.nvim" }
		use "nathom/filetype.nvim"
		use {
			"luukvbaal/stabilize.nvim",
			config = function()
				require("stabilize").setup()
			end,
		}
		use { "tami5/sqlite.lua", module = "sqlite" }
		use "lambdalisue/suda.vim"
		use "gbprod/substitute.nvim"
		use "max397574/better-escape.nvim"
		use { "nyngwang/NeoRoot.lua" }
		use {
			"jghauser/mkdir.nvim",
			config = function()
				require "mkdir"
			end,
		}
		use {
			"klen/nvim-test",
			config = function()
				require("nvim-test").setup {}
			end,
		}
		use { "farmergreg/vim-lastplace" }
		use "mickael-menu/zk-nvim"
		use {
			"benfowler/telescope-luasnip.nvim",
			-- module = "telescope._extensions.luasnip", -- if you wish to lazy-load
		}
		use { "akinsho/git-conflict.nvim" }

		-- use { "LudoPinelli/comment-box.nvim" }
		-- skim
		-- use { "lotabout/skim", dir = "~/.skim", run = "./install" }
		-- use "lotabout/skim.vim"
		-- Fuzzy
		-- use { "octaltree/linearf", merged = 0 }
		-- use "octaltree/linearf-my-flavors"
		-- use "beauwilliams/focus.nvim" -- handle splits resize
		-- use "jakerobers/vim-hexrgba" -- hex rgba toggle
		-- use "amadeus/vim-convert-color-to" -- color converter
		-- use "alvan/vim-closetag"
		-- use "ryanoasis/vim-devicons"
		-- use("rmagatti/session-lens") -- < with tree sitter
		-- use {
		-- 	"weilbith/nvim-code-action-menu",
		-- 	cmd = "CodeActionMenu",
		-- }
		-- use({ "ZhiyuanLck/smart-pairs", event = "InsertEnter" })

		if packer_bootstrap then
			require("packer").sync()
		end
	end
)
