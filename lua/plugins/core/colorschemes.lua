return {
	-- Commented out unused colorschemes to improve startup time
	-- Uncomment only the ones you want to use

	-- "Verf/deepwhite.nvim",
	-- "aliqyan-21/darkvoid.nvim",
	-- "slugbyte/lackluster.nvim",
	-- "mrjones2014/lighthaus.nvim",
	-- "sample-usr/rakis.nvim",
	-- "NLKNguyen/papercolor-theme",
	-- "agude/vim-eldar",
	-- "habamax/vim-colors-defnoche",
	-- "itchyny/landscape.vim",
	-- "catppuccin/nvim",
	-- "ayu-theme/ayu-vim",
	-- "savq/melange-nvim",
	-- "aktersnurra/no-clown-fiesta.nvim",
	-- "p00f/alabaster.nvim",

	-- Keep citruszest (mentioned in your favorites)
	{
		"zootedb0t/citruszest.nvim",
		lazy = true, -- Changed to lazy load
		priority = 1000,
	},

	-- "cvigilv/patana.nvim",

	-- Keep apprentice (mentioned in your favorites)
	{
		"adisen99/apprentice.nvim",
		dependencies = { "rktjmp/lush.nvim" },
		lazy = true,
	},

	-- "samharju/serene.nvim",
	-- "nyoom-engineering/oxocarbon.nvim",
	-- "zaki/zazen",

	-- Keep zenbones (forestbones mentioned in favorites)
	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = true, -- Changed to lazy load
		priority = 1000,
	},

	-- "andreasvc/vim-256noir",
	-- "t184256/vim-boring",
	-- "jaredgorski/Mies.vim",

	-- Keep naysayer (no-clown-fiesta alternative)
	-- {
	-- 	"alljokecake/naysayer-theme.nvim",
	-- 	name = "naysayer",
	-- 	lazy = true,
	-- 	config = function()
	-- 		require("naysayer").setup {
	-- 			variant = "main",
	-- 			dark_variant = "main",
	-- 			bold_vert_split = false,
	-- 			dim_nc_background = false,
	-- 			disable_background = true,
	-- 			disable_float_background = true,
	-- 			disable_italics = true,
	-- 		}
	-- 	end,
	-- },

	-- Keep makurai
	-- {
	-- 	"Skardyy/makurai-nvim",
	-- 	lazy = true,
	-- 	config = function()
	-- 		require("makurai").setup {
	-- 			transparent = true,
	-- 		}
	-- 	end,
	-- },

	-- "ryanpcmcquen/true-monochrome_vim",

	-- Keep falcon (mentioned in your favorites)
	-- "fenetikm/falcon",
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
