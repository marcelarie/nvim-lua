-- vim.cmd("au BufEnter * NeoRoot")

local NOREF_NOERR_TRUNC = { noremap = true, silent = true, nowait = true }

vim.keymap.set("n", "<Leader>cd", function()
	vim.cmd "NeoRootSwitchMode"
end, NOREF_NOERR_TRUNC)

-- vim.keymap.set("n", "<Leader>p", function()
-- 	vim.cmd("NeoRootSwitchMode")
-- end, NOREF_NOERR_TRUNC)

vim.keymap.set("n", "<Leader>pre", function()
	vim.cmd "NeoRootChange"
end, NOREF_NOERR_TRUNC)
