local palettes = {
	all = {
		-- Each palette defines these colors:
		--   black, red, green, yellow, blue, magenta, cyan, white, orange, pink
		bg3 = "#222222", -- Lighter bg (cursor line)
		bg2 = "#111111", -- Conceal, border fg
	},
	-- nightfox = {
	--   -- A specific style's value will be used over the `all`'s value
	--   red = "#c94f6d",
	-- },
	-- dayfox = {
	--   -- Defining multiple shades is done by passing a table
	--   blue = { base = "#4d688e", bright = "#4e75aa", dim = "#485e7d" },
	-- },
	-- nordfox = {
	--   -- A palette also defines the following:
	--   --   bg0, bg1, bg2, bg3, bg4, fg0, fg1, fg2, fg3, sel0, sel1, comment
	--   --
	--   -- These are the different foreground and background shades used by the theme.
	--   -- The base bg and fg is 1, 0 is normally the dark alternative. The others are
	--   -- incrementally lighter versions.
	--   bg1 = "#2e3440",
	--
	--   -- sel is different types of selection colors.
	--   sel0 = "#3e4a5b", -- Popup bg, visual selection bg
	--   sel1 = "#4f6074", -- Popup sel bg, search bg
	--
	--   -- comment is the definition of the comment color.
	--   comment = "#60728a",
	-- },
}

-- Default options
require("nightfox").setup {
	options = {
		-- Compiled file's destination location
		compile_path = vim.fn.stdpath "cache" .. "/nightfox",
		compile_file_suffix = "_compiled", -- Compiled file suffix
		transparent = true, -- Disable setting background
		terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
		dim_inactive = false, -- Non focused panes set to alternative background
		module_default = true, -- Default enable value for modules
		styles = {
			-- Style to be applied to different syntax groups
			comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
			conditionals = "NONE",
			constants = "NONE",
			functions = "NONE",
			keywords = "NONE",
			numbers = "NONE",
			operators = "NONE",
			strings = "NONE",
			types = "NONE",
			variables = "NONE",
		},
		inverse = {
			-- Inverse highlight for different types
			match_paren = false,
			visual = false,
			search = false,
		},
		modules = { -- List of various plugins and additional options
			-- ...
		},
	},
	palettes = palettes,
	-- specs = {},
	-- groups = {},
}

-- setup must be called before loading
vim.cmd "colorscheme terafox"
