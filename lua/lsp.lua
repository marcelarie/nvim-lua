local on_attach = require("lsp-on-attach").on_attach

---@diagnostic disable-next-line: param-type-not-match
vim.lsp.config("*", { on_attach = on_attach })

local lsp_servers = {
	"astro",
	"bash",
	"c",
	"mdx",
	"eslint",
	"fennel",
	"json",
	"lua",
	"markdown",
	"nix",
	"python",
	"qmlls",
	"rust",
	"toml",
	"typescript",
}

for _, lsp_name in ipairs(lsp_servers) do
	vim.lsp.enable(lsp_name)
end
