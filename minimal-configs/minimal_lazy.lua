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
		{ "mrjones2014/lighthaus.nvim" },
		"phanviet/vim-monokai-pro",
		"mhartington/oceanic-next",
		"fenetikm/falcon",
		"katawful/kat.nvim",
		"rebelot/kanagawa.nvim",
		{ "shaunsingh/oxocarbon.nvim", run = "./install.sh" },
		{ "catppuccin/nvim", as = "catppuccin" },
		{ "projekt0n/github-nvim-theme", tag = "v0.0.7" },
		{

			"jhchabran/monarized",
			config = function()
				vim.g.monarized_lualine = true
				vim.g.monarized_kitty_colors = true
			end,
		},
		"EdenEast/nightfox.nvim",
		{ "shaeinst/roshnivim-cs" },
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
			requires = {
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
}

require("lazy").setup(plugins, {
	root = root .. "/plugins",
})

vim.cmd("colorscheme catppuccin")
