-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
-- local sumneko_root_path = vim.fn.stdpath('cache')..'/.config/nvim/language-servers/lua-language-server'
local sumneko_root_path = "/home/marcel/.config/nvim/language-servers/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("lspconfig").sumneko_lua.setup({
	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

-- -- for Lua 5.3:
-- require("lspconfig").sumneko_lua.setup({
-- 	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
-- 	settings = {
-- 		Lua = {
-- 			runtime = {
-- 				version = "Lua 5.3",
-- 				path = {
-- 					"?.lua",
-- 					"?/init.lua",
-- 					vim.fn.expand("~/.luarocks/share/lua/5.3/?.lua"),
-- 					vim.fn.expand("~/.luarocks/share/lua/5.3/?/init.lua"),
-- 					"/usr/share/5.3/?.lua",
-- 					"/usr/share/lua/5.3/?/init.lua",
-- 				},
-- 			},
-- 			diagnostics = {
-- 				-- Get the language server to recognize the `vim` global
-- 				globals = { "vim" },
-- 			},
-- 			workspace = {
-- 				library = {
-- 					[vim.fn.expand("~/.luarocks/share/lua/5.3")] = true,
-- 					["/usr/share/lua/5.3"] = true,
-- 				},
-- 			},
-- 			telemetry = {
-- 				enable = false,
-- 			},
-- 		},
-- 	},
-- })
