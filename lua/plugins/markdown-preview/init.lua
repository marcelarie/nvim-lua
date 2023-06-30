---@diagnostic disable: undefined-global, lowercase-global

local v = vim
-- keybindings
-- v.api.nvim_set_keymap("n", "<Leader>mp", ":Glance<cr>", {})
v.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
v.api.nvim_create_user_command("PeekClose", require("peek").close, {})
v.api.nvim_set_keymap("n", "<Leader>mp", ":PeekOpen<cr>", {})
v.api.nvim_set_keymap("n", "<Leader>mc", ":PeekClose<cr>", {})

-- Markdown preview with glow
local function sanitize_shell_string(input)
	local gsub = input:gsub("'", "'\\''")
	return string.format("'%s'", gsub)
end

local ft = v.bo.filetype

local function markdown_preview_with_glow()
	if ft ~= "markdown" or ft ~= "telekasten" then
		print "Not a markdown file"
		return
	end

	local buf = v.api.nvim_create_buf(false, true)

	local current_buf = v.api.nvim_get_current_buf()
	local _current_win = v.api.nvim_get_current_win()

	local lines = v.api.nvim_buf_get_lines(current_buf, 0, -1, false)
	local markdown_text = table.concat(lines, "\n")
	local sanitized = sanitize_shell_string(markdown_text)

	v.cmd(string.format("rightbelow vert sbuffer %d", buf))

	local new_win = v.api.nvim_get_current_win()
	v.api.nvim_win_set_option(new_win, "number", false)
	v.api.nvim_win_set_option(new_win, "cursorline", false)
	v.api.nvim_win_set_option(new_win, "relativenumber", false)

	v.fn.termopen(string.format("glow <( echo %s)\n", sanitized))
end

v.keymap.set("n", "<leader>gl", markdown_preview_with_glow, {})
