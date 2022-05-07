local alpha = require "alpha"
local startify = require "alpha.themes.startify"

startify.section.top_buttons.val = {
	-- I would like to cd into the directory first
	startify.button(
		"vi",
		"vim config",
		"<cmd>cd ~/.config/nvim/<CR><cmd>e nix.init.lua<CR>"
	),

	-- while also maintaining the format of the normal bookmark file button like this one:
	startify.file_button("~/.config/nvim/nix.init.lua", "vit"),
}

startify.section.bottom_buttons.val = {
	startify.button("q", "quit nvim", "<cmd>qa<CR>"),
	startify.button("e", "new file", "<cmd>ene <BAR> startinsert <CR>"),
}
local v = vim.version()

startify.section.header.val = {
	[[                                   __                ]],
	[[      ___     ___    ___   __  __ /\_\    ___ ___    ]],
	[[     / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
	[[    /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
	[[    \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
	[[     \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
	string.format(
		[[                                               v: %s%s%s ]],
		v.major,
		".",
		v.minor
	),
}

alpha.setup(startify.opts)

local NOREF_NOERR_TRUNC = { noremap = true, silent = true, nowait = true }

vim.keymap.set("n", "<Leader>al", function()
	vim.cmd "Alpha"
end, NOREF_NOERR_TRUNC)
