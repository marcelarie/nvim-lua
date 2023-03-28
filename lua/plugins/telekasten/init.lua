local tele = require "telekasten"

tele.setup {
	home = vim.fn.expand "~/clones/pers/notes",
}

vim.keymap.set("n", "<Space>to", function()
	tele.toggle_todo()
end)

vim.keymap.set("v", "<Space>to", function()
	tele.toggle_todo { v = true }
end)
