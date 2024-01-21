local ag = vim.api.nvim_create_augroup
local au = vim.api.nvim_create_autocmd

-- GROUPS:
local yank_group = ag("YankHighlight", { clear = true })
local disable_node_modules_eslint_group =
	ag("DisableNodeModulesEslint", { clear = true })
local sh_filetype_group = ag("shFiletypeGroup", { clear = true })
local typ_filetype_group = ag("typFiletypeGroup", { clear = true })
local git_commit_auto_commands = ag("GitCommitAutoCommands", { clear = true })
local add_80_chars_on_markdown = ag("Add80CharsOnMarkdown", { clear = true })
local disable_diagnostics_on_markdown =
	ag("DisableDiagnosticsOnMarkdown", { clear = true })
local relative_numbers_insert_mode =
	ag("RelativeNumbersInsertModes", { clear = true })

-- FUNCTIONS:

-- AUTO-COMMANDS:
au("InsertEnter", {
	command = "set relativenumber",
	group = relative_numbers_insert_mode,
})

au("InsertLeave", {
	command = "set norelativenumber",
	group = relative_numbers_insert_mode,
})

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
		"*.envrc",
		"*.env.*",
		"sketchybarrc",
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
		-- "*.diff",
	},
	callback = function()
		-- vim.cmd("colorscheme catppuccin")
	end,
	group = git_commit_auto_commands,
})

au({ "BufNewFile", "BufRead" }, {
	pattern = { "*.md" },
	command = "setlocal textwidth=80",
	group = add_80_chars_on_markdown,
})

--not mine
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = "NvimTree*",
	callback = function()
		local api = require "nvim-tree.api"
		local view = require "nvim-tree.view"

		if not view.is_visible() then
			api.tree.open()
		end
	end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { ".myclirc" },
	command = "set filetype=toml",
})
