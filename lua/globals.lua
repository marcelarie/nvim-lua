-- Complition
On_attach = require("lspconfig").on_attach
capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

DATA_PATH = vim.fn.stdpath("data")
