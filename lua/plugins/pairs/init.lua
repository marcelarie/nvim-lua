local fb = require "pairs.fallback"

local default_opts = {
	pairs = {
		["*"] = {
			{ "(", ")" },
			{ "[", "]" },
			{ "{", "}" },
			{ "'", "'" },
			{ '"', '"' },
		},
		lua = {
			{ "(", ")", { ignore = { "%(", "%)", "%%" } } },
			{ "[", "]", { ignore = { "%[", "%]", "%%" } } },
			{ "{", "}", { ignore = { "%{", "%}", "%%" } } },
		},
		python = {
			{ "'", "'", { triplet = true } },
			{ '"', '"', { triplet = true } },
		},
		markdown = {
			{ "`", "`", { triplet = true } },
		},
		tex = {
			{ "$", "$", { cross_line = true } },
			-- Chinese pairs
			{ "（", "）" },
			{ "【", "】" },
			{ "‘", "’" },
			{ "“", "”" },
		},
	},
	-- default_opts = {
	-- 	["*"] = {
	-- 		ignore_pre = "\\\\", -- double backslash or [[\\]]
	-- 		ignore_after = "\\w", -- double backslash or [[\w]]
	-- 	},
	-- 	lua = {
	-- 		ignore_pre = "[%\\\\]", -- double backslash
	-- 	},
	-- },
	-- delete = {
	-- 	enable_mapping = true,
	-- 	enable_cond = true,
	-- 	enable_fallback = fb.delete,
	-- 	empty_line = {
	-- 		enable_cond = true,
	-- 		enable_fallback = fb.delete,
	-- 		enable_sub = {
	-- 			start = true,
	-- 			inside_brackets = true,
	-- 			left_bracket = true,
	-- 			text_multi_line = true,
	-- 			text_delete_to_prev_indent = true,
	-- 		},
	-- 		trigger_indent_level = 1,
	-- 	},
	-- 	current_line = {
	-- 		enable_cond = true,
	-- 		enable_fallback = fb.delete,
	-- 	},
	-- },
	space = {
		enable_mapping = true,
		enable_cond = true,
		enable_fallback = fb.space,
	},
	enter = {
		enable_mapping = false,
		enable_cond = true,
		enable_fallback = fb.enter,
	},
	indent = {
		["*"] = 1,
		python = 2,
	},
	autojump_strategy = {
		unbalanced = "right", -- all, right, loose_right, none
	},
	mapping = {
		jump_left_in_any = "<m-[>",
		jump_right_out_any = "<m-]>",
		jump_left_out_any = "<m-{>",
		jump_right_in_any = "<m-}>",
	},
	-- max_search_lines = 100,
}

require("pairs"):setup(default_opts)
