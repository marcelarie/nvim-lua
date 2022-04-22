---@diagnostic disable: undefined-global, lowercase-global

-- Packer setup
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

return require("packer").startup(function() -- Packer can manage itself as an optional plugin
	use({ "wbthomason/packer.nvim", opt = true })
	use({ "lewis6991/impatient.nvim", rocks = "mpack" })

	-- Colorschemes
	use({ "mrjones2014/lighthaus.nvim" })
	use("eddyekofo94/gruvbox-flat.nvim") -- <-- original

	-- Telescope
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-fzy-native.nvim")

	-- LSP
	use("neovim/nvim-lsp")
	use("onsails/lspkind-nvim")
	use("neovim/nvim-lspconfig")

	-- cmp
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
	use("quangnguyen30192/cmp-nvim-ultisnips")
	use("quangnguyen30192/cmp-nvim-tags")
	use("octaltree/cmp-look")
	use({ "tzachar/cmp-tabnine", run = "./install.sh" })
	use({ "~/clones/forks/null-ls.nvim" })

	use("tjdevries/lsp_extensions.nvim")
	use("simrat39/symbols-outline.nvim")

	-- use({ "github/copilot.vim" }) -- needed for the auth
	use({
		"zbirenbaum/copilot.lua",
		event = { "VimEnter" },
		config = function()
			vim.defer_fn(function()
				require("copilot").setup()
			end, 100)
		end,
	})

	-- Git
	use("tpope/vim-fugitive")
	use("lewis6991/gitsigns.nvim")
	use("f-person/git-blame.nvim")
	use("sindrets/diffview.nvim")

	-- TreeSitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/playground")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Startup time
	use("tweekmonster/startuptime.vim")

	-- Nvim tree
	use("kyazdani42/nvim-tree.lua")

	--  Snippets
	use("L3MON4D3/LuaSnip")
	use("honza/vim-snippets")
	use("thomasfaingnaert/vim-lsp-snippets")
	use("rafamadriz/friendly-snippets")

	-- Others
	use("hoob3rt/lualine.nvim")
	use("goolord/alpha-nvim")
	use("christoomey/vim-system-copy") -- System Copy
	use("norcalli/nvim-colorizer.lua") -- Colorizer
	use("tpope/vim-surround") -- Vim Surround
	use("numToStr/Comment.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("ryanoasis/vim-devicons")
	use("cappyzawa/trim.nvim")
	use("tversteeg/registers.nvim")
	use("folke/persistence.nvim")

	use("arkav/lualine-lsp-progress")
	use({
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	})
	use("kosayoda/nvim-lightbulb")
	use("folke/which-key.nvim")
	use("nathom/filetype.nvim")
	use({ "tami5/sqlite.lua", module = "sqlite" })
	use({ "farmergreg/vim-lastplace" })

	if packer_bootstrap then
		require("packer").sync()
	end
end)
