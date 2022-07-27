require("lsp_lines").setup()

vim.keymap.set("n", "<Leader>dd", function()
	require("lsp_lines").toggle()
	local virtual_lines_are_enabled = vim.diagnostic.config().virtual_lines
		== true

	local config = virtual_lines_are_enabled and Disable_lsp_virtual_text()
		or Enable_lsp_virtual_text()

	Lsp_diagnostic_toggle_with_message(config)
end, {
	desc = "Toggle lsp_lines and virtual text",
	noremap = true,
	silent = false,
})
