return {
	"Piotr1215/beam.nvim",
	config = function()
		require("beam").setup {
			prefix = ",", -- Your prefix key (mini-leader)
			visual_feedback_duration = 150, -- ms to show selection
			clear_highlight = true, -- Clear search highlight after operation
			clear_highlight_delay = 500, -- ms before clearing
			cross_buffer = false, -- Enable cross-buffer operations
			auto_discover_text_objects = true, -- Auto-discover all available text objects
			show_discovery_notification = true, -- Show notification about discovered objects
			excluded_text_objects = {}, -- Exclude specific text objects (e.g., {'q', 'z'})
			excluded_motions = {}, -- Exclude specific motions (e.g., {'Q', 'R'})
		}
	end,
}
