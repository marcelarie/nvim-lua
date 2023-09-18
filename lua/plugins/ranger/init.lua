local ranger = require "ranger-nvim"
ranger.setup {
	enable_cmds = false,
	replace_netrw = false,
	keybinds = {
		["ov"] = ranger.OPEN_MODE.vsplit,
		["os"] = ranger.OPEN_MODE.split,
		["ot"] = ranger.OPEN_MODE.tabedit,
		["or"] = ranger.OPEN_MODE.rifle,
	},
	ui = {
		border = "none",
		height = 1,
		width = 1,
		x = 0.5,
		y = 0.5,
	},
}

vim.keymap.set("n", "<Space>rf", function()
	ranger.open(true)
end)
