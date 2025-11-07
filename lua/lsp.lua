local on_attach = require("lsp-on-attach").on_attach

---@diagnostic disable-next-line: param-type-not-match
vim.lsp.config("*", { on_attach = on_attach })

local lsp_servers = {
	"nix",
	"qmlls",
	"bash",
	"astro",
	"json",
	"typescript",
	"eslint",
	"rust",
	"toml",
	"python",
	"fennel",
	"lua",
	"markdown",
}

for _, lsp_name in ipairs(lsp_servers) do
	vim.lsp.enable(lsp_name)
end
