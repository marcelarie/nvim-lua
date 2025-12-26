local tmux = require "tmux"

vim.api.nvim_create_user_command("CargoRun", function(opts)
	if opts.args then
		tmux.create_tmux_persistent_command("cargo run " .. opts.args)
		return
	end
	tmux.create_tmux_persistent_command "cargo run"
end, { desc = "Run cargo run in tmux window", nargs = "?" })

vim.keymap.set("n", "<leader>cr", function()
	tmux.create_tmux_persistent_command "cargo run"
end, {
	desc = "Run cargo run in tmux window",
	silent = true,
})

vim.api.nvim_create_user_command("CargoClippy", function()
	tmux.create_tmux_persistent_command "cargo clippy"
end, { desc = "Run cargo clippy in tmux window" })

vim.api.nvim_create_user_command("CargoTest", function()
	tmux.create_tmux_persistent_command "cargo test -- --show-output"
end, { desc = "Run cargo test in tmux window" })

vim.keymap.set("n", "<leader>ct", function()
	tmux.create_tmux_persistent_command "cargo test -- --show-output"
end, {
	desc = "Run cargo test in tmux window",
	silent = true,
})
