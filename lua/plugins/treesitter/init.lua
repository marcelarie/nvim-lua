-------------------- TREE-SITTER ---------------------------
-- :TSInstall c bash html json css javascript php lua python regex rust typescript query
local ts = require "nvim-treesitter.configs"
local tsh = require "nvim-treesitter.highlight"

ts.setup {
	-- A list of parser names, or "all"
	-- ensure_installed = { "c", "lua", "rust" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	-- sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	-- List of parsers to ignore installing (for "all")
	-- ignore_install = { "javascript" },

	---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
	-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = {
			"org",
			"diff",
			"gitcommit",
		},
	},
	-- markid = { enable = true },
}

-- tsh.set_custom_captures {
-- 	-- Highlight the @foo.bar capture group with the "Identifier" highlight group.
-- 	["text.diff.add"] = "Identifier",
-- }
--

-- require("tree-sitter-just").setup {}

require("treesitter-context").setup {
	-- enable = true,
	-- max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
	-- trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
	-- patterns = {
	-- 	default = {
	-- 		"class",
	-- 		"function",
	-- 		"method",
	-- 		-- 'for', -- These won't appear in the context
	-- 		-- 'while', 'if', 'switch', 'case',
	-- 	},
	-- 	-- Example for a specific filetype.
	-- 	-- If a pattern is missing, *open a PR* so everyone can benefit.
	-- 	--   rust = {
	-- 	--       'impl_item',
	-- 	--   },
	-- },
}
