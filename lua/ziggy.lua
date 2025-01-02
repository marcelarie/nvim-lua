local g = vim.g
local highlight = vim.api.nvim_set_hl

local none = "NONE"
-- Background and foreground
local bg = "#222222"
local white = "#eeeeee"

-- Variations of charcoal-grey
local grey0 = "#323437"
local grey1 = "#373c4d"
local grey89 = "#cccccc"
local grey70 = "#b2b2b2"
local grey62 = "#9e9e9e"
local grey58 = "#929292"
local grey50 = "#808080"
local grey39 = "#616161"
local grey30 = "#4e4e4e"
local grey27 = "#444444"
local grey23 = "#353535"
local grey18 = "#2d2d2d"
local grey15 = bg
local grey11 = "#1e1e1e"
local grey7 = "#121212"

-- Core theme colors
local red = "#ff8080"
local dark_red = "#ff8080"
local green = "#22ee55"
local dark_green = "#22ee55"
local yellow = "#aaaa77"
local dark_yellow = "#aaaa77"
local blue = "#6688ff"
local dark_blue = "#6688ff"
local magenta = "#b1a0f8"
local dark_magenta = "#b1a0f8"
local cyan = "#21edba"
local dark_cyan = "#21edba"
local orange = "#ff894c"

local M = {}

M.palette = {
	white = white,
	bg = bg,
	grey0 = grey0,
	grey1 = grey1,
	grey89 = grey89,
	grey70 = grey70,
	grey62 = grey62,
	grey58 = grey58,
	grey50 = grey50,
	grey39 = grey39,
	grey30 = grey30,
	grey27 = grey27,
	grey23 = grey23,
	grey18 = grey18,
	grey15 = grey15,
	grey11 = grey11,
	grey7 = grey7,

	red = red,
	dark_red = dark_red,
	yellow = yellow,
	dark_yellow = dark_yellow,
	green = green,
	dark_green = dark_green,
	blue = dark_blue,
	magenta = magenta,
	dark_magenta = dark_magenta,
	cyan = cyan,
	dark_cyan = dark_cyan,
	orange = orange,
}

M.style = function()
	-------------------------------------------------------------------------
	-- Custom styling groups
	-------------------------------------------------------------------------

	highlight(0, "ZiggyVisual", { bg = grey0 })
	highlight(0, "ZiggyWhite", { fg = white })
	highlight(0, "ZiggyGrey0", { fg = grey0 })
	highlight(0, "ZiggyGrey89", { fg = grey89 })
	highlight(0, "ZiggyGrey70", { fg = grey70 })
	highlight(0, "ZiggyGrey62", { fg = grey62 })
	highlight(0, "ZiggyGrey58", { fg = grey58 })
	highlight(0, "ZiggyGrey39", { fg = grey39 })
	highlight(0, "ZiggyGrey30", { fg = grey30 })
	highlight(0, "ZiggyGrey27", { fg = grey27 })
	highlight(0, "ZiggyGrey23", { fg = grey23 })
	highlight(0, "ZiggyGrey18", { fg = grey18 })
	highlight(0, "ZiggyGrey15", { fg = grey15 })
	highlight(0, "ZiggyDarkYellow", { fg = dark_yellow })
	highlight(0, "ZiggyYellow", { fg = yellow })
	highlight(0, "ZiggyRed", { fg = red })
	highlight(0, "ZiggyGreen", { fg = green })
	highlight(0, "ZiggyDarkCyan", { fg = dark_cyan })
	highlight(0, "ZiggyCyan", { fg = cyan })
	highlight(0, "ZiggyBlue", { fg = blue })
	highlight(0, "ZiggyDarkMagenta", { fg = dark_magenta })
	highlight(0, "ZiggyMagenta", { fg = magenta })
	highlight(0, "ZiggyDarkRed", { fg = dark_red })
	highlight(0, "ZiggyOrange", { fg = orange })
	-- Misc helpers
	highlight(0, "ZiggyUnderline", { underline = true })
	highlight(0, "ZiggyNoCombine", { nocombine = true })
	-- Statusline helper colors
	highlight(0, "ZiggyStatusLineMode", { bg = grey23, fg = grey89 })
	highlight(0, "ZiggyBlueMode", { bg = blue, fg = grey11 })
	highlight(0, "ZiggyDarkCyanMode", { bg = dark_cyan, fg = grey11 })
	highlight(0, "ZiggyMagentaMode", { bg = magenta, fg = grey11 })
	highlight(0, "ZiggyDarkRedMode", { bg = dark_red, fg = grey11 })
	highlight(0, "ZiggyYellowMode", { bg = yellow, fg = grey11 })
	highlight(0, "ZiggyCyanMode", { bg = cyan, fg = grey11 })
	-- Generic line helper colors
	highlight(0, "ZiggyCurrentLine", { bg = grey15 })
	highlight(0, "ZiggyDarkRedLine", { bg = grey18, fg = dark_red })
	highlight(0, "ZiggyDarkCyanLine", { bg = grey18, fg = dark_cyan })
	highlight(0, "ZiggyGrey58Line", { bg = grey11, fg = grey58 })
	highlight(0, "ZiggyYellowLine", { bg = grey11, fg = yellow })
	highlight(0, "ZiggyBlueLineActive", { bg = grey27, fg = blue })
	highlight(0, "ZiggyRedLineActive", { bg = grey27, fg = red })
	highlight(0, "ZiggyCyanLineActive", { bg = grey27, fg = cyan })
	highlight(0, "ZiggyWhiteLineActive", { bg = grey27, fg = grey89 })
	highlight(0, "ZiggyYellowLineActive", { bg = grey27, fg = yellow })

	-------------------------------------------------------------------------
	-- Standard styling
	-------------------------------------------------------------------------

	-- Specify the colors used by the inbuilt terminal
	if g.starlightTerminalColors then
		g.terminal_color_0 = grey0
		g.terminal_color_1 = red
		g.terminal_color_2 = green
		g.terminal_color_3 = yellow
		g.terminal_color_4 = blue
		g.terminal_color_5 = dark_magenta
		g.terminal_color_6 = cyan
		g.terminal_color_7 = white
		g.terminal_color_8 = grey58
		g.terminal_color_9 = dark_red
		g.terminal_color_10 = dark_cyan
		g.terminal_color_11 = dark_yellow
		g.terminal_color_12 = blue
		g.terminal_color_13 = magenta
		g.terminal_color_14 = green
		g.terminal_color_15 = grey89
	end

	-- Background and text
	highlight(0, "Normal", { bg = bg, fg = white })

	-- Color of mode text, -- INSERT --
	highlight(0, "ModeMsg", { link = "ZiggyGrey62" })

	-- Comments
	highlight(0, "Comment", { fg = yellow, italic = true })

	-- Functions
	-- highlight(0, "Function", { fg = magenta, bold = true })
	highlight(0, "Function", { fg = grey89 })

	-- Strings
	highlight(0, "String", { link = "ZiggyGreen" })

	-- Booleans
	highlight(0, "Boolean", { link = "ZiggyRed" })

	-- Identifiers
	highlight(0, "Identifier", { link = "ZiggyGrey89" })

	-- Color of titles
	highlight(0, "Title", { link = "ZiggyCyan" })

	-- const, static
	highlight(0, "StorageClass", { fg = white, bold = true })

	-- void, intptr_t
	highlight(0, "Type", { fg = blue, bold = true })

	-- Numbers
	highlight(0, "Constant", { link = "ZiggyRed" })

	-- Character constants
	highlight(0, "Character", { link = "ZiggyCyan" })

	-- Exceptions
	highlight(0, "Exception", { fg = white, bold = true })

	-- ifdef/endif
	highlight(0, "PreProc", { link = "ZiggyOrange" })

	-- case in switch statement
	highlight(0, "Label", { link = "ZiggyGrey89" })

	-- end-of-line '$', end-of-file '~'
	highlight(0, "NonText", { fg = magenta })

	-- sizeof
	highlight(0, "Operator", { link = "ZiggyGrey89" })

	-- Conditional
	highlight(0, "Conditional", { fg = white, bold = true })

	-- keyword
	highlight(0, "Keyword", { fg = white, bold = true })

	-- for, while
	highlight(0, "Repeat", { fg = white, bold = true })

	-- Search
	highlight(0, "Search", { bg = grey1, fg = grey89 })
	highlight(0, "CurSearch", { bg = magenta, fg = bg })
	highlight(0, "IncSearch", { bg = grey62, fg = bg })

	-- '\n' sequences
	highlight(0, "Special", { link = "ZiggyCyan" })

	-- if, else
	highlight(0, "Statement", { fg = white, bold = true })

	-- struct, union, enum, typedef
	highlight(0, "Structure", { fg = white, bold = true })

	-- Status, split and tab lines
	highlight(0, "StatusLine", { link = "ZiggyStatusLineMode" })
	highlight(0, "StatusLineNC", { bg = grey23, fg = grey58 })
	highlight(0, "Tabline", { bg = grey18, fg = grey62 })
	highlight(0, "TablineSel", { bg = grey15, fg = yellow })
	highlight(0, "TablineSelSymbol", { bg = grey11, fg = dark_cyan })
	highlight(0, "TablineFill", { bg = grey18, fg = grey18 })
	highlight(0, "StatusLineTerm", { bg = grey18, fg = white })
	highlight(0, "StatusLineTermNC", { bg = grey18, fg = grey62 })
	highlight(0, "VertSplit", { bg = bg, fg = grey23 })

	-- Visual selection
	-- highlight(0, "Visual", { fg = white, bg = dark_blue })
	highlight(0, "Visual", { fg = bg, bg = grey62 })
	highlight(0, "VisualNOS", { bg = grey0, fg = white })

	-- Errors, warnings and whitespace-eol
	highlight(0, "Error", { bg = bg, fg = red })
	highlight(0, "ErrorMsg", { bg = bg, fg = red })
	highlight(0, "WarningMsg", { bg = bg, fg = yellow })

	-- Auto-text-completion menu
	highlight(0, "Pmenu", { bg = grey23, fg = grey89 })
	highlight(0, "PmenuSel", { bg = dark_green, fg = bg })
	highlight(0, "PmenuSbar", { link = "ZiggyCurrentLine" })
	highlight(0, "PmenuThumb", { bg = grey50 })
	highlight(0, "WildMenu", { bg = dark_green, fg = grey89 })

	-- Spelling errors
	highlight(0, "SpellBad", { bg = none, undercurl = true, sp = red })
	highlight(0, "SpellCap", { bg = none, undercurl = true, sp = yellow })
	highlight(0, "SpellRare", { bg = none, undercurl = true, sp = green })
	highlight(0, "SpellLocal", { bg = none, undercurl = true, sp = blue })

	-- Misc
	highlight(0, "Question", { fg = green })
	highlight(0, "MoreMsg", { link = "ZiggyRed" })
	highlight(0, "LineNr", { fg = grey30 })
	highlight(0, "Cursor", { fg = bg, bg = blue })
	highlight(0, "lCursor", { fg = bg, bg = grey62 })
	highlight(0, "CursorLineNr", { bg = grey11, fg = grey58 })
	highlight(0, "CursorColumn", { bg = grey11 })
	highlight(0, "CursorLine", { bg = grey11 })
	highlight(0, "Folded", { bg = grey11, fg = green })
	highlight(0, "FoldColumn", { bg = grey18, fg = green })
	highlight(0, "SignColumn", { bg = bg, fg = green })
	highlight(0, "Todo", { bg = grey15, fg = yellow })
	highlight(0, "SpecialKey", { fg = cyan })
	highlight(0, "MatchParen", { underline = true })
	highlight(0, "Ignore", { link = "ZiggyBlue" })
	highlight(0, "Underlined", { fg = dark_cyan })
	highlight(0, "QuickFixLine", { link = "ZiggyCurrentLine" })
	highlight(0, "Delimiter", { link = "ZiggyGrey89" })
	highlight(0, "qfFileName", { link = "ZiggyDarkCyan" })

	-- Color column (after line 80)
	highlight(0, "ColorColumn", { bg = grey7 })

	-- Conceal color
	highlight(0, "Conceal", { bg = none, fg = grey70 })

	-- nvim -d
	highlight(0, "DiffAdd", { link = "ZiggyGreen" })
	highlight(0, "DiffChange", { link = "ZiggyMagenta" })
	highlight(0, "DiffDelete", { link = "ZiggyRed" })
	highlight(0, "DiffText", { bg = cyan })

	-------------------------------------------------------------------------
	-- Neovim standard styling
	-------------------------------------------------------------------------

	highlight(0, "Whitespace", { fg = grey0 })
	highlight(0, "TermCursor", { bg = grey62, fg = bg })
	highlight(0, "NormalFloat", { link = "ZiggyStatusLineMode" })
	highlight(0, "FloatBorder", { bg = bg, fg = grey70 })
	highlight(0, "FloatTitle", { link = "ZiggyStatusLineMode" })
	highlight(0, "WinBar", { bg = grey15, fg = white })
	highlight(0, "WinBarNC", { bg = grey15, fg = grey62 })
	highlight(0, "WinSeparator", { link = "VertSplit" })

	-- Neovim check-health
	highlight(0, "healthSuccess", { link = "DiffAdd" })
	highlight(0, "healthHeadingChar", { link = "ZiggyBlue" })
	highlight(0, "helpHeader", { link = "ZiggyCyan" })

	-- Neovim Tree-sitter
	highlight(0, "@boolean", { link = "ZiggyRed" })
	highlight(0, "@attribute", { link = "ZiggyGrey89" })
	highlight(0, "@comment.error", { link = "ZiggyRed" })
	highlight(0, "@comment.note", { link = "ZiggyGrey58" })
	highlight(0, "@comment.ok", { link = "ZiggyGreen" })
	highlight(0, "@comment.todo", { link = "Todo" })
	highlight(0, "@comment.warning", { link = "ZiggyYellow" })
	highlight(0, "@constant", { link = "ZiggyRed" })
	highlight(0, "@constant.builtin", { link = "ZiggyGreen" })
	highlight(0, "@constant.macro", { link = "ZiggyDarkMagenta" })
	highlight(0, "@constructor", { link = "ZiggyGreen" })
	highlight(0, "@diff.delta", { link = "DiffChange" })
	highlight(0, "@diff.minus", { link = "DiffDelete" })
	highlight(0, "@diff.plus", { link = "DiffAdd" })
	--highlight(0, "@function", { fg = magenta, bold = true })
	highlight(0, "@function", { link = "ZiggyGrey89" })
	highlight(0, "@function.builtin", { link = "ZiggyOrange" })
	highlight(0, "@function.call", { link = "ZiggyGrey89" })
	highlight(0, "@function.macro", { link = "ZiggyGrey89" })
	highlight(0, "@function.method", { link = "ZiggyGrey89" })
	highlight(0, "@function.method.call", { link = "ZiggyGrey89" })
	highlight(0, "@keyword", { fg = white, bold = true })
	highlight(0, "@keyword.conditional", { link = "Conditional" })
	highlight(0, "@keyword.directive", { link = "PreProc" })
	highlight(0, "@keyword.directive.define", { link = "Define" })
	highlight(0, "@keyword.exception", { link = "ZiggyDarkMagenta" })
	highlight(0, "@keyword.import", { link = "ZiggyOrange" })
	highlight(0, "@keyword.operator", { link = "ZiggyGrey89" })
	highlight(0, "@keyword.repeat", { link = "Repeat" })
	highlight(0, "@keyword.storage", { link = "StorageClass" })
	highlight(0, "@markup.environment", { link = "ZiggyDarkMagenta" })
	highlight(0, "@markup.environment.name", { link = "ZiggyDarkCyan" })
	highlight(0, "@markup.heading.marker", { fg = blue, bold = true })
	highlight(0, "@markup.heading", { fg = white, bold = true })
	highlight(0, "@markup.bold", { fg = magenta, bold = true })
	highlight(0, "@markup.italic", { fg = magenta, italic = true })
	highlight(0, "@markup.link", { link = "ZiggyCyan" })
	highlight(0, "@markup.link.text", { link = "ZiggyYellow" })
	highlight(0, "@markup.link.label", { link = "ZiggyGreen" })
	highlight(
		0,
		"@markup.link.url",
		{ fg = magenta, underline = true, sp = grey50 }
	)
	highlight(0, "@markup.list", { link = "ZiggyBlue" })
	highlight(0, "@markup.list.checked", { link = "ZiggyCyan" })
	highlight(0, "@markup.list.unchecked", { link = "ZiggyBlue" })
	highlight(0, "@markup.math", { link = "ZiggyBlue" })
	highlight(0, "@markup.quote", { link = "ZiggyMagenta" })
	highlight(0, "@markup.raw", { link = "ZiggyGreen" })
	highlight(0, "@markup.strikethrough", { fg = red, strikethrough = true })
	highlight(0, "@markup.strong", { link = "ZiggyRed" })
	highlight(0, "@markup.underline", { underline = true })
	highlight(0, "@module", { link = "ZiggyWhite" })
	highlight(0, "@module.builtin", { link = "ZiggyGreen" })
	highlight(0, "@none", {})
	highlight(0, "@parameter.builtin", { link = "ZiggyRed" })
	highlight(0, "@property", { link = "ZiggyGrey89" })
	highlight(0, "@string.documentation", { link = "ZiggyGreen" })
	highlight(0, "@string.regexp", { link = "ZiggyGreen" })
	highlight(0, "@string.special.path", { link = "ZiggyGreen" })
	highlight(0, "@string.special.symbol", { link = "ZiggyGreen" })
	highlight(0, "@string.special.url", { link = "ZiggyGreen" })
	highlight(0, "@tag", { link = "ZiggyOrange" })
	highlight(0, "@tag.attribute", { link = "ZiggyOrange" })
	highlight(0, "@tag.builtin", { link = "ZiggyOrange" })
	highlight(0, "@tag.delimiter", { link = "ZiggyOrange" })
	highlight(0, "@type.builtin", { fg = blue, bold = true })
	highlight(0, "@type.qualifier", { fg = blue, bold = true })
	highlight(0, "@variable", { link = "ZiggyGrey89" })
	highlight(0, "@variable.builtin", { link = "ZiggyOrange" })
	highlight(0, "@variable.member", { link = "ZiggyGrey89" })
	highlight(0, "@variable.parameter", { link = "ZiggyGrey89" })

	-- Language specific Tree-sitter overrides.
	highlight(0, "@attribute.zig", { link = "ZiggyDarkMagenta" })
	highlight(0, "@character.special.vim", { link = "ZiggyBlue" })
	highlight(0, "@function.macro.vim", { link = "ZiggyBlue" })
	highlight(0, "@keyword.gitcommit", { link = "ZiggyBlue" })
	highlight(0, "@keyword.import.bash", { link = "@keyword" })
	highlight(0, "@keyword.import.rust", { link = "@keyword" })
	highlight(0, "@keyword.storage.rust", { link = "ZiggyDarkMagenta" })
	highlight(0, "@markup.heading.1.markdown", { link = "ZiggyDarkCyan" })
	highlight(0, "@markup.heading.1.vimdoc", { link = "ZiggyBlue" })
	highlight(0, "@markup.heading.2.markdown", { link = "ZiggyDarkMagenta" })
	highlight(0, "@markup.heading.2.vimdoc", { link = "ZiggyBlue" })
	highlight(0, "@markup.heading.3.markdown", { link = "ZiggyCyan" })
	highlight(0, "@markup.heading.4.markdown", { link = "ZiggyYellow" })
	highlight(0, "@markup.heading.5.markdown", { link = "ZiggyBlue" })
	highlight(0, "@markup.heading.6.markdown", { link = "ZiggyDarkMagenta" })
	highlight(0, "@markup.heading.help", { link = "ZiggyBlue" })
	highlight(0, "@markup.heading.markdown", { link = "ZiggyBlue" })
	highlight(0, "@markup.link.gitcommit", { link = "ZiggyBlue" })
	highlight(0, "@markup.link.markdown_inline", {})
	highlight(0, "@markup.link.url.gitcommit", { link = "ZiggyDarkCyan" })
	highlight(0, "@markup.link.url.astro", { fg = dark_magenta, italic = true })
	highlight(0, "@markup.link.url.html", { fg = dark_magenta, italic = true })
	highlight(
		0,
		"@markup.link.url.svelte",
		{ fg = dark_magenta, italic = true }
	)
	highlight(0, "@markup.link.url.vue", { fg = dark_magenta, italic = true })
	highlight(0, "@markup.list.latex", { link = "ZiggyMagenta" })
	highlight(0, "@markup.raw.vimdoc", { link = "ZiggyRed" })
	highlight(0, "@namespace.latex", { link = "ZiggyDarkMagenta" })
	highlight(0, "@punctuation.delimiter.astro", { link = "ZiggyGrey89" })
	highlight(0, "@punctuation.delimiter.css", { link = "ZiggyGrey89" })
	highlight(0, "@punctuation.delimiter.rust", { link = "ZiggyGrey89" })
	highlight(0, "@punctuation.delimiter.scss", { link = "ZiggyGrey89" })
	highlight(0, "@punctuation.delimiter.yaml", { link = "ZiggyGrey89" })
	highlight(0, "@variable.builtin.vim", { link = "ZiggyDarkCyan" })
	highlight(0, "@variable.member.yaml", { link = "ZiggyBlue" })
	highlight(0, "@variable.parameter.bash", { link = "ZiggyWhite" })
	highlight(0, "@variable.scss", { link = "ZiggyCyan" })
	highlight(0, "@variable.vim", { link = "ZiggyCyan" })

	-- Neovim LSP semantic highlights.
	highlight(0, "@lsp.type.boolean", { link = "@boolean" })
	highlight(0, "@lsp.type.builtinConstant", { link = "@constant.builtin" })
	highlight(0, "@lsp.type.builtinType", { link = "@type.builtin" })
	highlight(0, "@lsp.type.class", { link = "@type" })
	highlight(0, "@lsp.type.enum", { link = "@type" })
	highlight(0, "@lsp.type.enumMember", { link = "@constant" })
	highlight(0, "@lsp.type.escapeSequence", { link = "@string.escape" })
	highlight(0, "@lsp.type.formatSpecifier", { link = "@punctuation.special" })
	highlight(0, "@lsp.type.generic", { link = "@variable" })
	highlight(0, "@lsp.type.interface", { link = "@type" })
	highlight(0, "@lsp.type.keyword", { link = "@keyword" })
	highlight(0, "@lsp.type.lifetime", { link = "@storageclass" })
	highlight(0, "@lsp.type.macro", {}) -- Use fallback Tree-sitter style for this Semantic Token
	highlight(0, "@lsp.type.magicFunction", { link = "ZiggyGrey89" })
	highlight(0, "@lsp.type.namespace", { link = "@namespace" })
	highlight(0, "@lsp.type.number", { link = "@number" })
	highlight(0, "@lsp.type.operator", {}) -- Use fallback Tree-sitter style for this Semantic Token
	highlight(0, "@lsp.type.parameter", { link = "@parameter" })
	highlight(0, "@lsp.type.property", { link = "@property" })
	highlight(0, "@lsp.type.selfKeyword", { link = "@variable.builtin" })
	highlight(0, "@lsp.type.selfParameter", { link = "@variable.builtin" })
	highlight(0, "@lsp.type.string", { link = "@string" })
	highlight(0, "@lsp.type.struct", { link = "@type" })
	highlight(0, "@lsp.type.typeAlias", { link = "@type.definition" })
	highlight(
		0,
		"@lsp.type.unresolvedReference",
		{ undercurl = true, sp = red }
	)
	highlight(0, "@lsp.type.variable", {}) -- Use fallback Tree-sitter style for this Semantic Token
	highlight(0, "@lsp.typemod.class.defaultLibrary", { link = "@type" })
	highlight(0, "@lsp.typemod.enum.defaultLibrary", { link = "@type" })
	highlight(
		0,
		"@lsp.typemod.enumMember.defaultLibrary",
		{ link = "@constant.builtin" }
	)
	highlight(
		0,
		"@lsp.typemod.function.defaultLibrary",
		{ link = "ZiggyGrey89" }
	)
	highlight(0, "@lsp.typemod.keyword.async", { link = "@keyword" })
	highlight(0, "@lsp.typemod.keyword.injected", { link = "@keyword" })
	highlight(0, "@lsp.typemod.method.defaultLibrary", { link = "ZiggyGrey89" })
	highlight(0, "@lsp.typemod.operator.injected", { link = "@operator" })
	highlight(0, "@lsp.typemod.string.injected", { link = "@string" })
	highlight(0, "@lsp.typemod.struct.defaultLibrary", { link = "@type" })
	highlight(0, "@lsp.typemod.variable.callable", { link = "ZiggyGrey89" })
	highlight(
		0,
		"@lsp.typemod.variable.defaultLibrary",
		{ link = "@variable.builtin" }
	)
	highlight(0, "@lsp.typemod.variable.injected", { link = "@variable" })
	highlight(0, "@lsp.typemod.variable.static", { link = "@constant" })
	-- Language specific LSP semantic overrides.
	highlight(0, "@lsp.type.decorator.rust", { link = "@function.macro" })
	highlight(0, "@lsp.type.namespace.ruby", {})
	highlight(0, "@lsp.type.parameter.dockerfile", { link = "@property" })
	highlight(0, "@lsp.type.variable.dockerfile", { link = "@function" })

	-- Neovim Diagnostic
	highlight(0, "DiagnosticError", { link = "ZiggyRed" })
	highlight(0, "DiagnosticWarn", { link = "ZiggyYellow" })
	highlight(0, "DiagnosticInfo", { link = "ZiggyBlue" })
	highlight(0, "DiagnosticHint", { link = "ZiggyCyan" })
	highlight(0, "DiagnosticOk", { link = "ZiggyDarkCyan" })
	highlight(0, "DiagnosticUnderlineError", { undercurl = true, sp = red })
	highlight(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = yellow })
	highlight(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = blue })
	highlight(0, "DiagnosticUnderlineHint", { undercurl = true, sp = cyan })
	highlight(0, "DiagnosticUnderlineOk", { undercurl = true, sp = dark_cyan })
	highlight(0, "DiagnosticVirtualTextError", { bg = grey23, fg = red })
	highlight(0, "DiagnosticVirtualTextWarn", { bg = grey23, fg = grey50 })
	highlight(0, "DiagnosticVirtualTextInfo", { bg = grey23, fg = grey62 })
	highlight(0, "DiagnosticVirtualTextHint", { bg = grey23, fg = cyan })
	highlight(0, "DiagnosticVirtualTextOk", { bg = grey23, fg = dark_cyan })
	highlight(0, "DiagnosticSignError", { link = "ZiggyRed" })
	highlight(0, "DiagnosticSignWarn", { link = "ZiggyYellow" })
	highlight(0, "DiagnosticSignInfo", { link = "ZiggyBlue" })
	highlight(0, "DiagnosticSignHint", { link = "ZiggyCyan" })
	highlight(0, "DiagnosticSignOk", { link = "ZiggyDarkCyan" })
	highlight(0, "DiagnosticFloatingError", { link = "ZiggyRed" })
	highlight(0, "DiagnosticFloatingWarn", { link = "ZiggyYellow" })
	highlight(0, "DiagnosticFloatingInfo", { link = "ZiggyBlue" })
	highlight(0, "DiagnosticFloatingHint", { link = "ZiggyCyan" })
	highlight(0, "DiagnosticFloatingOk", { link = "ZiggyDarkCyan" })

	-- Neovim LSP
	highlight(0, "LspCodeLens", { link = "ZiggyGrey39" })
	highlight(0, "LspCodeLensSeparator", { link = "ZiggyGrey39" })
	highlight(0, "LspInfoBorder", { link = "FloatBorder" })
	highlight(0, "LspInlayHint", { bg = grey11, fg = grey58 })
	highlight(0, "LspReferenceText", { link = "ZiggyVisual" })
	highlight(0, "LspReferenceRead", { link = "ZiggyVisual" })
	highlight(0, "LspReferenceWrite", { link = "ZiggyVisual" })
	highlight(0, "LspSignatureActiveParameter", { bg = grey18 })

	-------------------------------------------------------------------------
	-- Legacy language styling
	-------------------------------------------------------------------------

	-- CSV
	highlight(0, "csvCol0", { link = "ZiggyRed" })
	highlight(0, "csvCol1", { link = "ZiggyYellow" })
	highlight(0, "csvCol2", { link = "ZiggyYellow" })
	highlight(0, "csvCol3", { link = "ZiggyGreen" })
	highlight(0, "csvCol4", { link = "ZiggyCyan" })
	highlight(0, "csvCol5", { link = "ZiggyBlue" })
	highlight(0, "csvCol6", { link = "ZiggyMagenta" })
	highlight(0, "csvCol7", { link = "ZiggyDarkMagenta" })
	highlight(0, "csvCol8", { link = "ZiggyDarkMagenta" })

	-- Help
	highlight(0, "helpCommand", { link = "ZiggyRed" })
	highlight(0, "helpExample", { link = "ZiggyGreen" })
	highlight(0, "helpHeadline", { link = "ZiggyBlue" })
	highlight(0, "helpHyperTextEntry", { link = "ZiggyCyan" })
	highlight(0, "helpSectionDelim", { link = "ZiggyBlue" })

	-- LaTeX
	highlight(0, "texBeginEndName", { link = "ZiggyDarkCyan" })
	highlight(0, "texCite", { link = "ZiggyGreen" })
	highlight(0, "texDocType", { link = "ZiggyRed" })
	highlight(0, "texDocTypeArgs", { link = "ZiggyRed" })
	highlight(0, "texInputFile", { link = "String" })
	highlight(0, "texMathZoneC", { link = "ZiggyBlue" })
	highlight(0, "texMathZoneX", { link = "ZiggyBlue" })
	highlight(0, "texRefZone", { link = "ZiggyGreen" })
	highlight(0, "texSection", { link = "ZiggyDarkMagenta" })
	highlight(0, "texTypeStyle", { link = "ZiggyYellow" })
	highlight(0, "texZone", { link = "ZiggyDarkMagenta" })

	-- Man
	highlight(0, "manHeader", { link = "ZiggyDarkCyan" })
	highlight(0, "manOptionDesc", { link = "ZiggyRed" })
	highlight(0, "manReference", { link = "ZiggyGreen" })
	highlight(0, "manSectionHeading", { link = "ZiggyBlue" })
	highlight(0, "manSubHeading", { link = "ZiggyCyan" })

	-- Markdown, 'tpope/vim-markdown' plugin
	highlight(0, "markdownBold", { link = "ZiggyYellow" })
	highlight(0, "markdownCode", { link = "ZiggyDarkYellow" })
	highlight(0, "markdownCodeDelimiter", { link = "ZiggyDarkYellow" })
	highlight(0, "markdownError", { link = "NormalNC" })
	highlight(0, "markdownH1", { link = "ZiggyDarkCyan" })
	highlight(0, "markdownH2", { link = "ZiggyBlue" })
	highlight(0, "markdownH3", { link = "ZiggyCyan" })
	highlight(0, "markdownHeadingRule", { link = "ZiggyRed" })
	highlight(0, "markdownItalic", { fg = red, italic = true })
	highlight(0, "markdownUrl", { link = "ZiggyMagenta" })

	-- Markdown, 'plasticboy/vim-markdown' plugin
	highlight(0, "mkdDelimiter", { link = "ZiggyWhite" })
	highlight(0, "mkdLineBreak", { link = "NormalNC" })
	highlight(0, "mkdListItem", { link = "ZiggyBlue" })
	highlight(0, "mkdURL", { link = "ZiggyMagenta" })

	-- Shell
	highlight(0, "shAlias", { link = "ZiggyCyan" })
	highlight(0, "shCommandSub", { link = "ZiggyWhite" })
	highlight(0, "shCtrlSeq", { link = "ZiggyDarkYellow" })
	highlight(0, "shLoop", { link = "ZiggyDarkMagenta" })
	highlight(0, "shRange", { link = "ZiggyWhite" })
	highlight(0, "shSetList", { link = "ZiggyCyan" })
	highlight(0, "shShellVariables", { link = "ZiggyMagenta" })
	highlight(0, "shVariable", { link = "ZiggyMagenta" })

	-- XML
	highlight(0, "xmlAttrib", { link = "ZiggyGreen" })
	highlight(0, "xmlEndTag", { link = "ZiggyBlue" })
	highlight(0, "xmlTag", { link = "ZiggyGreen" })
	highlight(0, "xmlTagName", { link = "ZiggyBlue" })

	-------------------------------------------------------------------------
	-- Legacy plugin styling
	-------------------------------------------------------------------------

	-- Git commits
	highlight(0, "gitCommitBranch", { link = "ZiggyBlue" })
	highlight(0, "gitCommitDiscardedFile", { link = "ZiggyDarkRed" })
	highlight(0, "gitCommitDiscardedType", { link = "ZiggyBlue" })
	highlight(0, "gitCommitHeader", { link = "ZiggyMagenta" })
	highlight(0, "gitCommitSelectedFile", { link = "ZiggyDarkCyan" })
	highlight(0, "gitCommitSelectedType", { link = "ZiggyBlue" })
	highlight(0, "gitCommitUntrackedFile", { link = "ZiggyRed" })
	highlight(0, "gitEmail", { link = "ZiggyBlue" })

	-- Git commit diffs
	highlight(0, "diffAdded", { link = "ZiggyGreen" })
	highlight(0, "diffChanged", { link = "ZiggyDarkRed" })
	highlight(0, "diffIndexLine", { link = "ZiggyDarkRed" })
	highlight(0, "diffLine", { link = "ZiggyBlue" })
	highlight(0, "diffRemoved", { link = "ZiggyRed" })
	highlight(0, "diffSubname", { link = "ZiggyBlue" })

	-- Tagbar plugin
	highlight(0, "TagbarFoldIcon", { link = "ZiggyGrey62" })
	highlight(0, "TagbarVisibilityPublic", { link = "ZiggyGreen" })
	highlight(0, "TagbarVisibilityProtected", { link = "ZiggyGreen" })
	highlight(0, "TagbarVisibilityPrivate", { link = "ZiggyGreen" })
	highlight(0, "TagbarKind", { link = "ZiggyDarkCyan" })

	-- fern.vim plugin
	highlight(0, "FernBranchSymbol", { link = "ZiggyGrey58" })
	highlight(0, "FernLeafSymbol", { link = "ZiggyBlue" })
	highlight(0, "FernLeaderSymbol", { link = "ZiggyGrey23" })
	highlight(0, "FernBranchText", { link = "ZiggyBlue" })
	highlight(0, "FernMarkedLine", { link = "ZiggyVisual" })
	highlight(0, "FernMarkedText", { link = "ZiggyDarkRed" })
	highlight(0, "FernRootSymbol", { link = "ZiggyMagenta" })
	highlight(0, "FernRootText", { link = "ZiggyMagenta" })

	-- fern-git-status.vim plugin
	highlight(0, "FernGitStatusBracket", { link = "ZiggyGrey58" })
	highlight(0, "FernGitStatusIndex", { link = "ZiggyDarkCyan" })
	highlight(0, "FernGitStatusWorktree", { link = "ZiggyDarkRed" })

	-- Glyph palette
	highlight(0, "GlyphPalette1", { link = "ZiggyRed" })
	highlight(0, "GlyphPalette2", { link = "ZiggyDarkCyan" })
	highlight(0, "GlyphPalette3", { link = "ZiggyYellow" })
	highlight(0, "GlyphPalette4", { link = "ZiggyBlue" })
	highlight(0, "GlyphPalette6", { link = "ZiggyCyan" })
	highlight(0, "GlyphPalette7", { link = "ZiggyWhite" })
	highlight(0, "GlyphPalette9", { link = "ZiggyDarkRed" })

	-- Misc items
	highlight(0, "bufExplorerHelp", { link = "ZiggyGrey62" })
	highlight(0, "bufExplorerSortBy", { link = "ZiggyGrey62" })
	highlight(0, "CleverFDefaultLabel", { link = "ZiggyDarkRed" })
	highlight(0, "CtrlPMatch", { link = "ZiggyRed" })
	highlight(0, "Directory", { link = "ZiggyBlue" })
	highlight(0, "erubyDelimiter", { link = "ZiggyDarkRed" })
	highlight(0, "jsonKeyword", { link = "ZiggyBlue" })
	highlight(0, "jsonQuote", { link = "ZiggyWhite" })
	highlight(0, "netrwClassify", { link = "ZiggyRed" })
	highlight(0, "netrwDir", { link = "ZiggyBlue" })
	highlight(0, "netrwExe", { link = "ZiggyDarkYellow" })
	highlight(0, "tagName", { link = "ZiggyCyan" })
	highlight(0, "Cheat40Header", { link = "ZiggyBlue" })
	highlight(0, "yamlBlockMappingKey", { link = "ZiggyBlue" })
	highlight(0, "yamlFlowMappingKey", { link = "ZiggyBlue" })
	highlight(0, "MatchWord", { underline = true, sp = red })
	highlight(0, "snipLeadingSpaces", { bg = bg, fg = white })
	highlight(0, "MatchWordCur", { bg = bg })
	highlight(0, "fishInnerVariable", { link = "ZiggyCyan" })
	highlight(0, "fishParameter", { link = "ZiggyCyan" })
	highlight(0, "fishVariable", { link = "ZiggyCyan" })

	-- FZF plugin
	highlight(0, "FzfBorder", { link = "ZiggyGrey18" })
	highlight(0, "FzfFgPlus", { link = "ZiggyGrey89" })
	highlight(0, "FzfNormal", { link = "ZiggyGrey70" })
	highlight(0, "FzfPrompt", { fg = blue, bg = grey18 })
	highlight(0, "FzfSubstring", { link = "ZiggyRed" })
	g.fzf_colors = {
		["fg"] = { "fg", "FzfNormal" },
		["bg"] = { "bg", "Normal" },
		["hl"] = { "fg", "FzfSubstring" },
		["fg+"] = { "fg", "FzfFgPlus" },
		["bg+"] = { "bg", "Pmenu" },
		["hl+"] = { "fg", "FzfSubstring" },
		["info"] = { "fg", "String" },
		["border"] = { "fg", "FzfBorder" },
		["prompt"] = { "fg", "FzfPrompt" },
		["pointer"] = { "fg", "Exception" },
		["marker"] = { "fg", "FzfSubstring" },
		["spinner"] = { "fg", "Type" },
		["header"] = { "fg", "CursorLineNr" },
		["gutter"] = { "bg", "Normal" },
	}

	-- mistfly-statusline plugin
	highlight(0, "MistflyNormal", { link = "ZiggyBlueMode" })
	highlight(0, "MistflyInsert", { link = "ZiggyDarkCyanMode" })
	highlight(0, "MistflyVisual", { link = "ZiggyMagentaMode" })
	highlight(0, "MistflyCommand", { link = "ZiggyYellowMode" })
	highlight(0, "MistflyReplace", { link = "ZiggyDarkRedMode" })

	-- Coc plugin
	highlight(0, "CocInlayHint", { link = "LspInlayHint" })
	highlight(0, "CocSemTypeBuiltin", { link = "ZiggyRed" })
	highlight(0, "CocSemTypeClass", { link = "ZiggyDarkCyan" })
	highlight(0, "CocSemTypeEnumMember", { link = "ZiggyCyan" })
	highlight(0, "CocSemTypeNamespace", { link = "ZiggyCyan" })
	highlight(0, "CocSemTypeParameter", { link = "ZiggyRed" })
	highlight(0, "CocSemTypeProperty", { link = "ZiggyDarkMagenta" })
	highlight(0, "CocSemTypeRegexp", { link = "ZiggyCyan" })
	highlight(0, "CocSemTypeStruct", { link = "ZiggyDarkCyan" })
	highlight(0, "CocSemTypeTypeParameter", { link = "ZiggyRed" })
	highlight(0, "CocUnusedHighlight", { link = "ZiggyGrey70" })

	-------------------------------------------------------------------------
	-- Neovim plugin styling
	-------------------------------------------------------------------------

	-- nvim-treesitter-context
	highlight(0, "TreesitterContext", { bg = grey7 })
	highlight(0, "TreesitterContextBottom", { underline = true, sp = grey18 })

	-- NvimTree plugin
	highlight(0, "NvimTreeFolderIcon", { link = "ZiggyGrey58" })
	highlight(0, "NvimTreeFolderName", { link = "ZiggyBlue" })
	highlight(0, "NvimTreeIndentMarker", { link = "ZiggyGrey23" })
	highlight(0, "NvimTreeOpenedFolderName", { link = "ZiggyBlue" })
	highlight(0, "NvimTreeRootFolder", { link = "ZiggyMagenta" })
	highlight(0, "NvimTreeSpecialFile", { link = "ZiggyYellow" })
	highlight(0, "NvimTreeWindowPicker", { link = "DiffChange" })
	highlight(0, "NvimTreeCursorLine", { link = "ZiggyCurrentLine" })
	highlight(0, "NvimTreeExecFile", { link = "ZiggyGreen" })
	highlight(0, "NvimTreeImageFile", { link = "ZiggyDarkMagenta" })
	highlight(0, "NvimTreeNormalFloat", { bg = bg, fg = grey70 }) -- transparent??
	highlight(0, "NvimTreeOpenedFile", { link = "ZiggyYellow" })
	highlight(0, "NvimTreeSymlink", { link = "ZiggyCyan" })

	-- Neo-tree plugin
	highlight(0, "NeoTreeCursorLine", { link = "ZiggyCurrentLine" })
	highlight(0, "NeoTreeDimText", { link = "ZiggyGrey30" })
	highlight(0, "NeoTreeDirectoryIcon", { link = "ZiggyGrey58" })
	highlight(0, "NeoTreeDotfile", { link = "ZiggyGrey58" })
	highlight(0, "NeoTreeFloatTitle", { link = "FloatTitle" })
	highlight(0, "NeoTreeFilterTerm", { link = "ZiggyBlue" })
	highlight(0, "NeoTreeGitAdded", { link = "ZiggyGreen" })
	highlight(0, "NeoTreeGitConflict", { link = "ZiggyDarkRed" })
	highlight(0, "NeoTreeGitModified", { link = "ZiggyCyan" })
	highlight(0, "NeoTreeGitUntracked", { link = "ZiggyRed" })
	highlight(0, "NeoTreeIndentMarker", { link = "ZiggyGrey23" })
	highlight(0, "NeoTreeMessage", { link = "ZiggyGrey62" })
	highlight(0, "NeoTreeModified", { link = "ZiggyYellow" })
	highlight(0, "NeoTreeRootName", { link = "ZiggyMagenta" })
	highlight(0, "NeoTreeTitleBar", { bg = grey18, fg = white })

	-- Telescope plugin
	highlight(0, "TelescopeBorder", { link = "ZiggyGrey62" })
	-- highlight(0, "TelescopeBorder", { link = "ZiggyStatusLineMode" })
	highlight(0, "TelescopeMatching", { link = "ZiggyRed" })
	highlight(0, "TelescopeMultiIcon", { link = "ZiggyDarkRed" })
	highlight(0, "TelescopeMultiSelection", { link = "ZiggyDarkCyan" })
	highlight(0, "TelescopeNormal", { link = "ZiggyGrey62" })
	-- highlight(0, "TelescopeNormal", { link = "ZiggyStatusLineMode" })
	highlight(0, "TelescopePreviewDate", { link = "ZiggyGrey62" })
	highlight(0, "TelescopePreviewGroup", { link = "ZiggyGrey62" })
	highlight(0, "TelescopePreviewLink", { link = "ZiggyCyan" })
	highlight(0, "TelescopePreviewMatch", { link = "ZiggyVisual" })
	highlight(0, "TelescopePreviewRead", { link = "ZiggyYellow" })
	highlight(0, "TelescopePreviewSize", { link = "ZiggyDarkCyan" })
	highlight(0, "TelescopePreviewUser", { link = "ZiggyGrey62" })
	highlight(0, "TelescopePromptPrefix", { link = "ZiggyBlue" })
	highlight(0, "TelescopeResultsDiffAdd", { link = "ZiggyGreen" })
	highlight(0, "TelescopeResultsDiffChange", { link = "ZiggyRed" })
	highlight(0, "TelescopeResultsDiffDelete", { link = "ZiggyDarkRedLine" })
	highlight(0, "TelescopeResultsSpecialComment", { link = "ZiggyGrey39" })
	highlight(0, "TelescopeSelectionCaret", { bg = bg, fg = dark_red })
	highlight(0, "TelescopeTitle", { link = "ZiggyGrey70" })
	highlight(0, "TelescopeSelection", { bg = grey11, fg = grey89 })

	-- gitsigns.nvim plugin
	--   sign column
	highlight(0, "GitSignsAdd", { link = "ZiggyGreen" })
	highlight(0, "GitSignsAddCul", { link = "TablineSelSymbol" })
	highlight(0, "GitSignsChange", { link = "ZiggyBlue" })
	highlight(0, "GitSignsChangeCul", { bg = grey11, fg = blue })
	highlight(0, "GitSignsChangedelete", { link = "ZiggyRed" })
	highlight(0, "GitSignsChangedeleteCul", { bg = grey11, fg = red })
	highlight(0, "GitSignsDelete", { link = "ZiggyRed" })
	highlight(0, "GitSignsDeleteCul", { bg = grey11, fg = red })
	highlight(0, "GitSignsTopdelete", { link = "ZiggyRed" })
	highlight(0, "GitSignsTopdeleteCul", { link = "GitSignsDeleteCul" })
	highlight(0, "GitSignsUntracked", { link = "ZiggyGrey39" })
	highlight(0, "GitSignsUntrackedCul", { bg = grey11, fg = grey39 })
	--   line highlights
	highlight(0, "GitSignsAddLn", { link = "ZiggyCurrentLine" })
	highlight(0, "GitSignsChangeLn", { bg = grey11 })
	--   word diff
	highlight(0, "GitSignsAddLnInline", { bg = grey1 })
	highlight(0, "GitSignsChangeLnInline", { bg = grey1 })
	--   word diff in preview
	highlight(0, "GitSignsAddInline", { bg = green, fg = bg })
	highlight(0, "GitSignsChangeInline", { bg = yellow, fg = bg })
	highlight(0, "GitSignsDeleteInline", { bg = red, fg = bg })
	--   misc
	highlight(0, "GitSignsAddPreview", { link = "ZiggyDarkCyanLine" })
	highlight(0, "GitSignsDeletePreview", { link = "ZiggyDarkRedLine" })
	highlight(0, "GitSignsDeleteVirtLn", { link = "ZiggyDarkRedLine" })

	-- Hop plugin
	highlight(0, "HopCursor", { link = "IncSearch" })
	highlight(0, "HopNextKey", { link = "ZiggyYellow" })
	highlight(0, "HopNextKey1", { link = "ZiggyBlue" })
	highlight(0, "HopNextKey2", { link = "ZiggyDarkRed" })
	highlight(0, "HopUnmatched", { link = "ZiggyGrey62" })

	-- Barbar plugin
	highlight(0, "BufferCurrent", { link = "ZiggyWhiteLineActive" })
	highlight(0, "BufferCurrentIndex", { link = "ZiggyWhiteLineActive" })
	highlight(0, "BufferCurrentMod", { link = "ZiggyYellowLineActive" })
	highlight(0, "BufferCurrentSign", { link = "ZiggyBlueLineActive" })
	highlight(0, "BufferCurrentERROR", { link = "ZiggyRedLineActive" })
	highlight(0, "BufferCurrentWARN", { link = "ZiggyYellowLineActive" })
	highlight(0, "BufferCurrentINFO", { link = "ZiggyBlueLineActive" })
	highlight(0, "BufferCurrentHINT", { link = "ZiggyCyanLineActive" })
	highlight(0, "BufferTabpages", { bg = grey18, fg = blue })
	highlight(0, "BufferVisible", { link = "ZiggyGrey58Line" })
	highlight(0, "BufferVisibleIndex", { link = "ZiggyGrey58Line" })
	highlight(0, "BufferVisibleMod", { link = "ZiggyYellowLine" })
	highlight(0, "BufferVisibleSign", { link = "ZiggyGrey58Line" })
	highlight(0, "BufferVisibleERROR", { link = "GitSignsDeleteCul" })
	highlight(0, "BufferVisibleWARN", { bg = grey11, fg = yellow })
	highlight(0, "BufferVisibleINFO", { bg = grey11, fg = blue })
	highlight(0, "BufferVisibleHINT", { bg = grey11, fg = cyan })
	highlight(0, "BufferInactive", { bg = grey18, fg = grey58 })
	highlight(0, "BufferInactiveMod", { bg = grey18, fg = yellow })
	highlight(0, "BufferInactiveSign", { bg = grey18, fg = grey62 })
	highlight(0, "BufferInactiveERROR", { bg = grey18, fg = red })
	highlight(0, "BufferInactiveWARN", { bg = grey18, fg = yellow })
	highlight(0, "BufferInactiveINFO", { link = "BufferTabpages" })
	highlight(0, "BufferInactiveHINT", { bg = grey18, fg = cyan })
	highlight(0, "BufferAlternate", { link = "BufferCurrent" })
	highlight(0, "BufferAlternateIndex", { link = "BufferCurrentIndex" })
	highlight(0, "BufferAlternateMod", { link = "BufferCurrentMod" })
	highlight(0, "BufferAlternateSign", { link = "BufferCurrentSign" })
	highlight(0, "BufferAlternateERROR", { link = "BufferCurrentERROR" })
	highlight(0, "BufferAlternateWARN", { link = "BufferCurrentWARN" })
	highlight(0, "BufferAlternateINFO", { link = "BufferCurrentINFO" })
	highlight(0, "BufferAlternateHINT", { link = "BufferCurrentHINT" })

	-- Bufferline plugin
	highlight(0, "BufferLineTabSelected", { link = "ZiggyBlue" })
	highlight(0, "BufferLineIndicatorSelected", { link = "ZiggyBlue" })

	-- nvim-cmp plugin
	highlight(0, "CmpItemAbbrMatch", { link = "ZiggyYellow" })
	highlight(0, "CmpItemAbbrMatchFuzzy", { link = "ZiggyRed" })
	highlight(0, "CmpItemKind", { link = "ZiggyWhite" })
	highlight(0, "CmpItemKindClass", { link = "ZiggyDarkCyan" })
	highlight(0, "CmpItemKindColor", { link = "ZiggyCyan" })
	highlight(0, "CmpItemKindConstant", { link = "ZiggyMagenta" })
	highlight(0, "CmpItemKindConstructor", { link = "ZiggyBlue" })
	highlight(0, "CmpItemKindEnum", { link = "ZiggyDarkMagenta" })
	highlight(0, "CmpItemKindEnumMember", { link = "ZiggyCyan" })
	highlight(0, "CmpItemKindEvent", { link = "ZiggyDarkMagenta" })
	highlight(0, "CmpItemKindField", { link = "ZiggyCyan" })
	highlight(0, "CmpItemKindFile", { link = "ZiggyBlue" })
	highlight(0, "CmpItemKindFolder", { link = "ZiggyBlue" })
	highlight(0, "CmpItemKindFunction", { link = "ZiggyBlue" })
	highlight(0, "CmpItemKindInterface", { link = "ZiggyDarkCyan" })
	highlight(0, "CmpItemKindKeyword", { link = "ZiggyDarkMagenta" })
	highlight(0, "CmpItemKindMethod", { link = "ZiggyBlue" })
	highlight(0, "CmpItemKindModule", { link = "ZiggyDarkCyan" })
	highlight(0, "CmpItemKindOperator", { link = "ZiggyDarkMagenta" })
	highlight(0, "CmpItemKindProperty", { link = "ZiggyCyan" })
	highlight(0, "CmpItemKindReference", { link = "ZiggyCyan" })
	highlight(0, "CmpItemKindSnippet", { link = "ZiggyGreen" })
	highlight(0, "CmpItemKindStruct", { link = "ZiggyDarkCyan" })
	highlight(0, "CmpItemKindText", { link = "ZiggyGrey70" })
	highlight(0, "CmpItemKindTypeParameter", { link = "ZiggyDarkCyan" })
	highlight(0, "CmpItemKindUnit", { link = "ZiggyCyan" })
	highlight(0, "CmpItemKindValue", { link = "ZiggyCyan" })
	highlight(0, "CmpItemKindVariable", { link = "ZiggyCyan" })
	highlight(0, "CmpItemMenu", { link = "ZiggyGrey62" })

	-- Indent Blankline plugin v3 & later
	highlight(0, "IblIndent", { fg = grey15, nocombine = true })
	highlight(0, "IblScope", { fg = dark_magenta, nocombine = true })
	highlight(0, "IblWhitespace", { fg = grey15, nocombine = true })
	-- Indent Blankline plugin v2 & earlier
	highlight(0, "IndentBlanklineChar", { link = "IblIndent" })
	highlight(0, "IndentBlanklineSpaceChar", { link = "IblWhitespace" })
	highlight(
		0,
		"IndentBlanklineSpaceCharBlankline",
		{ link = "IblWhitespace" }
	)

	-- Mini.nvim plugin
	highlight(0, "MiniAnimateNormalFloat", { link = "NormalFloat" })
	highlight(0, "MiniClueBorder", { link = "FloatBorder" })
	highlight(0, "MiniClueDescGroup", { link = "DiagnosticFloatingWarn" })
	highlight(0, "MiniClueDescSingle", { link = "NormalFloat" })
	highlight(0, "MiniClueNextKey", { link = "DiagnosticFloatingHint" })
	highlight(
		0,
		"MiniClueNextKeyWithPostkeys",
		{ link = "DiagnosticFloatingError" }
	)
	highlight(0, "MiniClueSeparator", { link = "DiagnosticFloatingInfo" })
	highlight(0, "MiniClueTitle", { link = "FloatTitle" })
	highlight(0, "MiniCompletionActiveParameter", { link = "ZiggyVisual" })
	highlight(0, "MiniCursorword", { link = "ZiggyUnderline" })
	highlight(0, "MiniCursorwordCurrent", { link = "ZiggyUnderline" })
	highlight(0, "MiniDepsChangeAdded", { link = "diffAdded" })
	highlight(0, "MiniDepsChangeRemoved", { link = "diffRemoved" })
	highlight(0, "MiniDepsHint", { link = "DiagnosticHint" })
	highlight(0, "MiniDepsInfo", { link = "DiagnosticInfo" })
	highlight(0, "MiniDepsMsgBreaking", { link = "DiagnosticWarn" })
	highlight(0, "MiniDepsPlaceholder", { link = "Comment" })
	highlight(0, "MiniDepsTitle", { link = "Title" })
	highlight(0, "MiniDepsTitleError", { link = "ZiggyDarkRedLine" })
	highlight(0, "MiniDepsTitleSame", { link = "DiffText" })
	highlight(0, "MiniDepsTitleUpdate", { link = "DiffAdd" })
	highlight(0, "MiniDiffOverAdd", { link = "DiffAdd" })
	highlight(0, "MiniDiffOverChange", { link = "DiffText" })
	highlight(0, "MiniDiffOverContext", { link = "DiffChange" })
	highlight(0, "MiniDiffOverDelete", { link = "ZiggyDarkRedLine" })
	highlight(0, "MiniDiffSignAdd", { link = "ZiggyDarkCyan" })
	highlight(0, "MiniDiffSignChange", { link = "ZiggyBlue" })
	highlight(0, "MiniDiffSignDelete", { link = "ZiggyRed" })
	highlight(0, "MiniFilesBorder", { link = "FloatBorder" })
	highlight(0, "MiniFilesBorderModified", { link = "DiagnosticFloatingWarn" })
	highlight(0, "MiniFilesCursorLine", { link = "ZiggyCurrentLine" })
	highlight(0, "MiniFilesDirectory", { link = "Directory" })
	highlight(0, "MiniFilesFile", { link = "ZiggyWhite" })
	highlight(0, "MiniFilesNormal", { link = "NormalFloat" })
	highlight(0, "MiniFilesTitle", { link = "FloatTitle" })
	highlight(0, "MiniFilesTitleFocused", { link = "ZiggyDarkCyanLine" })
	highlight(0, "MiniIconsAzure", { link = "ZiggyBlue" })
	highlight(0, "MiniIconsBlue", { link = "ZiggyBlue" })
	highlight(0, "MiniIconsCyan", { link = "ZiggyCyan" })
	highlight(0, "MiniIconsGreen", { link = "ZiggyGreen" })
	highlight(0, "MiniIconsGrey", { link = "ZiggyGrey89" })
	highlight(0, "MiniIconsOrange", { link = "ZiggyYellow" })
	highlight(0, "MiniIconsPurple", { link = "ZiggyMagenta" })
	highlight(0, "MiniIconsRed", { link = "ZiggyDarkRed" })
	highlight(0, "MiniIconsYellow", { link = "ZiggyYellow" })
	highlight(0, "MiniIndentscopePrefix", { link = "ZiggyNoCombine" })
	highlight(0, "MiniIndentscopeSymbol", { link = "ZiggyWhite" })
	highlight(0, "MiniJump", { link = "SpellRare" })
	highlight(0, "MiniJump2dDim", { link = "ZiggyGrey58" })
	highlight(0, "MiniMapNormal", { link = "NormalFloat" })
	highlight(0, "MiniMapSymbolCount", { link = "Special" })
	highlight(0, "MiniMapSymbolLine", { link = "Title" })
	highlight(0, "MiniMapSymbolView", { link = "Delimiter" })
	highlight(0, "MiniNotifyBorder", { link = "FloatBorder" })
	highlight(0, "MiniNotifyNormal", { link = "NormalFloat" })
	highlight(0, "MiniNotifyTitle", { link = "FloatTitle" })
	highlight(0, "MiniOperatorsExchangeFrom", { link = "IncSearch" })
	highlight(0, "MiniPickBorder", { link = "FloatBorder" })
	highlight(0, "MiniPickBorderBusy", { link = "DiagnosticFloatingWarn" })
	highlight(0, "MiniPickBorderText", { link = "FloatTitle" })
	highlight(0, "MiniPickHeader", { link = "DiagnosticFloatingHint" })
	highlight(0, "MiniPickIconDirectory", { link = "Directory" })
	highlight(0, "MiniPickIconFile", { link = "MiniPickNormal" })
	highlight(0, "MiniPickMatchCurrent", { link = "ZiggyCurrentLine" })
	highlight(0, "MiniPickMatchMarked", { link = "DiffAdd" })
	highlight(0, "MiniPickMatchRanges", { link = "DiagnosticFloatingHint" })
	highlight(0, "MiniPickNormal", { link = "NormalFloat" })
	highlight(0, "MiniPickPreviewLine", { link = "CursorLine" })
	highlight(0, "MiniPickPreviewRegion", { link = "IncSearch" })
	highlight(0, "MiniPickPrompt", { link = "DiagnosticFloatingInfo" })
	highlight(0, "MiniStarterCurrent", { link = "ZiggyNoCombine" })
	highlight(0, "MiniStarterFooter", { link = "Title" })
	highlight(0, "MiniStarterHeader", { link = "ZiggyDarkMagenta" })
	highlight(0, "MiniStarterInactive", { link = "Comment" })
	highlight(0, "MiniStarterItem", { link = "Normal" })
	highlight(0, "MiniStarterItemBullet", { link = "Delimiter" })
	highlight(0, "MiniStarterItemPrefix", { link = "ZiggyYellow" })
	highlight(0, "MiniStarterQuery", { link = "ZiggyBlue" })
	highlight(0, "MiniStarterSection", { link = "ZiggyDarkRed" })
	highlight(0, "MiniStatuslineModeCommand", { link = "ZiggyStatusLineMode" })
	highlight(0, "MiniStatuslineModeInsert", { link = "ZiggyStatusLineMode" })
	highlight(0, "MiniStatuslineModeNormal", { link = "ZiggyStatusLineMode" })
	highlight(0, "MiniStatuslineModeOther", { link = "ZiggyStatusLineMode" })
	highlight(0, "MiniStatuslineModeReplace", { link = "ZiggyStatusLineMode" })
	highlight(0, "MiniStatuslineModeVisual", { link = "ZiggyStatusLineMode" })
	highlight(0, "MiniSurround", { link = "IncSearch" })
	highlight(0, "MiniTablineCurrent", { link = "ZiggyWhiteLineActive" })
	highlight(0, "MiniTablineFill", { link = "TabLineFill" })
	highlight(
		0,
		"MiniTablineModifiedCurrent",
		{ link = "ZiggyYellowLineActive" }
	)
	highlight(0, "MiniTablineModifiedVisible", { link = "ZiggyYellowLine" })
	highlight(0, "MiniTablineTabpagesection", { link = "ZiggyBlueMode" })
	highlight(0, "MiniTablineVisible", { link = "ZiggyGrey58Line" })
	highlight(0, "MiniTestEmphasis", { link = "ZiggyUnderline" })
	highlight(0, "MiniTestFail", { link = "ZiggyRed" })
	highlight(0, "MiniTestPass", { link = "ZiggyGreen" })
	highlight(0, "MiniTrailspace", { link = "ZiggyDarkRedMode" })
	highlight(0, "MiniAnimateCursor", { reverse = true, nocombine = true })
	highlight(0, "MiniHipatternsFixme", { fg = bg, bg = red })
	highlight(0, "MiniHipatternsHack", { fg = bg, bg = yellow })
	highlight(0, "MiniHipatternsNote", { fg = bg, bg = blue })
	highlight(0, "MiniHipatternsTodo", { fg = bg, bg = cyan })
	highlight(
		0,
		"MiniJump2dSpot",
		{ fg = yellow, underline = true, nocombine = true }
	)
	highlight(
		0,
		"MiniJump2dSpotAhead",
		{ fg = blue, bg = grey15, nocombine = true }
	)
	highlight(
		0,
		"MiniJump2dSpotUnique",
		{ fg = dark_cyan, underline = true, nocombine = true }
	)
	highlight(0, "MiniStatuslineDevinfo", { link = "ZiggyStatusLineMode" })
	highlight(0, "MiniStatuslineFileinfo", { link = "ZiggyStatusLineMode" })
	highlight(0, "MiniStatuslineFilename", { link = "ZiggyStatusLineMode" })
	highlight(0, "MiniStatuslineInactive", { bg = grey23, fg = grey58 })
	highlight(0, "MiniTablineHidden", { bg = grey18, fg = grey58 })
	highlight(0, "MiniTablineModifiedHidden", { bg = grey18, fg = yellow })

	-- Dashboard plugin
	highlight(0, "DashboardCenter", { link = "ZiggyDarkMagenta" })
	highlight(0, "DashboardFooter", { link = "ZiggyRed" })
	highlight(0, "DashboardHeader", { link = "ZiggyBlue" })
	highlight(0, "DashboardShortCut", { link = "ZiggyCyan" })

	-- nvim-notify plugin
	highlight(0, "NotifyERRORBorder", { link = "FloatBorder" })
	highlight(0, "NotifyWARNBorder", { link = "FloatBorder" })
	highlight(0, "NotifyINFOBorder", { link = "FloatBorder" })
	highlight(0, "NotifyDEBUGBorder", { link = "FloatBorder" })
	highlight(0, "NotifyTRACEBorder", { link = "FloatBorder" })
	highlight(0, "NotifyERRORIcon", { link = "ZiggyRed" })
	highlight(0, "NotifyWARNIcon", { link = "ZiggyYellow" })
	highlight(0, "NotifyINFOIcon", { link = "ZiggyBlue" })
	highlight(0, "NotifyDEBUGIcon", { link = "ZiggyGrey58" })
	highlight(0, "NotifyTRACEIcon", { link = "ZiggyMagenta" })
	highlight(0, "NotifyERRORTitle", { link = "ZiggyRed" })
	highlight(0, "NotifyWARNTitle", { link = "ZiggyYellow" })
	highlight(0, "NotifyINFOTitle", { link = "ZiggyBlue" })
	highlight(0, "NotifyDEBUGTitle", { link = "ZiggyGrey58" })
	highlight(0, "NotifyTRACETitle", { link = "ZiggyMagenta" })

	-- lazy.nvim plugin
	highlight(0, "LazyButton", { bg = grey15, fg = white })
	highlight(0, "LazyButtonActive", { bg = grey30, fg = grey89 })
	highlight(0, "LazyCommit", { link = "ZiggyDarkCyan" })
	highlight(0, "LazyCommitType", { link = "ZiggyDarkMagenta" })
	highlight(0, "LazyH1", { link = "ZiggyBlueMode" })
	highlight(0, "LazyProgressDone", { link = "ZiggyBlue" })
	highlight(0, "LazyProgressTodo", { link = "ZiggyGrey0" })
	highlight(0, "LazyReasonCmd", { link = "ZiggyGreen" })
	highlight(0, "LazyReasonPlugin", { link = "ZiggyRed" })
	highlight(0, "LazyReasonRuntime", { link = "ZiggyDarkMagenta" })
	highlight(0, "LazySpecial", { link = "ZiggyGrey89" })
	highlight(0, "LazyDimmed", { link = "ZiggyGrey58" })

	-- mason.nvim plugin
	highlight(0, "MasonError", { link = "ZiggyRed" })
	highlight(0, "MasonHeader", { link = "ZiggyBlueMode" })
	highlight(0, "MasonHeaderSecondary", { link = "ZiggyBlueMode" })
	highlight(0, "MasonHeading", { link = "ZiggyGrey89" })
	highlight(0, "MasonHighlight", { link = "ZiggyBlue" })
	highlight(0, "MasonHighlightBlock", { link = "ZiggyBlueMode" })
	highlight(0, "MasonHighlightBlockBold", { link = "ZiggyBlueMode" })
	highlight(
		0,
		"MasonHighlightBlockBoldSecondary",
		{ link = "ZiggyDarkCyanMode" }
	)
	highlight(0, "MasonHighlightBlockSecondary", { link = "ZiggyDarkCyanMode" })
	highlight(0, "MasonHighlightSecondary", { link = "ZiggyDarkCyan" })
	highlight(0, "MasonLink", { link = "ZiggyMagenta" })
	highlight(0, "MasonMuted", { link = "ZiggyGrey39" })
	highlight(0, "MasonMutedBlock", { bg = grey15, fg = white })
	highlight(0, "MasonMutedBlockBold", { bg = grey15, fg = grey89 })

	-- linefly plugin
	highlight(0, "LineflyNormal", { link = "ZiggyBlueMode" })
	highlight(0, "LineflyInsert", { link = "ZiggyDarkCyanMode" })
	highlight(0, "LineflyVisual", { link = "ZiggyMagentaMode" })
	highlight(0, "LineflyCommand", { link = "ZiggyYellowMode" })
	highlight(0, "LineflyReplace", { link = "ZiggyDarkRedMode" })

	-- lspsaga.nvim plugin
	highlight(0, "TitleString", { link = "ZiggyBlue" })
	highlight(0, "TitleIcon", { link = "ZiggyBlue" })
	highlight(0, "TitleSymbol", { link = "ZiggyBlue" })
	highlight(0, "SagaBorder", { link = "FloatBorder" })
	highlight(0, "SagaNormal", { link = "Normal" })
	highlight(0, "SagaExpand", { link = "ZiggyRed" })
	highlight(0, "SagaCollapse", { link = "ZiggyRed" })
	highlight(0, "SagaBeacon", { link = "ZiggyMagentaMode" })
	highlight(0, "ActionPreviewTitle", { link = "ZiggyBlue" })
	highlight(0, "CodeActionText", { link = "ZiggyYellow" })
	highlight(0, "CodeActionConceal", { link = "ZiggyGreen" })
	highlight(0, "FinderSelection", { link = "ZiggyCyan" })
	highlight(0, "FinderFName", { link = "ZiggyWhite" })
	highlight(0, "FinderCode", { link = "ZiggyWhite" })
	highlight(0, "FinderIcon", { link = "ZiggyCyan" })
	highlight(0, "FinderType", { link = "ZiggyDarkMagenta" })
	highlight(0, "FinderSpinnerTitle", { link = "ZiggyMagenta" })
	highlight(0, "FinderSpinner", { link = "ZiggyMagenta" })
	highlight(0, "RenameNormal", { link = "ZiggyYellow" })
	highlight(0, "DiagnosticSource", { link = "ZiggyGrey39" })
	highlight(0, "DiagnosticText", { link = "ZiggyRed" })
	highlight(0, "CallHierarchyIcon", { link = "ZiggyDarkMagenta" })
	highlight(0, "CallHierarchyTitle", { link = "ZiggyRed" })
	highlight(0, "SagaShadow", { link = "Normal" })
	highlight(0, "OutlineIndent", { link = "ZiggyMagenta" })

	-- Noice plugin
	highlight(0, "NoiceCmdlinePopup", { link = "ZiggyGrey50" })
	highlight(0, "NoiceCmdlinePopupBorder", { link = "ZiggyGrey27" })
	highlight(0, "NoiceCmdlinePopupBorderSearch", { link = "ZiggyGrey27" })
	highlight(0, "NoiceCmdlinePrompt", { link = "ZiggyBlue" })
	highlight(0, "NoiceCompletionItemKindDefault", { link = "ZiggyCyan" })
	highlight(0, "NoiceConfirmBorder", { link = "ZiggyBlue" })
	highlight(0, "NoiceFormatTitle", { link = "ZiggyRed" })

	-- nvim-navic plugin
	highlight(0, "NavicText", { bg = grey18, fg = grey70 })
	highlight(0, "NavicSeparator", { bg = grey18, fg = white })
	highlight(0, "NavicIconsOperator", { bg = grey18, fg = red })
	highlight(0, "NavicIconsBoolean", { link = "NavicIconsOperator" })
	highlight(0, "NavicIconsClass", { bg = grey18, fg = dark_cyan })
	highlight(0, "NavicIconsConstant", { bg = grey18, fg = yellow })
	highlight(0, "NavicIconsConstructor", { bg = grey18, fg = blue })
	highlight(0, "NavicIconsEnum", { bg = grey18, fg = dark_magenta })
	highlight(0, "NavicIconsEnumMember", { bg = grey18, fg = cyan })
	highlight(0, "NavicIconsEvent", { link = "NavicIconsConstant" })
	highlight(0, "NavicIconsField", { link = "NavicIconsEnumMember" })
	highlight(0, "NavicIconsFile", { bg = grey18, fg = blue })
	highlight(0, "NavicIconsFunction", { link = "NavicIconsConstructor" })
	highlight(0, "NavicIconsInterface", { link = "NavicIconsEnum" })
	highlight(0, "NavicIconsKey", { link = "NavicIconsEnumMember" })
	highlight(0, "NavicIconsMethod", { link = "NavicIconsConstructor" })
	highlight(0, "NavicIconsModule", { link = "NavicIconsEnumMember" })
	highlight(0, "NavicIconsNamespace", { link = "NavicIconsEnumMember" })
	highlight(0, "NavicIconsNull", { bg = grey18, fg = green })
	highlight(0, "NavicIconsNumber", { link = "NavicIconsConstant" })
	highlight(0, "NavicIconsObject", { link = "NavicIconsEnumMember" })
	highlight(0, "NavicIconsPackage", { link = "NavicIconsEnumMember" })
	highlight(0, "NavicIconsProperty", { link = "NavicIconsEnumMember" })
	highlight(0, "NavicIconsString", { bg = grey18, fg = dark_yellow })
	highlight(0, "NavicIconsStruct", { link = "NavicIconsClass" })
	highlight(0, "NavicIconsTypeParameter", { link = "NavicIconsEnumMember" })
	highlight(0, "NavicIconsVariable", { link = "NavicIconsEnumMember" })

	-- Rainbow Delimiters plugin
	highlight(0, "RainbowDelimiterRed", { link = "ZiggyRed" })
	highlight(0, "RainbowDelimiterYellow", { link = "ZiggyYellow" })
	highlight(0, "RainbowDelimiterBlue", { link = "ZiggyBlue" })
	highlight(0, "RainbowDelimiterOrange", { link = "ZiggyYellow" })
	highlight(0, "RainbowDelimiterGreen", { link = "ZiggyGreen" })
	highlight(0, "RainbowDelimiterViolet", { link = "ZiggyDarkMagenta" })
	highlight(0, "RainbowDelimiterCyan", { link = "ZiggyCyan" })

	-- Neogit plugin
	highlight(0, "NeogitBranch", { link = "ZiggyBlue" })
	highlight(0, "NeogitDiffAddHighlight", { link = "ZiggyDarkCyanLine" })
	highlight(0, "NeogitDiffContextHighlight", { bg = grey11 })
	highlight(0, "NeogitDiffDeleteHighlight", { link = "ZiggyDarkRedLine" })
	highlight(0, "NeogitHunkHeader", { link = "Pmenu" })
	highlight(0, "NeogitHunkHeaderHighlight", { link = "ZiggyBlueLineActive" })
	highlight(0, "NeogitRemote", { link = "ZiggyMagenta" })

	-- nvim-window-picker plugin
	highlight(0, "WindowPickerStatusLine", { link = "WinBar" })
	highlight(0, "WindowPickerStatusLineNC", { link = "WinBar" })
	highlight(0, "WindowPickerWinBar", { link = "WinBar" })
	highlight(0, "WindowPickerWinBarNC", { link = "WinBar" })

	-- nvim-dap-ui
	highlight(0, "DapUIBreakpointsCurrentLine", { bg = grey11, fg = green })
	highlight(0, "DapUIBreakpointsDisabledLine", { link = "Comment" })
	highlight(0, "DapUIBreakpointsInfo", { link = "ZiggyBlue" })
	highlight(0, "DapUIBreakpointsPath", { link = "ZiggyCyan" })
	highlight(0, "DapUIDecoration", { link = "ZiggyBlue" })
	highlight(0, "DapUIFloatBorder", { link = "FloatBorder" })
	highlight(0, "DapUILineNumber", { link = "Number" })
	highlight(0, "DapUIModifiedValue", { fg = white, underline = true })
	highlight(0, "DapUIPlayPause", { bg = grey15, fg = green })
	highlight(0, "DapUIRestart", { link = "DapUIPlayPause" })
	highlight(0, "DapUIScope", { link = "ZiggyBlue" })
	highlight(0, "DapUISource", { link = "ZiggyDarkMagenta" })
	highlight(0, "DapUIStepBack", { bg = grey15, fg = cyan })
	highlight(0, "DapUIStepInto", { link = "DapUIStepBack" })
	highlight(0, "DapUIStepOut", { link = "DapUIStepBack" })
	highlight(0, "DapUIStepOver", { link = "DapUIStepBack" })
	highlight(0, "DapUIStop", { bg = grey15, fg = red })
	highlight(0, "DapUIStoppedThread", { link = "ZiggyCyan" })
	highlight(0, "DapUIThread", { link = "ZiggyGreen" })
	highlight(0, "DapUIType", { link = "Type" })
	highlight(0, "DapUIUnavailable", { bg = grey15, fg = grey39 })
	highlight(0, "DapUIWatchesEmpty", { link = "ZiggyRed" })
	highlight(0, "DapUIWatchesError", { link = "ZiggyRed" })
	highlight(0, "DapUIWatchesValue", { link = "ZiggyGreen" })
	highlight(0, "DapUIWinSelect", { link = "ZiggyBlue" })

	-- arrow.nvim
	highlight(0, "ArrowCurrentFile", { link = "ZiggyDarkCyan" })

	-- NvCheatsheet.nvim
	highlight(0, "NvChSection", { link = "Pmenu" })
	highlight(0, "NvChAsciiHeader", { link = "Directory" })
	highlight(0, "NvCheatsheetWhite", { bg = white, fg = grey11 })
	highlight(0, "NvCheatsheetGray", { bg = red, fg = grey11 })
	highlight(0, "NvCheatsheetBlue", { link = "ZiggyBlueMode" })
	highlight(0, "NvCheatsheetCyan", { link = "ZiggyCyanMode" })
	highlight(0, "NvCheatsheetRed", { link = "ZiggyDarkRedMode" })
	highlight(0, "NvCheatsheetGreen", { link = "ZiggyDarkCyanMode" })
	highlight(0, "NvCheatsheetYellow", { link = "ZiggyYellowMode" })
	highlight(0, "NvCheatsheetOrange", { bg = red, fg = grey11 })
	highlight(0, "NvCheatsheetPurple", { link = "ZiggyMagentaMode" })
	highlight(0, "NvCheatsheetMagenta", { bg = dark_magenta, fg = grey11 })

	-- fzf-lua
	highlight(0, "FzfLuaBorder", { link = "FloatBorder" })
	highlight(0, "FzfLuaBufFlagAlt", { link = "ZiggyCyan" })
	highlight(0, "FzfLuaBufFlagCur", { link = "ZiggyYellow" })
	highlight(0, "FzfLuaBufNr", { link = "ZiggyDarkYellow" })
	highlight(0, "FzfLuaFzfHeader", { link = "ZiggyBlue" })
	highlight(0, "FzfLuaFzfInfo", { link = "String" })
	highlight(0, "FzfLuaFzfMarker", { link = "ZiggyRed" })
	highlight(0, "FzfLuaFzfPointer", { link = "ZiggyDarkRed" })
	highlight(0, "FzfLuaFzfPrompt", { link = "ZiggyBlue" })
	highlight(0, "FzfLuaFzfSpinner", { link = "ZiggyDarkCyan" })
	highlight(0, "FzfLuaHeaderBind", { link = "ZiggyGreen" })
	highlight(0, "FzfLuaHeaderText", { link = "ZiggyCyan" })
	highlight(0, "FzfLuaLiveSym", { link = "ZiggyGreen" })
	highlight(0, "FzfLuaPathColNr", { link = "ZiggyBlue" })
	highlight(0, "FzfLuaTabMarker", { link = "ZiggyDarkYellow" })
	highlight(0, "FzfLuaTabTitle", { link = "ZiggyBlue" })
	highlight(0, "FzfLuaTitle", { link = "FloatTitle" })

	-- which-key plugin
	highlight(0, "WhichKeyDesc", { link = "ZiggyGrey89" })
	highlight(0, "WhichKey", { link = "ZiggyGrey89" })
end

-- User customization of theme colors.
--
M.custom_colors = function(colors)
	white = colors.white and colors.white or M.palette.white
	bg = colors.bg and colors.bg or M.palette.bg
	grey0 = colors.grey0 and colors.grey0 or M.palette.grey0
	grey1 = colors.grey1 and colors.grey1 or M.palette.grey1
	grey89 = colors.grey89 and colors.grey89 or M.palette.grey89
	grey70 = colors.grey70 and colors.grey70 or M.palette.grey70
	grey62 = colors.grey62 and colors.grey62 or M.palette.grey62
	grey58 = colors.grey58 and colors.grey58 or M.palette.grey58
	grey50 = colors.grey50 and colors.grey50 or M.palette.grey50
	grey39 = colors.grey39 and colors.grey39 or M.palette.grey39
	grey30 = colors.grey30 and colors.grey30 or M.palette.grey30
	grey27 = colors.grey27 and colors.grey27 or M.palette.grey27
	grey23 = colors.grey23 and colors.grey23 or M.palette.grey23
	grey18 = colors.grey18 and colors.grey18 or M.palette.grey18
	grey15 = colors.grey15 and colors.grey15 or M.palette.grey15
	grey11 = colors.grey11 and colors.grey11 or M.palette.grey11
	grey7 = colors.grey7 and colors.grey7 or M.palette.grey7

	yellow = colors.yellow and colors.yellow or M.palette.yellow
	dark_yellow = colors.dark_yellow and colors.dark_yellow
		or M.palette.dark_yellow
	red = colors.red and colors.red or M.palette.red
	dark_red = colors.dark_red and colors.dark_red or M.palette.dark_red
	green = colors.green and colors.green or M.palette.green
	dark_green = colors.dark_green and colors.dark_green or M.palette.dark_green
	cyan = colors.cyan and colors.cyan or M.palette.cyan
	dark_cyan = colors.dark_cyan and colors.dark_cyan or M.palette.dark_cyan
	blue = colors.blue and colors.blue or M.palette.blue
	dark_blue = colors.dark_blue and colors.dark_blue or M.palette.dark_blue
	magenta = colors.magenta and colors.magenta or M.palette.magenta
	dark_magenta = colors.dark_magenta and colors.dark_magenta
		or M.palette.dark_magenta
	orange = colors.orange and colors.orange or M.palette.orange
end

return M
