require("nvim-treesitter.configs").setup {}

require("Comment").setup {}

local comment_ft = require "Comment.ft"
comment_ft.set("fish", { "# %s", "# %s #" })
comment_ft.set("bash", { "# %s", "# %s #" })
comment_ft.set("sh", { "# %s", "# %s #" })
comment_ft.set("", { "# %s", "# %s #" })
comment_ft.set("typ", { "// %s", "/* %s */" })
-- comment_ft.set("typescriptreact", { "{/* %s */}", "{/* %s */}" })
-- comment_ft.set("javascriptreact", { "{/* %s */}", "{/* %s */}" })
