local startify = require("alpha.themes.startify")

startify.section.top_buttons.val = {
	-- I would like to cd into the directory first
	startify.button("vi", "vim config", ":cd ~/home/marcel/.config/nvim/<CR>:e init.lua<CR>"),

	-- while also maintaining the format of the normal bookmark file button like this one:
	startify.file_button("~/home/marcel/.config/nvim/init.lua", "vit"),
}

startify.section.bottom_buttons.val = {
	startify.button("q", "quit nvim", ":qa<CR>"),
	startify.button("e", "new file", ":ene <BAR> startinsert <CR>"),
}

require("alpha").setup(startify.opts)
