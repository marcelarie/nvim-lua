local function capture(cmd, raw)
	local f = assert(io.popen(cmd, "r"))
	local s = assert(f:read "*a")
	f:close()
	if raw then
		return s
	end
	s = string.gsub(s, "^%s+", "")
	s = string.gsub(s, "%s+$", "")
	s = string.gsub(s, "[\n\r]+", " ")
	return s
end

local function split(source, sep)
	local result, i = {}, 1
	while true do
		local a, b = source:find(sep)
		if not a then
			break
		end
		local candidat = source:sub(1, a - 1)
		if candidat ~= "" then
			result[i] = candidat
		end
		i = i + 1
		source = source:sub(b + 1)
	end
	if source ~= "" then
		result[i] = source
	end
	return result
end

return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require "alpha"
		local startify = require "alpha.themes.startify"

		startify.section.top_buttons.val = {
			-- I would like to cd into the directory first
			startify.button(
				"rc",
				"vim config",
				"<cmd>cd ~/.config/nvim/<CR><cmd>e init.lua<CR>"
			),
			startify.button(
				"se",
				"reload last session",
				"<cmd>silent SessionRestore<cr>"
			),
			startify.button(
				"ss",
				"select session",
				-- "<cmd>Telescope persisted<cr>"
				"<cmd>Autosession search<cr>"
			),
			startify.button(
				"cf",
				"changed files",
				"<cmd>Easypick changed_files<cr>"
			),

			-- while also maintaining the format of the normal bookmark file button like this one:
			startify.file_button("~/.config/nvim/init.lua", "vit"),
		}

		startify.section.bottom_buttons.val = {
			startify.button("q", "quit nvim", "<cmd>qa<CR>"),
			startify.button("e", "new file", "<cmd>ene <BAR> startinsert <CR>"),
		}

		local version = vim.version()

		local function get_plugins_count()
			local lazy = require "lazy"
			local plugins_count = lazy.plugins()
			return #plugins_count
		end

		local header_neovim = {
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
		}

		local header = header_neovim

		-- local header = split(
		-- 	capture(
		-- 		[[onefetch 2>/dev/null | sed 's/\x1B[@A-Z\\\]^_]\|\x1B\[[0-9:;<=>?]*[-!"#$%&'"'"'()*+,.\/]*[][\\@A-Z^_`a-z{|}~]//g']],
		-- 		true
		-- 	),
		-- 	"\n"
		-- )
		startify.section.header.val = header
		-- startify.section.header.val =
		alpha.setup(startify.opts)
	end,
	-- keys = {
	-- 	{ "<Leader>al", ":Alpha<cr>", desc = "Alpha menu" },
	-- },
}
