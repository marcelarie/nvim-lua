local is_darwin = vim.env.UNAME == "Darwin"

local ltex_lsp_macos_path =
	"/Users/marcelmanzanares2/clones/lang_servers/ltex-ls-16.0.0/bin/ltex-ls"
local ltex_lsp_linux_path =
	"./clones/lang_servers/ltex-ls-15.2.1-nightly/bin/ltex-ls"
local ltex_lsp_path = is_darwin and ltex_lsp_macos_path or ltex_lsp_linux_path

if io.open(ltex_lsp_path) then
	-- print "Ltex folder found"
else
	print "Ltex folder not found"
end

local ltex_dict_macos =
	"/Users/marcelmanzanares2/.config/nvim/ltex-dictionaries/"
local ltex_dict_linux = "/home/marcel/.config/nvim/ltex-dictionaries/"
local ltex_config_path = is_darwin and ltex_dict_macos or ltex_dict_linux

require("lspconfig").ltex.setup {
	-- capabilities = your_capabilities,
	filetypes = {
		"bib",
		-- "gitcommit",
		"markdown",
		"org",
		"plaintex",
		"rst",
		"rnoweb",
		"tex",
		-- "typ",
	},
	on_attach = function(client, bufnr)
		-- your other on_attach functions.
		require("ltex_extra").setup {
			load_langs = { "es-ES", "en-US" }, -- table <string> : languages for witch dictionaries will be loaded
			init_check = true, -- boolean : whether to load dictionaries on startup
			path = ltex_config_path, -- string : path to store dictionaries. Relative path uses current working directory
			log_level = "none", -- string : "none", "trace", "debug", "info", "warn", "error", "fatal"
		}
	end,
	cmd = { ltex_lsp_path },
	settings = {
		ltex = {},
	},
}
