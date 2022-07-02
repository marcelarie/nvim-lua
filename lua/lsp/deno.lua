local util = require "lspconfig/util"

require("lspconfig").denols.setup {
    -- Omitting some options
    root_dir = util.root_pattern("deno_root", "deno.json"),
}
