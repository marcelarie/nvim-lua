return {
	"rmagatti/auto-session",
	-- Lazy load session management
	-- cmd = { "SessionSave", "SessionRestore", "SessionDelete", "Autosession" },
	lazy = false,
	-- enabled = false,
	config = function()
		require("auto-session").setup {
			log_level = "error",
			auto_session_enabled = false,
			auto_save_enabled = false,
			pre_save_cmds = {
				function()
					require("dart").write_auto_session()
				end,
			},
			post_restore_cmds = {
				function()
					require("dart").read_auto_session()
				end,
				function()
					-- Restore quickfix after session to prevent corruption
					vim.schedule(function()
						require("features.persistend-qfl").QfLoad({ open = false })
					end)
				end,
			},
			auto_session_suppress_dirs = {
				"~/",
				"~/Downloads",
				"/",
			},
		}
	end,
}
