-- JavaScript/React/TypeScript (G)
local prettier = {
	formatCommand = "./node_modules/.bin/prettier --write --stdin-filepath ${INPUT}",
	formatStdin = true,
}

local prettier_global = {
	formatCommand = "prettier --stdin-filepath ${INPUT}",
	formatStdin = true,
}

local eslint = {
	lintCommand = "./node_modules/.bin/eslint -f unix --stdin --stdin-filename ${INPUT}",
	lintIgnoreExitCode = true,
	lintStdin = true,
	lintFormats = { "%f:%l:%c: %m" },
	formatCommand = "./node_modules/.bin/eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}",
	formatStdin = true,
}

-- Markdown
local markdownPandocFormat = {
	formatCommand = "pandoc -f markdown -t gfm -sp --tab-stop=4",
	formatStdin = true,
}

-- SH
local shfmt = { formatCommand = "shfmt -ci -s -bn", formatStdin = true }

local lua = {
	formatCommand = "lua-format -i --no-keep-simple-function-one-line",
	formatStdin = true,
}

require("lspconfig").efm.setup({
	init_options = { documentFormatting = true },
	filetypes = {
		"lua",
		"python",
		"sh",
		"markdown",
		"javascriptreact",
		"javascript",
		"typescript",
		"typescriptreact", -- "html", "css", "json", "yaml"
	},
	settings = {
		rootMarkers = { ".git/" },
		languages = {
			lua = lua,
			javascript = { eslint },
			typescript = { eslint },
			typescriptreact = { eslint },
			javascriptreact = { eslint },
			sh = { shfmt },
			-- markdown = {markdownPandocFormat, markdownlint},
			markdown = { markdownPandocFormat },
		},
	},
})
