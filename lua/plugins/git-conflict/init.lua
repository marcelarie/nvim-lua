require("git-conflict").setup {
	default_mappings = true, -- disable buffer local mapping created by this plugin
	disable_diagnostics = true, -- This will disable the diagnostics in a buffer whilst it is conflicted

	-- They must have background color, otherwise the default color will be used
	highlights = {
		incoming = "DiffText",
		current = "DiffAdd",
	},
}

-- vim.api.nvim_create_autocmd("User", {
-- 	pattern = "GitConflictDetected",
-- 	callback = function()
-- 		vim.notify "Merge conflict detected."
-- 		-- vim.cmd "GitConflictListQf"
-- 	end,
-- })

-- git conflict quickfix
vim.keymap.set("n", "<Leader>cq", ":GitConflictListQf<cr>")
vim.keymap.set("n", "<Leader>cn", ":GitConflictNextConflict<cr>")
vim.keymap.set("n", "<Leader>cp", ":GitConflictPrevConflict<cr>")
