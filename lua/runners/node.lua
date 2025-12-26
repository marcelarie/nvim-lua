local tmux = require "tmux"

-- vitest
vim.api.nvim_create_user_command("Vitest", function()
	tmux.create_tmux_persistent_command "npm run test %"
end, { desc = "Run vitest of current file in tmux window" })

vim.keymap.set("n", "<leader>vt", function()
	tmux.create_tmux_persistent_command "npm run test %"
end, {
	desc = "Run vitest of current file in tmux window",
	silent = true,
})
