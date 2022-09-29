require("trevj").setup()

vim.keymap.set("n", "<leader>j", function()
	require("trevj").format_at_cursor()
end)
