require("eslint").setup {
	bin = "eslint_d",
	code_actions = {
		enable = false,
		apply_on_save = {
			enable = false,
			types = { "problem" }, -- "directive", "problem", "suggestion", "layout"
		},
		disable_rule_comment = {
			enable = true,
			location = "separate_line", -- or `same_line`
		},
	},
	diagnostics = {
		enable = true,
		-- report_unused_disable_directives = false,
		run_on = "save", -- or `save`
	},
}
