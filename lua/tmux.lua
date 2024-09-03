local function create_tmux_command_window(command)
	local tmux_command = string.format("tmux new-window '%s; read'", command)

	vim.cmd("silent !" .. tmux_command)
end

-- local function create_quick_tmux_command(command)
-- 	local tmux_command = string.format("tmux new-window '%s;'", command)
--
-- 	vim.cmd("silent !" .. tmux_command)
-- end

--= CARGO COMMANDS =--

vim.api.nvim_create_user_command("CargoRun", function()
	create_tmux_command_window "cargo run"
end, { desc = "Run cargo run in tmux window" })
--
vim.keymap.set("n", "<leader>cr", function()
	create_tmux_command_window "cargo run"
end, {
	desc = "Run cargo run in tmux window",
	silent = true,
})

vim.api.nvim_create_user_command("CargoClippy", function()
	create_tmux_command_window "cargo clippy"
end, { desc = "Run cargo clippy in tmux window" })

vim.api.nvim_create_user_command("CargoTest", function()
	create_tmux_command_window "cargo test"
end, { desc = "Run cargo test in tmux window" })

-- vim.api.nvim_create_user_command("FindTodos", function()
-- 	create_quick_tmux_command "~/scripts/find-todos.sh"
-- end, { desc = "Run cargo test in tmux window" })
