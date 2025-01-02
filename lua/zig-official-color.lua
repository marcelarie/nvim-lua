local M = {}

local highlight = vim.api.nvim_set_hl

M.colors = {
	-- General colors
	background = "#1e1e1e",
	foreground = "#cccccc",
	comment = "#5c6370",
	cursorline = "#2a2a2a",

	-- Zig-specific colors
	light_yellow = "#e5c07b",
	dark_yellow = "#d19a66",
	blue = "#61afef",
	cyan = "#56b6c2",
	light_red = "#e06c75",
	dark_red = "#be5046",
	magenta = "#c678dd",

	-- Token colors
	keyword = "#eee",
	string = "#22ee55",
	builtin = "#ff894c",
	function_name = "#B1A0F8",
	null = "#ff8080",
	number = "#ff8080",
	type = "#6688ff",
}

function M.setup()
	local colors = M.colors

	vim.cmd "highlight clear"
	vim.o.background = "dark"
	vim.o.termguicolors = true

	local function set_hl(group, opts)
		local fg = opts.fg or "NONE"
		local bg = opts.bg or "NONE"
		local attr = opts.attr or "NONE"
		vim.cmd(
			string.format(
				"highlight %s guifg=%s guibg=%s gui=%s",
				group,
				fg,
				bg,
				attr
			)
		)
	end

	-- Editor Colors
	set_hl("Normal", { fg = colors.foreground, bg = colors.background })
	set_hl("CursorLine", { bg = colors.cursorline })
	set_hl("Comment", { fg = colors.comment, attr = "italic" })

	-- Syntax Highlighting
	set_hl("Keyword", { fg = colors.keyword, attr = "bold" })
	set_hl("String", { fg = colors.string })
	set_hl("Function", { fg = colors.foreground })
	set_hl("Number", { fg = colors.number })
	set_hl("Type", { fg = colors.type, attr = "bold" })
	set_hl("Constant", { fg = colors.light_yellow })
	set_hl("Operator", { fg = colors.light_red })
	set_hl("Builtin", { fg = colors.builtin })
	set_hl("Statement", { fg = colors.builtin, attr = "bold" })
	highlight(0, "@lsp.type.builtinType", { link = "@type.builtin" })

	-- Zig-Specific Colors
	set_hl("ZigString", { fg = colors.string })
	set_hl("ZigVariable", { fg = colors.light_yellow })
	set_hl("ZigFunction", { fg = colors.blue })
	set_hl("ZigBuiltin", { fg = colors.magenta })
	set_hl("ZigOperator", { fg = colors.light_red })
	set_hl("ZigBracket", { fg = colors.cyan })
	set_hl("ZigBlock", { fg = colors.foreground })

	-- UI Elements
	set_hl("LineNr", { fg = colors.comment })
	set_hl("CursorLineNr", { fg = colors.foreground, bg = colors.cursorline })
	set_hl("VertSplit", { fg = colors.comment })
	set_hl("StatusLine", { fg = colors.foreground, bg = colors.cursorline })
	set_hl("StatusLineNC", { fg = colors.comment, bg = colors.cursorline })

	-- Diagnostics
	set_hl("DiagnosticError", { fg = colors.light_red })
	set_hl("DiagnosticWarn", { fg = colors.dark_yellow })
	set_hl("DiagnosticInfo", { fg = colors.blue })
	set_hl("DiagnosticHint", { fg = colors.cyan })
end

return M
