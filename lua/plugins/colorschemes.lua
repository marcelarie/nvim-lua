return {
	"Verf/deepwhite.nvim",
	"aliqyan-21/darkvoid.nvim",
	"slugbyte/lackluster.nvim",
	"mrjones2014/lighthaus.nvim",
	"sample-usr/rakis.nvim",
	"NLKNguyen/papercolor-theme",
	"agude/vim-eldar",
	"habamax/vim-colors-defnoche",
	"itchyny/landscape.vim",
	"catppuccin/nvim",
	"ayu-theme/ayu-vim",
	"savq/melange-nvim",
	-- "aktersnurra/no-clown-fiesta.nvim",
	"p00f/alabaster.nvim",
	{
		"zootedb0t/citruszest.nvim",
		lazy = false,
		priority = 1000,
	},
	"cvigilv/patana.nvim",
	{
		"adisen99/apprentice.nvim",
		dependencies = { "rktjmp/lush.nvim" },
	},
	"samharju/serene.nvim",
	"nyoom-engineering/oxocarbon.nvim",
	"zaki/zazen",
	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
	},
	-- {
	-- 	"matthewmturner/tuscany",
	-- 	opts = {
	-- 		variant = "tuscany-night",
	-- 	},
	-- },
	"andreasvc/vim-256noir",
	"t184256/vim-boring",
	"jaredgorski/Mies.vim",
	{
		"alljokecake/naysayer-theme.nvim",
		name = "naysayer",
		config = function()
			require("naysayer").setup {
				variant = "main",
				dark_variant = "main",
				bold_vert_split = false,
				dim_nc_background = false,
				disable_background = true,
				disable_float_background = true,
				disable_italics = true,
			}
		end,
	},
	{
		"Skardyy/makurai-nvim",
		config = function()
			-- you don't have to call setup
			require("makurai").setup {
				transparent = true, -- removes the bg color
			}
		end,
	},
	"ryanpcmcquen/true-monochrome_vim",
	-- "lifepillar/vim-gruvbox8",
	-- "mrjones2014/lighthaus.nvim",
	-- "phanviet/vim-monokai-pro",
	-- "mhartington/oceanic-next",
	"fenetikm/falcon",
	-- "katawful/kat.nvim",
	-- "rebelot/kanagawa.nvim", -- has own config in ./kanagawa.lua
	-- "zootedb0t/citruszest.nvim",
	-- "EdenEast/nightfox.nvim",
	-- "shaeinst/roshnivim-cs",
	-- "npxbr/gruvbox.nvim",
	-- "eddyekofo94/gruvbox-flat.nvim",
	-- "rktjmp/lush.nvim",
	-- "savq/melange",
	-- "ishan9299/modus-theme-vim",
	-- "ishan9299/nvim-solarized-lua",
	-- "nyoom-engineering/oxocarbon.nvim",
	-- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	-- { "projekt0n/github-nvim-theme", priority = 1000 },
	-- "jhchabran/monarized",
}
