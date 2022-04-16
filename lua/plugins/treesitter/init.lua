-------------------- TREE-SITTER ---------------------------
-- :TSInstall c bash html json css javascript php lua python regex rust typescript query
local ts = require("nvim-treesitter.configs")
-- ts.setup {ensure_installed = 'maintained', highlight = {enable = true}}

local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

parser_configs.norg = {
	install_info = {
		url = "https://github.com/nvim-neorg/tree-sitter-norg",
		files = { "src/parser.c", "src/scanner.cc" },
		branch = "main",
	},
}

ts.setup({
	ignore_install = { "teal", "astro" },
	highlight = {
		enable = true,
		-- disable = { "perl" },
		custom_captures = {
			-- Highlight the @foo.bar capture group with the "Identifier" highlight group
			["foo.bar"] = "Identifier",
		},
	},
	autotag = { enable = true },
	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
		keybindings = {
			toggle_query_editor = "o",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			toggle_language_display = "I",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<cr>",
			show_help = "?",
		},
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	context_commentstring = { enable = true },
	indent = { enable = true },
	move = {
		enable = true,
		set_jumps = true, -- whether to set jumps in the jumplist
		goto_next_start = { ["]m"] = "@function.outer", ["]]"] = "@class.outer" },
		goto_next_end = { ["]M"] = "@function.outer", ["]["] = "@class.outer" },
		goto_previous_start = {
			["[m"] = "@function.outer",
			["[["] = "@class.outer",
		},
		goto_previous_end = {
			["[M"] = "@function.outer",
			["[]"] = "@class.outer",
		},
	},
	endwise = {
		enable = true,
	},
	textobjects = {
		lsp_interop = {
			enable = true,
			peek_definition_code = {
				["df"] = "@function.outer",
				["dF"] = "@class.outer",
			},
		},
		swap = {
			enable = true,
			swap_next = { ["<leader>n"] = "@parameter.inner" },
			swap_previous = { ["<leader>N"] = "@parameter.inner" },
		},
		select = {
			enable = true,

			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,

			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",

				-- Or you can define your own textobjects like this
				["iF"] = {
					python = "(function_definition) @function",
					cpp = "(function_definition) @function",
					c = "(function_definition) @function",
					java = "(method_declaration) @function",
				},
			},
		},
	},
})

-- local parser_config = require'nvim-treesitter.parsers'.get_parser_configs()
-- parser_config.perl = {
-- install_info = {
-- url = 'https://github.com/ganezdragon/tree-sitter-perl',
-- files = {'src/parser.c'}
-- },
-- filetype = 'perl',
-- used_by = {'pm', 'pl', 't'}
-- }
