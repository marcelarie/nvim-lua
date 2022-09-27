-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
-- local sumneko_root_path = vim.fn.stdpath('cache')..'/.config/nvim/language-servers/lua-language-server'
local sumneko_root_path =
	"/home/marcel/.config/nvim/language-servers/lua-language-server"
local sumneko_binary = "/usr/bin/env lua-language-server"

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- require("lspconfig").sumneko_lua.setup {
-- 	cmd = { "lua-language-server", "-E", sumneko_root_path .. "/main.lua" },
-- 	settings = {
-- 		Lua = {
-- 			runtime = {
-- 				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
-- 				version = "LuaJIT",
-- 				-- Setup your lua path
-- 				path = runtime_path,
-- 			},
-- 			diagnostics = {
-- 				-- Get the language server to recognize the `vim` global
-- 				globals = { "vim" },
-- 			},
-- 			workspace = {
-- 				-- Make the server aware of Neovim runtime files
-- 				library = vim.api.nvim_get_runtime_file("", true),
-- 			},
-- 			-- Do not send telemetry data containing a randomized but unique identifier
-- 			telemetry = {
-- 				enable = false,
-- 			},
-- 		},
-- 	},
-- }

local luadev = require("lua-dev").setup {
	{
		library = {
			vimruntime = true, -- runtime path
			types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
			plugins = true, -- installed opt or start plugins in packpath
			-- you can also specify the list of plugins to make available as a workspace library
			-- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
		},
		runtime_path = false, -- enable this to get completion in require strings. Slow!
		-- pass any additional options that will be merged in the final lsp config
		lspconfig = {
			-- cmd = {"lua-language-server"}
			rootUri = "",
		},
	},
}

local lspconfig = require "lspconfig"
lspconfig.sumneko_lua.setup(luadev)
