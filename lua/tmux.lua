local function inside_tmux_session()
	if vim.fn.exists "$TMUX" == 0 then
		vim.api.nvim_err_writeln "Not inside tmux"
		return false
	end
	return true
end

local function create_tmux_persistent_command(command)
	if not inside_tmux_session() then
		return
	end

	local tmux_command = string.format("tmux new-window '%s; read'", command)

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

--= GIT COMMANDS =--

vim.api.nvim_create_user_command("LazyGit", function()
	create_tmux_command "lazygit"
end, { desc = "Run git status in tmux window" })

--= MISC COMMANDS =--

-- vim.api.nvim_create_user_command("FindTodos", function()
-- 	create_quick_tmux_command "~/scripts/find-todos.sh"
-- end, { desc = "Run cargo test in tmux window" })
