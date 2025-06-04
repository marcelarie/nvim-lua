local on_attach = require('lsp-on-attach').on_attach

vim.lsp.config('*', { on_attach = on_attach })

-- lsp setup example
-- vim.lsp.config('lua_ls', {
--   on_attach = on_attach,
--   cmd        = { 'lua-language-server' },
--   filetypes  = { 'lua' },
-- })

vim.lsp.enable({'nil_ls'})
