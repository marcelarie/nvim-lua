local cmd = {
	vim.env.UNAME == "Darwin"
			and "/Users/m.manzanares/clones/lang_servers/ltex-ls-15.2.0/bin/ltex-ls"
		or "./clones/lang_servers/ltex-ls-15.2.1-nightly/bin/ltex-ls",
}

local nvim_config_path = vim.env.UNAME == "Darwin"
		and "/Users/m.manzanares/.config/nvim/ltex-dictionaries/"
	or "/home/marcel/.config/nvim/ltex-dictionaries/"

-- require("lspconfig").ltex.setup {
-- 	cmd = cmd,
-- }
--
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
	},
	on_attach = function(client, bufnr)
		-- your other on_attach functions.
		require("ltex_extra").setup {
			load_langs = { "es-ES", "en-US" }, -- table <string> : languages for witch dictionaries will be loaded
			init_check = true, -- boolean : whether to load dictionaries on startup
			path = nvim_config_path, -- string : path to store dictionaries. Relative path uses current working directory
			log_level = "none", -- string : "none", "trace", "debug", "info", "warn", "error", "fatal"
		}
	end,
	cmd = cmd,
	settings = {
		ltex = {},
	},
}
