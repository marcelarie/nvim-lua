require("gitlinker").setup {
	mappings = nil,
}

vim.keymap.set("n", "<leader>gy", function()
	require("gitlinker").get_buf_range_url(
		"n",
		{} -- { action_callback = require("gitlinker.actions").open_in_browser }
	)
end, { silent = true })

vim.keymap.set("v", "<leader>gy", function()
	require("gitlinker").get_buf_range_url(
		"v",
		{} -- { action_callback = require("gitlinker.actions").open_in_browser }
	)
end, {})
