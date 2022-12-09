local ag = vim.api.nvim_create_augroup
local au = vim.api.nvim_create_autocmd

-- GROUPS:
local yank_group = ag("YankHighlight", { clear = true })
local disable_node_modules_eslint_group =
	ag("DisableNodeModulesEslint", { clear = true })
local sh_filetype_group = ag("YankHighlight", { clear = true })

-- FUNCTIONS:
local disable_node_modules_eslint = function(bufnr)
	vim.wait(100, function()
		vim.diagnostic.hide(nil, bufnr.id)
	end, 100)
end

-- AUTO-COMMANDS:
au("TextYankPost", {
	command = "silent! lua vim.highlight.on_yank()",
	group = yank_group,
})

au({ "BufNewFile", "BufRead" }, {
	pattern = { "**/node_modules/**", "node_modules", "/node_modules/*" },
	callback = disable_node_modules_eslint,
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
