-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
-- local sumneko_root_path = vim.fn.stdpath('cache')..'/.config/nvim/language-servers/lua-language-server'
local sumneko_root_path =
	"/home/marcel/.config/nvim/language-servers/lua-language-server"
local sumneko_binary = "/usr/bin/env lua-language-server"

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- local luadev = require("lua-dev").setup {
-- 	{
-- 		library = {
-- 			vimruntime = true, -- runtime path
-- 			types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
-- 			plugins = true, -- installed opt or start plugins in packpath
-- 			-- you can also specify the list of plugins to make available as a workspace library
-- 			-- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
-- 		},
-- 		runtime_path = false, -- enable this to get completion in require strings. Slow!
-- 		-- pass any additional options that will be merged in the final lsp config
-- 		lspconfig = {
-- 			-- cmd = {"lua-language-server"}
-- 			rootUri = "",
-- 		},
-- 	},
-- }
--

local neodev_settings = {
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace",
			},
		},
	},
}

local lspconfig = require "lspconfig"

lspconfig.lua_ls.setup(neodev_settings)
