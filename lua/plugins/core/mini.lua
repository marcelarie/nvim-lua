return {
	"echasnovski/mini.nvim",
	version = false,
	event = "VimEnter",
	config = function()
		local starter = require "mini.starter"

		local version = vim.version()

		local function get_plugins_count()
			local lazy = require "lazy"
			local plugins_count = lazy.plugins()
			return #plugins_count
		end

		local function is_git_ignored(file)
			-- Use git status to check if file should be shown
			-- --ignored shows ignored files, --porcelain for parsing
			local result = vim.fn.system(
				"git status --ignored --porcelain "
					.. vim.fn.shellescape(file)
					.. " 2>/dev/null"
			)

			-- If the result starts with "!!" it's ignored
			-- If empty, it might be tracked or internal git file
			if result:match "^!!" then
				return true
			end

			-- Additional check for .git directory files (internal git files)
			if file:match "/%.git/" or file:match "^%.git/" then
				return true
			end

			return false
		end

		local function custom_recent_files(n, current_dir, prefix_chars)
			local recent_files = vim.v.oldfiles
			local items = {}
			local count = 0

			for _index, file in ipairs(recent_files) do
				if count >= n then
					break
				end

				local should_include = current_dir
						and vim.startswith(file, vim.fn.getcwd())
					or not current_dir
						and not vim.startswith(file, vim.fn.getcwd())

				if
					should_include
					and vim.fn.filereadable(file) == 1
					and not is_git_ignored(file)
				then
					count = count + 1
					local prefix = prefix_chars and prefix_chars[count] or ""
					table.insert(items, {
						name = prefix .. vim.fn.fnamemodify(file, ":~:."),
						action = "edit " .. file,
						section = current_dir and "Recent current dir"
							or "Recent global",
					})
				end
			end

			return items
		end

		local header = string.format(
			"running neovim v%s.%s.%s with %s plugins",
			version.major,
			version.minor,
			version.patch,
			get_plugins_count()
		)

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
				custom_recent_files(
					5,
					true,
					{ "0: ", "1: ", "2: ", "3: ", "4: " }
				),
				custom_recent_files(
					5,
					false,
					{ "g0: ", "g1: ", "g2: ", "g3: ", "g4: " }
				),
				{ name = "q: quit nvim", action = "qa", section = "Actions" },
				{
					name = "e: new file",
					action = "ene | startinsert",
					section = "Actions",
				},
				{
					name = "lu: lazy update",
					action = "silent Lazy update",
					section = "Actions",
				},
				{
					name = "ls: lazy sync",
					action = "silent Lazy sync",
					section = "Actions",
				},
				{
					name = "lp: lazy profile",
					action = "silent Lazy profile",
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

		require("mini.statusline").setup {
			-- Content of statusline as functions which return statusline string. See
			-- `:h statusline` and code of default contents (used instead of `nil`).
			content = {
				-- Content for active window
				active = nil,
				-- Content for inactive window(s)
				inactive = nil,
			},

			-- Whether to use icons by default
			use_icons = true,

			-- Whether to set Vim's settings for statusline (make it always shown)
			set_vim_settings = true,
		}
	end,
	keys = {
		{ "<Leader>al", ":lua MiniStarter.open()<cr>", desc = "Starter menu" },
	},
}
