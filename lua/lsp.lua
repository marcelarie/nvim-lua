local on_attach = require("lsp-on-attach").on_attach

---@diagnostic disable-next-line: param-type-not-match
vim.lsp.config("*", { on_attach = on_attach })

local lsp_configs = {
	nix = { "nix" },
	bash = { "bash", "sh", "zsh", "csh", "ksg" },
	astro = { "astro" },
	json = { "json", "jsonc" },
	typescript = {
		"typescript",
		"typescriptreact",
		"javascript",
		"javascriptreact",
	},
	rust = { "rust" },
	toml = { "toml" },
	python = { "python" },
	fennel = { "fennel" },
	lua = { "lua" },
	markdown = { "markdown" },
}

local loaded_lsps = {}

local function load_lsp(lsp_name)
	if loaded_lsps[lsp_name] then
		return
	end
	loaded_lsps[lsp_name] = true
	vim.lsp.enable(lsp_name)
end

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local filetype = args.match
		for lsp_name, filetypes in pairs(lsp_configs) do
			if vim.tbl_contains(filetypes, filetype) then
				load_lsp(lsp_name)
			end
		end
	end,
})
