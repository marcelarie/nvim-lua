local ag = vim.api.nvim_create_augroup
local au = vim.api.nvim_create_autocmd

-- GROUPS:
local yank_group = ag("YankHighlight", { clear = true })
local disable_node_modules_eslint_group =
	ag("DisableNodeModulesEslint", { clear = true })
local sh_filetype_group = ag("shFiletypeGroup", { clear = true })
local typ_filetype_group = ag("typFiletypeGroup", { clear = true })
local additional_vim_regex_highlighting =
	ag("AdditionalVimRegexHighlighting", { clear = true })
local add_80_chars_on_markdown = ag("Add80CharsOnMarkdown", { clear = true })

-- FUNCTIONS:

-- AUTO-COMMANDS:
au("TextYankPost", {
	command = "silent! lua vim.highlight.on_yank()",
	group = yank_group,
})

au({ "BufNewFile", "BufRead" }, {
	pattern = { "**/node_modules/**", "node_modules", "/node_modules/*" },
	callback = function()
		vim.diagnostic.disable(0)
	end,
	group = disable_node_modules_eslint_group,
})

au({ "BufNewFile", "BufRead" }, {
	pattern = {
		"*.sh",
		"*.zsh",
		"*.bash",
		"*bashrc",
		"*zshrc",
		"*_aliases",
		"*.env",
	},
	command = "set filetype=sh",
	group = sh_filetype_group,
})

au({ "BufNewFile", "BufRead" }, {
	pattern = { "*.typ" },
	command = "set filetype=typ",
	group = typ_filetype_group,
})

au({ "BufNewFile", "BufRead" }, {
	pattern = {
		"gitcommit",
		"*.diff",
	},
	callback = function()
		-- vim.cmd("colorscheme catppuccin")
	end,
	group = additional_vim_regex_highlighting,
})

au({ "BufNewFile", "BufRead" }, {
	pattern = { "*.md" },
	command = "setlocal textwidth=80",
	group = add_80_chars_on_markdown,
})
