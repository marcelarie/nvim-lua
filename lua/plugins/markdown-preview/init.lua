-- keybindings
-- vim.api.nvim_set_keymap("n", "<Leader>mp", ":Glance<cr>", {})
vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
vim.api.nvim_set_keymap("n", "<Leader>mp", ":PeekOpen<cr>", {})
vim.api.nvim_set_keymap("n", "<Leader>mc", ":PeekClose<cr>", {})

-- Markdown preview with glow
local function sanitize_shell_string(input)
	local gsub = input:gsub("'", "'\\''")
	return string.format("'%s'", gsub)
end

local function markdown_preview_with_glow()
	if vim.bo.filetype ~= "markdown" then
		print "Not a markdown file"
		return
	end

	local buf = vim.api.nvim_create_buf(false, true)

	local current_buf = vim.api.nvim_get_current_buf()
	local current_win = vim.api.nvim_get_current_win()

	local lines = vim.api.nvim_buf_get_lines(current_buf, 0, -1, false)
	local markdown_text = table.concat(lines, "\n")
	local sanitized = sanitize_shell_string(markdown_text)

	vim.cmd(string.format("rightbelow vert sbuffer %d", buf))

	local new_win = vim.api.nvim_get_current_win()
	vim.api.nvim_win_set_option(new_win, "number", false)
	vim.api.nvim_win_set_option(new_win, "cursorline", false)
	vim.api.nvim_win_set_option(new_win, "relativenumber", false)

	vim.fn.termopen(string.format("glow <( echo %s)\n", sanitized))
end

vim.keymap.set("n", "<leader>gl", markdown_preview_with_glow, {})
