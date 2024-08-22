-- [[ Configure plugins ]]
require("lazy").setup({
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
  "tridactyl/vim-tridactyl",

	"nacro90/numb.nvim",
	{ "sindrets/diffview.nvim", lazy = false },
	"NoahTheDuke/vim-just",
	"kevinhwang91/nvim-bqf",
	{ "stevearc/dressing.nvim", opts = {} },
	"nyngwang/NeoRoot.lua",
	"mickael-menu/zk-nvim",
	"christoomey/vim-system-copy",
	"wellle/targets.vim",
	"FabijanZulj/blame.nvim",
	"kilavila/nvim-gitignore",

	{ "kaarmu/typst.vim", ft = { "typ" } },

	-- NOTE: This is where your plugins related to LSP can be installed.
	--  The configuration is done below. Search for lspconfig to find it below.
	{
		-- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
		},
	},
	{
		-- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/playground",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		build = ":TSUpdate",
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = {
			"MarkdownPreviewToggle",
			"MarkdownPreview",
			"MarkdownPreviewStop",
		},
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	-- { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	-- { "cappyzawa/trim.nvim", opts = { ft_blocklist = { "markdown" } } },
	-- { "axkirillov/hbac.nvim", config = true },
	-- { "LhKipp/nvim-nu" },

	--    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
	{ import = "plugins" },
}, {
	change_detection = {
		notify = false,
	},
	dev = {
		path = "~/clones/forks/",
	},
})

-- vim: ts=2 sts=2 sw=2 et
