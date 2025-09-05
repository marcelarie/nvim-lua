local function inside_tmux_session()
	if vim.fn.exists "$TMUX" == 0 then
		vim.api.nvim_err_writeln "Not inside tmux"
		return false
	end
	return true
end

local line = 1

local function create_tmux_persistent_command(command)
	if not inside_tmux_session() then
		return
	end

	local tmux_command = string.format("tmux new-window '%s; read'", command)

	vim.cmd("silent !" .. tmux_command)
end

local function create_tmux_split_command(command)
	if not inside_tmux_session() then
		return
	end
	local tmux_command = string.format("tmux split-window -h '%s'", command)
	vim.cmd("silent !" .. tmux_command)
end

local function create_tmux_command(command)
	if not inside_tmux_session() then
		return
	end

	local tmux_command = string.format("tmux new-window '%s'", command)

	vim.cmd("silent !" .. tmux_command)
end

--= CARGO COMMANDS =--

vim.api.nvim_create_user_command("CargoRun", function(opts)
	if opts.args then
		create_tmux_persistent_command("cargo run " .. opts.args)
		return
	end
	create_tmux_persistent_command "cargo run"
end, { desc = "Run cargo run in tmux window", nargs = "?" })

vim.keymap.set("n", "<leader>cr", function()
	create_tmux_persistent_command "cargo run"
end, {
	desc = "Run cargo run in tmux window",
	silent = true,
})

vim.api.nvim_create_user_command("CargoClippy", function()
	create_tmux_persistent_command "cargo clippy"
end, { desc = "Run cargo clippy in tmux window" })

vim.api.nvim_create_user_command("CargoTest", function()
	create_tmux_persistent_command "cargo test -- --show-output"
end, { desc = "Run cargo test in tmux window" })

vim.keymap.set("n", "<leader>ct", function()
	create_tmux_persistent_command "cargo test -- --show-output"
end, {
	desc = "Run cargo test in tmux window",
	silent = true,
})

-- vitest

vim.api.nvim_create_user_command("Vitest", function()
	create_tmux_persistent_command "npm run test %"
end, { desc = "Run vitest of current file in tmux window" })

vim.keymap.set("n", "<leader>vt", function()
	create_tmux_persistent_command "npm run test %"
end, {
	desc = "Run vitest of current file in tmux window",
	silent = true,
})

--= JUST COMMANDS =--

vim.api.nvim_create_user_command("JustRun", function()
	create_tmux_persistent_command "just run"
end, { desc = "Run just run in tmux window" })

-- create just command that accept arguments
vim.api.nvim_create_user_command("Just", function(opts)
	if opts.args then
		create_tmux_persistent_command("just " .. opts.args)
		return
	end
	create_tmux_persistent_command "just"
end, { desc = "Run just in tmux window", nargs = "?" })

vim.api.nvim_create_user_command("Rgr", function(opts)
	if opts.args then
		create_tmux_persistent_command("rgr " .. opts.args)
		return
	end
	create_tmux_persistent_command "rgr"
end, { desc = "Search and replace with rgr", nargs = "?" })

vim.keymap.set("n", "<leader>jr", function()
	create_tmux_persistent_command "just run"
end, {
	desc = "Run just run in tmux window",
	silent = true,
})

vim.api.nvim_create_user_command("JustBuild", function()
	create_tmux_persistent_command "just build"
end, { desc = "Run just build in tmux window" })

vim.keymap.set("n", "<leader>jb", function()
	create_tmux_persistent_command "just build"
end, {
	desc = "Run just build in tmux window",
	silent = true,
})

vim.api.nvim_create_user_command("JustTest", function()
	create_tmux_persistent_command "just test"
end, { desc = "Run just test in tmux window" })

vim.keymap.set("n", "<leader>jt", function()
	create_tmux_persistent_command "just test"
end, {
	desc = "Run just test in tmux window",
	silent = true,
})

--= TESTS RUNNER =--
local function get_rust_test_under_cursor()
	local current_line_num = vim.api.nvim_win_get_cursor(0)[1]
	local current_line = vim.api.nvim_get_current_line()
	
	local test_name = current_line:match("fn ([%w_]+)")
	if test_name then
		for i = current_line_num - 1, math.max(1, current_line_num - 5), -1 do
			local line = vim.api.nvim_buf_get_lines(0, i - 1, i, false)[1]
			if line and line:match("#%[test%]") then
				return test_name
			end
		end
	end
	
	return nil
end

local function RunFileTests()
	local fname = vim.fn.expand "%:t"
	local filepath = vim.fn.expand "%:p"
	local filestem = vim.fn.expand "%:p:r"
	local ext = vim.fn.expand "%:e"

	if ext == "rs" then
		local specific_test = get_rust_test_under_cursor()
		local test_target = specific_test or vim.fn.expand "%:t:r"
		local cmd = string.format("direnv exec . cargo test %s -- --show-output", test_target)
		create_tmux_persistent_command(cmd)
	elseif ext == "js" or ext == "ts" or ext == "jsx" or ext == "tsx" then
		if fname:match("%.tests?%." .. ext .. "$") then
			create_tmux_persistent_command("npm run test " .. filepath)
		else
			local basename = vim.fn.expand "%:t:r"
			local dir = vim.fn.expand "%:p:h"
			local candidates = {
				dir .. "/" .. basename .. ".test." .. ext,
				dir .. "/" .. basename .. ".tests." .. ext,
				dir .. "/tests/" .. basename .. ".test." .. ext,
				dir .. "/tests/" .. basename .. ".tests." .. ext,
				dir
					.. "/"
					.. basename
					.. "/tests/"
					.. basename
					.. ".test."
					.. ext,
				dir
					.. "/"
					.. basename
					.. "/tests/"
					.. basename
					.. ".tests."
					.. ext,
			}
			local test_file
			for _, path in ipairs(candidates) do
				if vim.fn.filereadable(path) == 1 then
					test_file = path
					break
				end
			end
			if not test_file then
				test_file = candidates[#candidates]
			end
			create_tmux_persistent_command("npm run test " .. test_file)
		end
	elseif ext == "py" then
		local project_root = vim.fn.getcwd()
		local root_esc = vim.fn.shellescape(project_root)
		local docker_cmd = "cd "
			.. root_esc
			.. " && docker build -f test.Dockerfile -t test-runner . && docker run --rm --env-file "
			.. vim.fn.shellescape "ENV/test.env"
			.. " test-runner python -m pytest -c ./pytest.ini"

		if fname == "conftest.py" then
			local dir = vim.fn.expand "%:p:h"
			local relative_dir = string.gsub(
				dir,
				"^" .. project_root:gsub("([^%w])", "%%%1") .. "/",
				""
			)
			if relative_dir == "" then
				relative_dir = "."
			end
			local cmd = docker_cmd
				.. " "
				.. vim.fn.shellescape(relative_dir)
				.. " -vv"
			create_tmux_persistent_command(cmd)
		else
			local relative_file = string.gsub(
				vim.fn.expand "%:p",
				"^" .. project_root:gsub("([^%w])", "%%%1") .. "/",
				""
			)
			local cmd = docker_cmd
				.. " "
				.. vim.fn.shellescape(relative_file)
				.. " -vv"
			create_tmux_persistent_command(cmd)
		end
	else
		print "RunTests: unsupported filetype"
	end
end

vim.api.nvim_create_user_command(
	"RunTests",
	RunFileTests,
	{ desc = "Run tests for current file in tmux window", nargs = 0 }
)

vim.keymap.set(
	"n",
	"<leader>rt",
	RunFileTests,
	{ desc = "Run tests for current file", silent = true }
)

local line = 1

--= GIT COMMANDS =--

vim.api.nvim_create_user_command("LazyGit", function()
	create_tmux_command "lazygit"
end, { desc = "Run git status in tmux window" })

--= MISC COMMANDS =--

vim.api.nvim_create_user_command("FindTodos", function()
	create_tmux_command "~/scripts/find-todos.sh"
end, { desc = "Run ftodos" })

vim.api.nvim_create_user_command("FindTodosSplit", function()
	create_tmux_split_command "~/scripts/find-todos.sh"
end, { desc = "Run ftodos in a split" })
