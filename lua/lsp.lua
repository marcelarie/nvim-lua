local on_attach = require("lsp-on-attach").on_attach

---@diagnostic disable-next-line: param-type-not-match
vim.lsp.config("*", { on_attach = on_attach })

vim.lsp.enable "nil_ls"
vim.lsp.enable "bashls"
vim.lsp.enable "jsonls"
vim.lsp.enable "typescript"
vim.lsp.enable "rust-analyzer"
vim.lsp.enable "tombi"
-- using emmylua_ls instead of lua_ls
vim.lsp.enable "emmylua_ls"

-- markdown
vim.lsp.enable "marksman"
-- vim.lsp.enable "md-oxide"
