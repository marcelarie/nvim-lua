if pcall(require, "blame") then
	vim.api.nvim_create_user_command("GitBlameClassic", function()
		pcall(vim.cmd "ToggleBlame window")
	end, {})
end

-- create a command to toggle the quickfix window
vim.api.nvim_create_user_command(
	"TSImportAll",
	typescript_server_import_all,
	{}
)

-- Check ~/scripts/todos.sh and ~/scripts/find-todos.sh for more info
vim.api.nvim_create_user_command(
	"Todo",
	function()
		local date = os.date("%d-%m-%Y")
		local filename = string.format("~/notes/TODO:%s.md", date)
		vim.cmd("vsplit " .. filename)
	end,
	{}
)

local print_harpoon_help = function()
	-- Create a new buffer for the popup window
	local buf = vim.api.nvim_create_buf(false, true)

	local text_lines = {
		" Harpoon is a file manager for Neovim. It allows you to quickly navigate",
		" between files in your project.",
		"",
		" Personal keybindings:",
		"",
		"	<Leader>ht -> Open Harpoon window",
		"	<Leader>hh -> Telescope Harpoon quick menu",
		"	<Leader>ha -> Add current file to Harpoon list",
		"",
		" More info in ./lua/plugins/harpoon.lua",
	}

	-- Set the lines in the buffer
	vim.api.nvim_buf_set_lines(buf, 0, -1, true, text_lines)

	-- Calculate the width of the longest line
	local max_width = 0
	for _, line in ipairs(text_lines) do
		max_width = math.max(max_width, #line)
	end

	-- Open a new floating window centered in the editor
	local opts = {
		relative = "editor",
		width = max_width + 1, -- Add some padding
		height = #text_lines,
		col = (vim.o.columns - max_width) / 2,
		row = (vim.o.lines - #text_lines) / 2,
		anchor = "NW",
		style = "minimal",
		border = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" },
		title = "Harpoon Help Menu",
		title_pos = "center",
	}

	vim.api.nvim_open_win(buf, true, opts)

	-- Set the specific window to close on q
	vim.keymap.set("n", "q", ":q<CR>", { buffer = buf })
end

vim.api.nvim_create_user_command("HarpoonHelp", print_harpoon_help, {})
