-- npm install -g typescript typescript-language-server
local util = require "lspconfig/util"

require("lspconfig").tsserver.setup {
	on_attach = On_attach,
	-- filetypes = {
	-- 	"javascript",
	-- 	"javascriptreact",
	-- 	"javascript.jsx",
	-- 	"typescript",
	-- 	"typescriptreact",
	-- 	"typescript.tsx",
	-- },
	-- root_dir = util.root_pattern(
	-- 	"tsconfig.json",
	-- 	"jsconfig.json",
	-- 	"package.json"
	-- ),
	-- cmd = {
	-- 	"typescript-language-server",
	-- 	"--stdio",
	-- 	"--tsserver-path=/Users/m.manzanares/node_modules/typescript/bin/tsserver",
	-- },

	-- settings = { documentFormatting = false },
}
