return {
	"rmagatti/auto-session",
	-- enabled = false,
	config = function()
		require("auto-session").setup {
			log_level = "error",
			auto_session_enabled = false,
			auto_save_enabled = true,
			auto_session_suppress_dirs = {
				"~/",
				"~/Downloads",
				"/",
			},
		}
	end,
}
