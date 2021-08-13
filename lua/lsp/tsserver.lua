-- npm install -g typescript typescript-language-server
require("lspconfig").tsserver.setup({
	on_attach = On_attach,
	-- on_attach = require'lsp'.common_on_attach,
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	settings = { documentFormatting = false },

	-- TS UTILS
	--     on_attach = function(_, bufnr)
	--         local ts_utils = require("nvim-lsp-ts-utils")
	--
	--         -- replace default codeAction handler to inject ESLint actions
	--         vim.lsp.handlers["textDocument/codeAction"] =
	--             ts_utils.code_action_handler
	--
	--         require("nvim-lsp-ts-utils").setup {
	--             -- defaults
	--             disable_commands = false,
	--             enable_import_on_completion = true,
	--             import_on_completion_timeout = 5000,
	--             eslint_bin = "eslint_d", -- use eslint_d if possible!
	--             eslint_fix_current = false,
	--             eslint_enable_disable_comments = true
	--         }
	--
	--         -- no default maps, so you may want to define some here
	--         vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>oi",
	--                                     ":TSLspOrganize<CR>", {silent = true})
	--         vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>fx",
	--                                     ":TSLspFixCurrent<CR>", {silent = true})
	--         vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>rf",
	--                                     ":TSLspRenameFile<CR>", {silent = true})
	--         vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>ia",
	--                                     ":TSLspImportAll<CR>", {silent = true})
	--     end,
	--
	--     filetypes = {
	--         "javascript", "javascriptreact", "javascript.jsx", "typescript",
	--         "typescriptreact", "typescript.tsx"
	--     },
	--     settings = {documentFormatting = false}
})
