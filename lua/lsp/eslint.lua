--  NOTE: OLD ESLINT ↴

-- require("eslint").setup {
-- 	bin = "eslint_d",
-- 	code_actions = {
-- 		enable = true,
-- 		apply_on_save = {
-- 			enable = true,
-- 			types = { "problem" }, -- "directive", "problem", "suggestion", "layout"
-- 		},
-- 		disable_rule_comment = {
-- 			enable = true,
-- 			location = "separate_line", -- or `same_line`
-- 		},
-- 	},
-- 	diagnostics = {
-- 		enable = true,
-- 		-- report_unused_disable_directives = false,
-- 		run_on = "type", -- or `save`
-- 	},
-- }

-- NOTE: NEW ESLINT ↴

require("lspconfig").eslint.setup {
	codeAction = {
		disableRuleComment = {
			enable = true,
			location = "separateLine",
		},
		showDocumentation = {
			enable = true,
		},
	},
	codeActionOnSave = {
		enable = false,
		mode = "all",
	},
	experimental = {
		useFlatConfig = false,
	},
	format = true,
	nodePath = "",
	onIgnoredFiles = "off",
	packageManager = "npm",
	problems = {
		shortenToSingleLine = false,
	},
	quiet = false,
	rulesCustomizations = {},
	run = "onType",
	useESLintClass = false,
	validate = "on",
	workingDirectory = {
		mode = "location",
	},
}
