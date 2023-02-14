-- Complition
-- On_attach = require("lspconfig").on_attach
local nvim_lsp = require "lspconfig"

On_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- SHOW float window on attach
	-- vim.api.nvim_create_autocmd("CursorHold", {
	-- 	buffer = bufnr,
	-- 	callback = function()
	-- 		local opts = {
	-- 			focusable = false,
	-- 			close_events = {
	-- 				"BufLeave",
	-- 				"CursorMoved",
	-- 				"InsertEnter",
	-- 				"FocusLost",
	-- 			},
	-- 			border = "rounded",
	-- 			source = "always",
	-- 			prefix = " ",
	-- 			scope = "cursor",
	-- 		}
	-- 		vim.diagnostic.open_float(nil, opts)
	-- 	end,
	-- })

	-- if client.name == "tsserver" then
		-- local ts_utils = require "nvim-lsp-ts-utils"

		-- defaults
		-- ts_utils.setup {
		-- 	debug = false,
		-- 	disable_commands = false,
		-- 	enable_import_on_completion = true,
		--
		-- 	-- import all
		-- 	import_all_timeout = 5000, -- ms
		-- 	-- lower numbers = higher priority
		-- 	import_all_priorities = {
		-- 		same_file = 1, -- add to existing import statement
		-- 		local_files = 2, -- git files or files with relative path markers
		-- 		buffer_content = 3, -- loaded buffer content
		-- 		buffers = 4, -- loaded buffer names
		-- 	},
		-- 	import_all_scan_buffers = 100,
		-- 	import_all_select_source = false,
		-- 	-- if false will avoid organizing imports
		-- 	always_organize_imports = true,
		--
		-- 	-- filter diagnostics
		-- 	filter_out_diagnostics_by_severity = {},
		-- 	filter_out_diagnostics_by_code = {},
		--
		-- 	-- inlay hints
		-- 	auto_inlay_hints = false,
		-- 	inlay_hints_highlight = "Comment",
		-- 	inlay_hints_priority = 200, -- priority of the hint extmarks
		-- 	inlay_hints_throttle = 150, -- throttle the inlay hint request
		-- 	inlay_hints_format = { -- format options for individual hint kind
		-- 		Type = {},
		-- 		Parameter = {},
		-- 		Enum = {},
		-- 		-- Example format customization for `Type` kind:
		-- 		-- Type = {
		-- 		--     highlight = "Comment",
		-- 		--     text = function(text)
		-- 		--         return "->" .. text:sub(2)
		-- 		--     end,
		-- 		-- },
		-- 	},
		--
		-- 	-- update imports on file move
		-- 	update_imports_on_move = false,
		-- 	require_confirmation_on_move = false,
		-- 	watch_dir = nil,
		-- }
		--
		-- -- required to fix code action ranges and filter diagnostics
		-- ts_utils.setup_client(client)
	-- end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	-- buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	-- buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	-- buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	-- buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	-- buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	-- buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	-- buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	-- buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	-- buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	-- buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	-- buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	-- buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	-- buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
	-- buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	-- buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	-- buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	-- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

Capabilities = vim.lsp.protocol.make_client_capabilities()
Capabilities.textDocument.completion.completionItem.snippetSupport = true
Capabilities.textDocument.completion.completionItem.preselectSupport = true
Capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
Capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
Capabilities.textDocument.completion.completionItem.deprecatedSupport = true
Capabilities.textDocument.completion.completionItem.commitCharactersSupport =
	true
Capabilities.textDocument.completion.completionItem.tagSupport = {
	valueSet = { 1 },
}
Capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	},
}

Capabilities = require("cmp_nvim_lsp").default_capabilities(Capabilities)

DATA_PATH = vim.fn.stdpath "data"
