require("nvim-highlight-colors").setup {
	-- render = "background", -- or 'foreground' or 'first_column'
	-- enable_tailwind = false,
}

vim.keymap.set("n", "<leader>ct", function()
	require("nvim-highlight-colors").toggle()
end, { silent = true })
