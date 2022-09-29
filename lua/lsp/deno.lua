local util = require "lspconfig/util"

require("lspconfig").denols.setup {
	unstable = true,
	-- Omitting some options
	root_dir = util.root_pattern("deno_root", "deno.json", "deno.jsonc"),
}
