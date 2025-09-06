local on_attach = require("lsp-on-attach").on_attach

---@diagnostic disable-next-line: param-type-not-match
vim.lsp.config("*", { on_attach = on_attach })

vim.lsp.enable "nix"
vim.lsp.enable "bash"
vim.lsp.enable "json"
vim.lsp.enable "typescript"
vim.lsp.enable "rust-analyzer"
vim.lsp.enable "tombi"
vim.lsp.enable "python"
vim.lsp.enable "fennel"
vim.lsp.enable "lua"
vim.lsp.enable "markdown"
