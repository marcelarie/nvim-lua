-- vim.opt.clipboard = "unnamedplus" -- Use the system clipboard

-- System clipboard mappings
vim.keymap.set({ "n", "v" }, "cp", [["+y]]) -- For copying to system clipboard
vim.keymap.set("n", "cpp", [["+yy]]) -- For copying to system clipboard (whole line)
vim.keymap.set("n", "cP", [["+y$]]) -- For copying to to the end of the line
