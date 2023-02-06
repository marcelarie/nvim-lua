local root = vim.fn.fnamemodify("./.repro", ":p")

-- set stdpaths to use .repro
for _, name in ipairs { "config", "data", "state", "cache" } do
	vim.env[("XDG_%s_HOME"):format(name:upper())] = root .. "/" .. name
end

-- bootstrap lazy
local lazypath = root .. "/plugins/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	}
end
vim.opt.runtimepath:prepend(lazypath)

-- install plugins
local plugins = {
	{ "lewis6991/impatient.nvim", rocks = "mpack" },
	-- Colorschemes
	"tjdevries/colorbuddy.nvim",
	"lifepillar/vim-gruvbox8",
	"mrjones2014/lighthaus.nvim",
	"phanviet/vim-monokai-pro",
	"mhartington/oceanic-next",
	"fenetikm/falcon",
	"katawful/kat.nvim",
	"rebelot/kanagawa.nvim",
	-- { "shaunsingh/oxocarbon.nvim", build = "./install.sh" },
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "projekt0n/github-nvim-theme", version = "v0.0.7" },
	{

		"jhchabran/monarized",
		config = function()
			vim.g.monarized_lualine = true
			vim.g.monarized_kitty_colors = true
		end,
	},
	"EdenEast/nightfox.nvim",
	"shaeinst/roshnivim-cs",
	"npxbr/gruvbox.nvim",
	"eddyekofo94/gruvbox-flat.nvim", -- <-- original,
	"rktjmp/lush.nvim",
	"savq/melange",
	"ishan9299/modus-theme-vim",
	"ishan9299/nvim-solarized-lua",
	"aktersnurra/no-clown-fiesta.nvim",

	-- Telescope
	"nvim-lua/popup.nvim",
	"nvim-lua/plenary.nvim",
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-telescope/telescope-github.nvim" },
		},
	},
	"nvim-telescope/telescope-media-files.nvim",
	"nvim-telescope/telescope-fzy-native.nvim",
	"nvim-telescope/telescope-symbols.nvim",
	"dhruvmanila/telescope-bookmarks.nvim",
	"nvim-telescope/telescope-github.nvim",
	"nvim-telescope/telescope-packer.nvim",
	"cljoly/telescope-repo.nvim",
	"jvgrootveld/telescope-zoxide",
	"ibhagwan/fzf-lua",
	{ "kat0h/bufpreview.vim", build = "deno task prepare" },

	-- LSP
	"neovim/nvim-lsp",
	"onsails/lspkind-nvim",
	"neovim/nvim-lspconfig",
	"barreiroleo/ltex-extra.nvim",
	-- coq_nvim:,
	-- main one,
	{ "ms-jpq/coq_nvim", branch = "coq" },
	-- 9000+ Snippets,
	{ "ms-jpq/coq.artifacts", branch = "artifacts" },
	-- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty,
	-- Need to **configure separately**,
	{ "ms-jpq/coq.thirdparty", branch = "3p" },
	-- cmp,
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
		},
	},
	"hrsh7th/cmp-nvim-lsp",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-nvim-lua",
	"andersevenrud/cmp-tmux",
	--  "github/copilot.vim"  -- needed for the auth
	{
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
	},
	{
		"zbirenbaum/copilot-cmp",
		-- dependencies = { "copilot.lua", "nvim-cmp" },
		config = function()
			require("copilot_cmp").setup()
		end,
	},
	"jose-elias-alvarez/null-ls.nvim",
	"MunifTanjim/eslint.nvim",
	"jose-elias-alvarez/nvim-lsp-ts-utils",
	"simrat39/symbols-outline.nvim",
	"jubnzv/virtual-types.nvim",
	-- LSP Utils,
	"RishabhRD/popfix",
	"RishabhRD/nvim-lsputils",
	-- Git
	"tpope/vim-fugitive",
	"lewis6991/gitsigns.nvim",
	"f-person/git-blame.nvim",
	"tpope/vim-abolish",
	"sindrets/diffview.nvim",
	"pwntester/octo.nvim",

	-- TreeSitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"nvim-treesitter/playground",
	"JoosepAlviste/nvim-ts-context-commentstring",
	"nvim-treesitter/nvim-treesitter-context",
	"zsugabubus/crazy8.nvim",
	"eandrju/cellular-automaton.nvim",
	"IndianBoy42/tree-sitter-just",
	-- Nvim statusline,
	"hoob3rt/lualine.nvim",
	"rebelot/heirline.nvim",
	-- Startup time,
	"tweekmonster/startuptime.vim",
	-- File explorers,
	"kyazdani42/nvim-tree.lua",
	"SidOfc/carbon.nvim",
	--  Snippets,
	"L3MON4D3/LuaSnip",
	"honza/vim-snippets",
	"thomasfaingnaert/vim-lsp-snippets",
	"mlaursen/vim-react-snippets",
	"dsznajder/vscode-es7-javascript-react-snippets",
	"ChristianChiarulli/html-snippets",
	"rafamadriz/friendly-snippets",
	-- Latex,
	"lervag/vimtex",
	-- DAP
	"mfussenegger/nvim-dap",
	"vim-denops/denops.vim",
	-- Rust
	"simrat39/rust-tools.nvim",
	"saecki/crates.nvim",

	-- Others
	"christoomey/vim-system-copy", -- System Copy
	"windwp/nvim-ts-autotag", -- Autotags
	"kylechui/nvim-surround",
	"numToStr/Comment.nvim",
	"mbbill/undotree",
	"rafcamlet/nvim-luapad",
	"kyazdani42/nvim-web-devicons",
	"folke/lsp-trouble.nvim",
	"tani/glance-vim",
	"cappyzawa/trim.nvim",
	"unblevable/quick-scope", -- An always-on highlight for a unique character in every word on a line to help you use f, F and family
	"tversteeg/registers.nvim",
	"folke/persistence.nvim",
	"KabbAmine/vCoolor.vim", -- color picker
	"nacro90/numb.nvim",
	"folke/todo-comments.nvim", -- TODO finder
	"fladson/vim-kitty", -- syntax highlight on kitty conf
	"AckslD/nvim-neoclip.lua", -- clipboard manager with telescope
	"tridactyl/vim-tridactyl",
	{
		"glacambre/firenvim",
		build = function()
			vim.fn["firenvim#install"](0)
		end,
	},
	"arkav/lualine-lsp-progress",
	"goolord/alpha-nvim",
	"kosayoda/nvim-lightbulb",
	{ "ray-x/guihua.lua", build = "cd lua/fzy && make" }, -- lua GUI lib
	"ray-x/sad.nvim",
	{
		"ellisonleao/glow.nvim",
		config = function()
			require("glow").setup()
		end,
	},
	{
		"luukvbaal/stabilize.nvim",
		config = function()
			require("stabilize").setup()
		end,
	},
	"tami5/sqlite.lua", --[[ module = "sqlite" ]]
	"lambdalisue/suda.vim",
	"gbprod/substitute.nvim",
	"max397574/better-escape.nvim",
	"nyngwang/NeoRoot.lua",
	{
		"jghauser/mkdir.nvim",
		config = function()
			require "mkdir"
		end,
	},
	{
		"klen/nvim-test",
		config = function()
			require("nvim-test").setup {}
		end,
	},
	{ "farmergreg/vim-lastplace" },
	"mickael-menu/zk-nvim",
	{
		"benfowler/telescope-luasnip.nvim",
		-- module = "telescope._extensions.luasnip", -- if you wish to lazy-load
	},
	{ "akinsho/git-conflict.nvim", version = "v1.0.0" },
	{
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
	},
	{ "ZhiyuanLck/smart-pairs", event = "InsertEnter" },
	"wellle/targets.vim",
	"axkirillov/easypick.nvim",
	-- "vigoux/notifier.nvim"
	"j-hui/fidget.nvim",
	"folke/neodev.nvim",
	{
		"jbyuki/instant.nvim",
		config = function()
			vim.cmd 'let g:instant_username = "USERNAME"'
		end,
	},
	{
		"sQVe/sort.nvim",
		config = function()
			require("sort").setup {}
		end,
	},
	{ "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },

	-- "ggandor/lightspeed.nvim"
	"olimorris/persisted.nvim",
	"smjonas/inc-rename.nvim",
	"stevearc/dressing.nvim",
	{
		"AckslD/nvim-FeMaco.lua",
		config = function()
			require("femaco").setup()
		end,
	},
	"brenoprata10/nvim-highlight-colors",
	"AckslD/nvim-trevJ.lua",
	"ggandor/lightspeed.nvim",
	"ofirgall/open.nvim",
	{
		"declancm/cinnamon.nvim",
		config = function()
			require("cinnamon").setup()
		end,
	},
	{
		"tjdevries/sg.nvim",
		build = "cargo build --workspace",
	},
}

vim.g.mapleader = " "

require("lazy").setup(plugins, {
	root = root .. "/test",
	-- performance = {
	-- 	rtp = { reset = false },
	-- },
})

vim.cmd "colorscheme nightfox"
