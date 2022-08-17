local options = {
	-- log_level = "info",
	-- auto_session_enable_last_session = true,
	-- auto_session_root_dir = vim.fn.stdpath "data" .. "/sessions/",
	-- auto_session_enabled = true,
	auto_save_enabled = true,
	auto_restore_enabled = false,
	-- auto_session_suppress_dirs = nil,
}

vim.api.nvim_set_keymap(
	"n",
	"<Leader>se",
	":SearchSession<cr>",
	{ noremap = true, silent = true }
)

require("auto-session").setup(options)

require("session-lens").setup {
	-- path_display = { "shorten" },
	theme_conf = { border = false },
	-- previewer = true,
}
