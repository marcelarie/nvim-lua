local ag = vim.api.nvim_create_augroup
local au = vim.api.nvim_create_autocmd

-- GROUPS:
local yank_group = ag("YankHighlight", { clear = true })
local disable_node_modules_eslint_group =
	ag("DisableNodeModulesEslint", { clear = true })
local sh_filetype_group = ag("YankHighlight", { clear = true })

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
