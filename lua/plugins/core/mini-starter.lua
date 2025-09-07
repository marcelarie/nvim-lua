return {
	"nvim-mini/mini.starter",
	event = "VimEnter",
	cond = function()
		return vim.fn.argc() == 0
	end,
	config = function()
		local starter = require "mini.starter"
		
		local version = vim.version()

		local function get_plugins_count()
			local lazy = require "lazy"
			local plugins_count = lazy.plugins()
			return #plugins_count
		end

		local header = table.concat({
			[[                                   __                ]],
			[[      ___     ___    ___   __  __ /\_\    ___ ___    ]],
			[[     / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
			[[    /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
			[[    \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
			[[     \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
			[[                                                     ]],
			string.format(
				[[              v: %s.%s.%s - lua: %s - plugins: %s ]],
				version.major,
				version.minor,
				version.patch,
				_VERSION,
				get_plugins_count()
			),
		}, "\n")

		starter.setup({
			autoopen = true,
			evaluate_single = false,
			header = header,
			footer = "",
			query_updaters = [[abcdefghilmnopqrstuvwxyz0123456789_-,.ABCDEFGHIJKLMNOPQRSTUVWXYZ]],
			items = {
				{ name = "vim config", action = "cd ~/.config/nvim/ | e init.lua", section = "Config" },
				{ name = "reload last session", action = "silent AutoSession restore", section = "Sessions" },
				{ name = "select session", action = "Autosession search", section = "Sessions" },
				{ name = "changed files", action = "Easypick changed_files", section = "Files" },
				starter.sections.recent_files(5, false),
				{ name = "quit nvim", action = "qa", section = "Actions" },
				{ name = "new file", action = "ene | startinsert", section = "Actions" },
				{ name = "find file", action = "Telescope find_files", section = "Files" },
				{ name = "help tags", action = "Telescope help_tags", section = "Help" },
				{ name = "recent files", action = "Telescope oldfiles", section = "Files" },
			},
			content_hooks = {
				starter.gen_hook.adding_bullet(),
				starter.gen_hook.aligning("center", "center"),
			},
		})

		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniStarterOpened",
			callback = function()
				vim.keymap.set("n", "j", function() require("mini.starter").update_current_item("next") end, { buffer = true })
				vim.keymap.set("n", "k", function() require("mini.starter").update_current_item("prev") end, { buffer = true })
			end,
		})
		
	end,
	keys = {
		{ "<Leader>al", ":lua MiniStarter.open()<cr>", desc = "Starter menu" },
	},
}