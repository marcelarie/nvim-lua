local inc_rename = require "inc_rename"
inc_rename.setup()

vim.keymap.set("n", "<leader>rn", function()
	inc_rename.rename { default = vim.fn.expand "<cword>" }
end)
