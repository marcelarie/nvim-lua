if pcall(require, "blame") then
	vim.api.nvim_create_user_command("GitBlameClassic", function()
		pcall(vim.cmd "BlameToggle window")
	end, {})
end

-- create a command to toggle the quickfix window
vim.api.nvim_create_user_command(
	"TSImportAll",
	typescript_server_import_all,
	{}
)

vim.api.nvim_create_user_command("ENV", function()
	local pickers = require "telescope.pickers"
	local finders = require "telescope.finders"
	local conf = require("telescope.config").values
	local actions = require "telescope.actions"
	local action_state = require "telescope.actions.state"

	-- Find all .env files (tracked, untracked, ignored)
	local handle = io.popen(
		"(fd -H -I -t f --glob '*.env*' && git ls-files --others --ignored --exclude-standard | grep '\\.env') | sort -u",
		"r"
	)
	if not handle then
		return
	end

	local result = handle:read "*all"
	handle:close()

	local files = {}
	for line in result:gmatch "[^\r\n]+" do
		table.insert(files, line)
	end

	if #files == 0 then
		vim.notify("No .env files found", vim.log.levels.WARN)
		return
	end

	-- Open Telescope picker
	pickers
		.new({}, {
			prompt_title = "Select .env file",
			finder = finders.new_table {
				results = files,
			},
			sorter = conf.generic_sorter {},
			attach_mappings = function(prompt_bufnr, map)
				map("i", "<CR>", function()
					local selection = action_state.get_selected_entry()
					actions.close(prompt_bufnr)
					if selection then
						vim.cmd("edit " .. selection[1])
					end
				end)
				return true
			end,
		})
		:find()
end, {})

-- Check ~/scripts/todos.sh and ~/scripts/find-todos.sh for more info
vim.api.nvim_create_user_command("Todo", function()
	-- If the Todo.md file exists in the current directory, open it
	local cwd = vim.fn.getcwd()
	local files = vim.fn.readdir(cwd)
	for _, file in ipairs(files) do
		if file:lower():match "^todo.*%.md$" then
			vim.cmd("vsplit " .. cwd .. "/" .. file)
			return
		end
	end

	-- if not, create a global todo file
	local date = os.date "%Y-%m-%d"
	local filename = string.format("~/notes/TODO:%s.md", date)
	vim.cmd("vsplit " .. filename)
end, {})

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
