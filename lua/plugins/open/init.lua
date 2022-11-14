local open = require "open"

open.setup {}

vim.keymap.set("n", "gx", open.open_cword)
