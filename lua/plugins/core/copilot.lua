return {
	"zbirenbaum/copilot.lua",
	-- Defer loading to improve startup
	event = { "BufReadPost", "BufNewFile" },
	cmd = "Copilot",
	opts = {
		suggestion = {
			enabled = false,
			auto_trigger = false,
		}
	},
}
