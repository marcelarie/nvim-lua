-- [[ Configure plugins ]]
require("lazy").setup({
	"stevearc/profile.nvim",
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
	-- "tridactyl/vim-tridactyl",
	"nacro90/numb.nvim",
	{ "sindrets/diffview.nvim", lazy = false },
	"NoahTheDuke/vim-just",
	"kevinhwang91/nvim-bqf",
	{ "stevearc/dressing.nvim", opts = {} },
	{ "nvchad/volt", lazy = true },
	{
		"nvchad/minty",
		lazy = true,
		cmd = { "Shades", "Huefy" },
	},
	"mickael-menu/zk-nvim",
	"christoomey/vim-system-copy",
	"wellle/targets.vim",
	"kilavila/nvim-gitignore",

	{ "kaarmu/typst.vim", ft = { "typ" } },

	-- NOTE: This is where your plugins related to LSP can be installed.
	--  The configuration is done below. Search for lspconfig to find it below.
	{
		-- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			{
				"williamboman/mason.nvim",
				config = true,
				opts = { PATH = "append" },
			},
			"williamboman/mason-lspconfig.nvim",
		},
	},
	{
		-- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/playground",
			"nvim-treesitter/nvim-treesitter-textobjects",
			"JoosepAlviste/nvim-ts-context-commentstring",
      "marcelarie/tree-sitter-kanshi",
			{
				"nushell/tree-sitter-nu",
				-- build = ":TSUpdate nu",
				commit = "e8bdcb9d4d57d999ad6d7c797f9f1808623df1b9",
			},
		},
		build = ":TSUpdate",
	},
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
