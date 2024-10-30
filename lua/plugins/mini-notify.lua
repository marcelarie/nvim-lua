return {
	"echasnovski/mini.notify",
	version = "*",
	config = function()
		local notify_filter = function(notif_arr)
			local filter = function(notif)
				if notif.msg:match "^rust[_-]analyzer:?%s" then
					return notif.msg:match "Indexing "
				end
				-- Keep others
				return true
			end
			notif_arr = vim.tbl_filter(filter, notif_arr)
			---@diagnostic disable-next-line: undefined-global
			return MiniNotify.default_sort(notif_arr)
		end

		local opts = {
			-- Content management
			content = {
				-- Function which formats the notification message
				-- By default prepends message with notification time
				format = nil,

				-- Function which orders notification array from most to least important
				-- By default orders first by level and then by update timestamp
				sort = notify_filter,
			},

			-- Notifications about LSP progress
			lsp_progress = {
				-- Whether to enable showing
				enable = true,

				-- Duration (in ms) of how long last message should be shown
				duration_last = 1000,
			},

			-- Window options
			window = {
				-- Floating window config
				config = {
					-- Border can be none, single, double, rounded, solid, shadow.
					border = "solid",
				},

				-- Maximum window width as share (between 0 and 1) of available columns
				max_width_share = 0.582,

				-- Value of 'winblend' option
				winblend = 25,
			},
		}

		require("mini.notify").setup(opts)
		vim.notify = require("mini.notify").make_notify()
	end,
}
