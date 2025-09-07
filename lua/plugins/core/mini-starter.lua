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

		local header = string.format("running neovim v%s.%s.%s with %s plugins", version.major, version.minor, version.patch, get_plugins_count())

		starter.setup {
			autoopen = true,
			evaluate_single = true,
			header = header,
			footer = "",
			query_updaters = [[abcdefghilmnopqrstuvwxyz0123456789_,.ABCDEFGHIJKLMNOPQRSTUVWXYZ]], -- deleted `-` `j` `k` from here
			items = {
				{
					name = "rc: vim config",
					action = "cd ~/.config/nvim/ | e init.lua",
					section = "Config",
				},
				{
					name = "sr: session reload",
					action = "silent AutoSession restore",
					section = "Sessions",
				},
				{
					name = "ss: select session",
					action = "Autosession search",
					section = "Sessions",
				},
				{
					name = "fc: changed files",
					action = "Easypick changed_files",
					section = "Files",
				},
				starter.sections.recent_files(5, true, false),
				starter.sections.recent_files(5, false, true),
				{ name = "q: quit nvim", action = "qa", section = "Actions" },
				{
					name = "e: new file",
					action = "ene | startinsert",
					section = "Actions",
				},
				{
					name = "ff: find file",
					action = "lua require('snacks').picker.files()",
					section = "Files",
				},
				{
					name = "h: help tags",
					action = "lua require('snacks').picker.help()",
					section = "Help",
				},
				{
					name = "fr: recent files",
					action = "lua require('snacks').picker.recent()",
					section = "Files",
				},
			},
			content_hooks = {
				starter.gen_hook.adding_bullet(),
				starter.gen_hook.aligning("center", "center"),
			},
		}

		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniStarterOpened",
			callback = function()
				vim.keymap.set("n", "j", function()
					require("mini.starter").update_current_item "next"
				end, { buffer = true })
				vim.keymap.set("n", "k", function()
					require("mini.starter").update_current_item "prev"
				end, { buffer = true })
			end,
		})
	end,
	keys = {
		{ "<Leader>al", ":lua MiniStarter.open()<cr>", desc = "Starter menu" },
	},
}
