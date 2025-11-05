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

local function ConflictsQF()
	local out = vim.fn.systemlist("git grep -n -E '^<<<<<<< '")
	local qf = {}
	for _, l in ipairs(out) do
		local f, ln, text = l:match "([^:]+):(%d+):(.*)"
		if f and ln then
			table.insert(
				qf,
				{ filename = f, lnum = tonumber(ln), col = 1, text = text }
			)
		end
	end
	vim.fn.setqflist(qf, "r")
	local current_win = vim.api.nvim_get_current_win()
	if #qf > 0 then
		vim.cmd "cfirst"
	end
	vim.cmd "copen"
	if vim.api.nvim_win_is_valid(current_win) then
		vim.api.nvim_set_current_win(current_win)
	end
end

vim.api.nvim_create_user_command("ConflictsQF", ConflictsQF, {})

vim.api.nvim_create_user_command("ENV", function()
	-- Check if ./ENV directory exists
	if vim.fn.isdirectory "./ENV" == 0 then
		vim.notify("No ./ENV directory found", vim.log.levels.WARN)
		return
	end

	-- Use snacks picker to show files in ./ENV directory
	require("snacks").picker.pick("files", {
		cwd = "./ENV",
	})
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

vim.api.nvim_create_user_command("UUIDGEN", function()
	local uuid = vim.fn.system("uuidgen"):gsub("\n", "")
	vim.api.nvim_put({ uuid }, "", true, true)
end, { desc = "Insert UUID at cursor" })

vim.api.nvim_create_user_command("HarpoonHelp", print_harpoon_help, {})
