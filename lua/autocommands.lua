local ag = vim.api.nvim_create_augroup
local au = vim.api.nvim_create_autocmd

local yank_group = ag("YankHighlight", { clear = true })

au("TextYankPost", {
	command = "silent! lua vim.highlight.on_yank()",
	group = yank_group,
})

local disable_node_modules_eslint_group =
	ag("DisableNodeModulesEslint", { clear = true })

local disable_node_modules_eslint = function(bufnr)
	-- print "disable_node_modules_eslint"
	bufnr = bufnr or vim.api.nvim_get_current_buf()
	bufnr = tonumber(bufnr)
	vim.diagnostic.hide(nil, bufnr)
end

au({ "BufNewFile", "BufRead" }, {
	pattern = { "**/node_modules/**", "node_modules", "/node_modules/*" },
	callback = disable_node_modules_eslint,
	group = disable_node_modules_eslint_group,
})

local sh_filetype_group = ag("YankHighlight", { clear = true })
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
