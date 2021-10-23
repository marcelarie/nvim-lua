USER = vim.fn.expand("$USER")

local sumneko_root_path = ""
local sumneko_binary = ""

-- for multiple systems
if vim.fn.has("mac") == 1 then
	sumneko_root_path = "/Users/" .. USER .. "/.config/nvim/language-servers/lua-language-server"
	sumneko_binary = "/Users/"
		.. USER
		.. "/.config/nvim/language-servers/lua-language-server/bin/macOS/lua-language-server"
elseif vim.fn.has("unix") == 1 then
	sumneko_root_path = "/home/" .. USER .. "/.config/nvim/language-servers/lua-language-server"
	sumneko_binary = "/home/"
		.. USER
		.. "/.config/nvim/language-servers/lua-language-server/bin/Linux/lua-language-server"
else
	print("Unsupported system for sumneko")
end
--
-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
-- local sumneko_root_path = vim.fn.stdpath("cache") .. "/.config/nvim/language-servers/lua-language-server"
-- local sumneko_binary = "/.config/nvim/language-servers/lua-language-server"

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("lspconfig").sumneko_lua.setup({
	on_attach = On_attach,
	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				-- version = "Lua 5.4", -- LuaJIT
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
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
				telemetry = {
					enable = false,
				},
			},
		},
	},
})
