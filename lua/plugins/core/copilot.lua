return {
	"zbirenbaum/copilot.lua",
	-- Defer loading to improve startup
	enabled = false,
	event = "InsertEnter",
	cmd = "Copilot",
	opts = {
		suggestion = {
			enabled = false,
			auto_trigger = false,
		},
	},
}
