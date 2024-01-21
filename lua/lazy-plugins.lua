-- [[ Configure plugins ]]
-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require("lazy").setup({
	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

	"nacro90/numb.nvim",
	"AckslD/nvim-neoclip.lua",
	"sindrets/diffview.nvim",
	"NoahTheDuke/vim-just",
	"kevinhwang91/nvim-bqf",
	"nyngwang/NeoRoot.lua",
	"mickael-menu/zk-nvim",
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

			-- Additional lua configuration, makes nvim stuff amazing!
			"folke/neodev.nvim",
		},
	},
	-- "gc" to comment visual regions/lines
	{
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
		config = function()
			require("Comment").setup {}

			local comment_ft = require "Comment.ft"
			comment_ft.set("fish", { "# %s", "# %s #" })
			comment_ft.set("bash", { "# %s", "# %s #" })
			comment_ft.set("sh", { "# %s", "# %s #" })
			comment_ft.set("", { "# %s", "# %s #" })
			comment_ft.set("typ", { "// %s", "/* %s */" })
		end,
	},

	{
		-- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/playground",
			"JoosepAlviste/nvim-ts-context-commentstring",
			"nvim-treesitter/nvim-treesitter-context",
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
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"cappyzawa/trim.nvim",
		opts = { ft_blocklist = { "markdown" } },
	},
	{ "axkirillov/hbac.nvim", config = true },
	{ "LhKipp/nvim-nu" },

	--    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
	{ import = "plugins" },
}, {})

-- vim: ts=2 sts=2 sw=2 et
