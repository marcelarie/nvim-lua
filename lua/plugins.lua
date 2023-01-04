---@diagnostic disable: undefined-global, lowercase-global
vim.fn.setenv("MACOSX_DEPLOYMENT_TARGET", "10.15")

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

local packer = require "packer"

packer.init {
	--FIXES ISSUE WHERE WONT UPDATE OTHERWISE
	max_jobs = 64,
	git = {
		clone_timeout = 500, -- 5 mins
	},
	profile = {
		enable = true,
	},
}

-- vim.fn.setenv("MACOSX_DEPLOYMENT_TARGET", "12.4")

return packer.startup(
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
		use "katawful/kat.nvim"
		use { "shaunsingh/oxocarbon.nvim", run = "./install.sh" }
		use { "catppuccin/nvim", as = "catppuccin" }
		use {

			"jhchabran/monarized",
			config = function()
				vim.g.monarized_lualine = true
				vim.g.monarized_kitty_colors = true
			end,
		}
		use "EdenEast/nightfox.nvim"
		use { "shaeinst/roshnivim-cs" }
		use "npxbr/gruvbox.nvim"
		use "eddyekofo94/gruvbox-flat.nvim" -- <-- original
		use "rktjmp/lush.nvim"
		use "savq/melange"
		use "ishan9299/modus-theme-vim"
		use "ishan9299/nvim-solarized-lua"
		use "aktersnurra/no-clown-fiesta.nvim"

		-- Telescope
		use "nvim-lua/popup.nvim"
		use "nvim-lua/plenary.nvim"
		use {
			"nvim-telescope/telescope.nvim",
			requires = {
				{ "nvim-telescope/telescope-github.nvim" },
			},
		}
		use "nvim-telescope/telescope-media-files.nvim"
		use "nvim-telescope/telescope-fzy-native.nvim"
		use "nvim-telescope/telescope-symbols.nvim"
		use "dhruvmanila/telescope-bookmarks.nvim"
		use "nvim-telescope/telescope-github.nvim"
		use "nvim-telescope/telescope-packer.nvim"
		use "cljoly/telescope-repo.nvim"
		use "jvgrootveld/telescope-zoxide"

		-- LSP
		use "neovim/nvim-lsp"
		use "onsails/lspkind-nvim"
		use "neovim/nvim-lspconfig"
		use "barreiroleo/ltex-extra.nvim"

		-- coq_nvim:
		-- main one
		use { "ms-jpq/coq_nvim", branch = "coq" }
		-- 9000+ Snippets
		use { "ms-jpq/coq.artifacts", branch = "artifacts" }
		-- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
		-- Need to **configure separately**
		use { "ms-jpq/coq.thirdparty", branch = "3p" }

		-- cmp
		use {
			"hrsh7th/nvim-cmp",
			requires = {
				"hrsh7th/cmp-buffer",
			},
		}
		use "hrsh7th/cmp-nvim-lsp"
		use "saadparwaiz1/cmp_luasnip"
		use "hrsh7th/cmp-path"
		use "hrsh7th/cmp-cmdline"
		use "hrsh7th/cmp-nvim-lua"
		use "andersevenrud/cmp-tmux"
		-- use { "github/copilot.vim" } -- needed for the auth
		use {
			"zbirenbaum/copilot.lua",
			event = "VimEnter",
			config = function()
				vim.defer_fn(function()
					require("copilot").setup {
						panel = {
							enabled = true,
							auto_refresh = false,
							keymap = {
								jump_prev = "[[",
								jump_next = "]]",
								accept = "<CR>",
								refresh = "gr",
								open = "<M-CR>",
							},
						},
						suggestion = {
							enabled = true,
							auto_trigger = false,
							debounce = 75,
							keymap = {
								accept = "<M-l>",
								next = "<M-]>",
								prev = "<M-[>",
								dismiss = "<C-]>",
							},
						},
						copilot_node_command = "node", -- Node version must be < 18
						server_opts_overrides = {},
					}
				end, 100)
			end,
		}
		use {
			"zbirenbaum/copilot-cmp",
			after = { "copilot.lua", "nvim-cmp" },
			config = function()
				require("copilot_cmp").setup()
			end,
		}
		use { "jose-elias-alvarez/null-ls.nvim" }
		use { "MunifTanjim/eslint.nvim" }
		use "jose-elias-alvarez/nvim-lsp-ts-utils"
		use "simrat39/symbols-outline.nvim"
		use "jubnzv/virtual-types.nvim"

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
		use "nvim-treesitter/nvim-treesitter-context"
		use { "zsugabubus/crazy8.nvim" }
		use "eandrju/cellular-automaton.nvim"

		-- Nvim statusline
		use "hoob3rt/lualine.nvim"
		use "rebelot/heirline.nvim"

		-- Startup time
		use "tweekmonster/startuptime.vim"

		-- File explorers
		use "kyazdani42/nvim-tree.lua"
		use "SidOfc/carbon.nvim"

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

		-- DAP
		use "mfussenegger/nvim-dap"

		-- Rust
		use "simrat39/rust-tools.nvim"
		use "saecki/crates.nvim"

		-- Others
		use "christoomey/vim-system-copy" -- System Copy
		use "windwp/nvim-ts-autotag" -- Autotags
		use "kylechui/nvim-surround"
		use "numToStr/Comment.nvim"
		use "mbbill/undotree"
		use "rafcamlet/nvim-luapad"
		use "kyazdani42/nvim-web-devicons"
		use "folke/lsp-trouble.nvim"
		use "tani/glance-vim"
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
		use { "ray-x/guihua.lua", run = "cd lua/fzy && make" } -- lua GUI lib
		use "ray-x/sad.nvim"
		use { "ellisonleao/glow.nvim" }
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
		use { "akinsho/git-conflict.nvim", tag = "v1.0.0" }
		use {
			"johmsalas/text-case.nvim",
			branch = "issue-16",
			config = function()
				require("textcase").setup {}
				require("telescope").load_extension "textcase"
				vim.api.nvim_set_keymap(
					"n",
					"ga.",
					"TextCaseOpenTelescope",
					{ desc = "Telescope" }
				)
				vim.api.nvim_set_keymap(
					"v",
					"ga.",
					"TextCaseOpenTelescope",
					{ desc = "Telescope" }
				)
			end,
		}
		use { "ZhiyuanLck/smart-pairs", event = "InsertEnter" }
		use "wellle/targets.vim"
		use {
			"axkirillov/easypick.nvim",
			-- requires = "nvim-telescope/telescope.nvim",
		}
		use "vigoux/notifier.nvim"
		use "folke/neodev.nvim"
		use {
			"jbyuki/instant.nvim",
			config = function()
				vim.cmd 'let g:instant_username = "USERNAME"'
			end,
		}
		use {
			"sQVe/sort.nvim",
			config = function()
				require("sort").setup {}
			end,
		}
		use { "https://git.sr.ht/~whynothugo/lsp_lines.nvim" }

		-- use "ggandor/lightspeed.nvim"
		use "olimorris/persisted.nvim"
		use "smjonas/inc-rename.nvim"
		use "stevearc/dressing.nvim"
		use {
			"AckslD/nvim-FeMaco.lua",
			config = function()
				require("femaco").setup()
			end,
		}
		use "brenoprata10/nvim-highlight-colors"
		use "AckslD/nvim-trevJ.lua"
		use "ggandor/lightspeed.nvim"
		use "ofirgall/open.nvim"
		use {
			"declancm/cinnamon.nvim",
			config = function()
				require("cinnamon").setup()
			end,
		}

		if packer_bootstrap then
			require("packer").sync()
		end
	end
)
