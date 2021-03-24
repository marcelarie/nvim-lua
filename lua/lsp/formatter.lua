-- JavaScript/React/TypeScript (G)
local prettier = {
    formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}",
    formatStdin = true
}

local prettier_global = {
    formatCommand = "prettier --stdin-filepath ${INPUT}",
    formatStdin = true
}

local eslint = {
    lintCommand = "./node_modules/.bin/eslint -f unix --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    formatCommand = "./node_modules/.bin/eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
}

-- Markdown
local markdownPandocFormat = {
    formatCommand = 'pandoc -f markdown -t gfm -sp --tab-stop=2',
    formatStdin = true
}

-- SH
local shfmt = {formatCommand = 'shfmt -ci -s -bn', formatStdin = true}

require"lspconfig".efm.setup {
    init_options = {documentFormatting = true},
    -- "javascriptreact", "javascript","html", "css", "json", "yaml",
    filetypes = {"lua", "python", "sh", "markdown"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {
                {
                    formatCommand = "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=80 --break-after-table-lb",
                    formatStdin = true
                }
            },
            -- javascriptreact = {prettier_global},
            -- javascript = {prettier_global},
            sh = {shfmt},
            -- html = {prettier_global},
            -- css = {prettier_global},
            -- json = {prettier_global},
            -- yaml = {prettier_global},
            -- markdown = {markdownPandocFormat, markdownlint},
            markdown = {markdownPandocFormat}
        }
    }
}
