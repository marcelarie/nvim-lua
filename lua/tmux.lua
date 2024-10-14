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

vim.api.nvim_create_user_command("CargoRun", function()
	create_tmux_persistent_command "cargo run"
end, { desc = "Run cargo run in tmux window" })
--
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

--= GIT COMMANDS =--

vim.api.nvim_create_user_command("LazyGit", function()
	create_tmux_command "lazygit"
end, { desc = "Run git status in tmux window" })

--= MISC COMMANDS =--

-- vim.api.nvim_create_user_command("FindTodos", function()
-- 	create_quick_tmux_command "~/scripts/find-todos.sh"
-- end, { desc = "Run cargo test in tmux window" })
