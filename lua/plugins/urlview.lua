return {
	"axieax/urlview.nvim",
	config = function()
		local opts = {
			-- Prompt title (`<context> <default_title>`, e.g. `Buffer Links:`)
			default_title = "Links:",
			-- Default picker to display links with
			-- Options: "native" (vim.ui.select) or "telescope"
			default_picker = "telescope",
			-- Set the default protocol for us to prefix URLs with if they don't start with http/https
			default_prefix = "https://",
			-- Command or method to open links with
			-- Options: "netrw", "system" (default OS browser), "clipboard"; or "firefox", "chromium" etc.
			-- By default, this is "netrw", or "system" if netrw is disabled
			default_action = "firefox",
			-- Set the register to use when yanking
			-- Default: + (system clipboard)
			default_register = "+",
			-- Whether plugin URLs should link to the branch used by your package manager
			default_include_branch = false,
			-- Ensure links shown in the picker are unique (no duplicates)
			unique = true,
			-- Ensure links shown in the picker are sorted alphabetically
			sorted = true,
			-- Minimum log level (recommended at least `vim.log.levels.WARN` for error detection warnings)
			log_level_min = vim.log.levels.INFO,
			-- Keymaps for jumping to previous / next URL in buffer
			jump = {
				prev = "[u",
				next = "]u",
			},
		}

		require("urlview").setup(opts)

		vim.keymap.set("n", "<leader>u", "<cmd>UrlView<cr>")
		vim.keymap.set("n", "<leader>ul", "<cmd>UrlView lazy<cr>")
	end,
}
