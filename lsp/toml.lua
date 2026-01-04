---@brief
---
--- https://tamasfe.github.io/taplo/
---
--- Language server for TOML using Taplo.
---
return {
	cmd = { "taplo", "lsp", "stdio" },
	filetypes = { "toml" },
	root_markers = { "pyproject.toml", "Cargo.toml", ".git" },
}
