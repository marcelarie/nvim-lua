local inc_rename = require "inc_rename"
inc_rename.setup {
	input_buffer_type = "dressing",
}

vim.keymap.set("n", "<leader>rn", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })
