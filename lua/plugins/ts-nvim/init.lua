local ts = require "typescript-tools"

ts.setup {
	on_attach = function(client, _bufnr)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,
	settings = {
		-- spawn additional tsserver instance to calculate diagnostics on it
		separate_diagnostic_server = true,
		-- "change"|"insert_leave" determine when the client asks the server about diagnostic
		publish_diagnostic_on = "insert_leave",
		-- array of strings("fix_all"|"add_missing_imports"|"remove_unused")
		-- specify commands exposed as code_actions
		expose_as_code_action = {},
		-- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
		-- not exists then standard path resolution strategy is applied
		tsserver_path = nil,
		-- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
		-- (see 💅 `styled-components` support section)
		tsserver_plugins = {
			"@styled/typescript-styled-plugin",
		},
		-- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
		-- memory limit in megabytes or "auto"(basically no limit)
		tsserver_max_memory = "auto",
		-- described below
		tsserver_format_options = {},
		tsserver_file_preferences = {
			-- Inlay Hints
			includeInlayParameterNameHints = "all",
			includeInlayParameterNameHintsWhenArgumentMatchesName = true,
			includeInlayFunctionParameterTypeHints = true,
			includeInlayVariableTypeHints = true,
			includeInlayVariableTypeHintsWhenTypeMatchesName = true,
			includeInlayPropertyDeclarationTypeHints = true,
			includeInlayFunctionLikeReturnTypeHints = true,
			includeInlayEnumMemberValueHints = true,
		},
		-- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
		complete_function_calls = false,
	},
}

local opts = { silent = true }

vim.keymap.set("n", "gs", ":TSToolsOrganizeImports<cr>", opts)
vim.keymap.set("n", "ga", ":TSToolsAddMissingImports<cr>", opts)
-- vim.keymap.set("n", "gi", ":?<CR>", opts)
vim.keymap.set("n", "gsd", ":TSToolsGoToSourceDefinition<CR>", opts)
vim.keymap.set("n", "gfa", ":TSToolsFixAll<cr>", opts)
-- vim.keymap.set("n", "gi", ":?<CR>", opts)
vim.keymap.set("n", "gsd", ":TSToolsGoToSourceDefinition<CR>", opts)
vim.keymap.set("n", "gfa", ":TSToolsFixAll<cr>", opts)
