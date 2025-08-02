local flash = require "utils.flash"

-- 1 · import symbol under cursor
local function import_symbol()
	local before = vim.b.changedtick
	local w = vim.fn.expand "<cword>"
	vim.lsp.buf.code_action {
		apply = true,
		context = { only = { "quickfix" } },
		filter = function(a)
			return vim.startswith(a.title, "Add import")
		end,
	}
	vim.defer_fn(function()
		if vim.b.changedtick ~= before then
			flash.word(w)
		end
	end, 50)
end

-- 2 · add all missing imports in file
local function add_missing_imports()
	local before_lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	local before_tick = vim.b.changedtick

	vim.lsp.buf.code_action {
		apply = true,
		context = { only = { "source.addMissingImports.ts" } },
	}

	vim.defer_fn(function()
		if vim.b.changedtick == before_tick then
			return
		end 
		local after = vim.api.nvim_buf_get_lines(0, 0, -1, false)
		for i, line in ipairs(after) do
			if line ~= before_lines[i] and line:match "^import " then
				flash.line(i)
			end
		end
	end, 50)
end

return {
	cmd = { "vtsls", "--stdio" },
	filetypes = {
		"typescript",
		"javascript",
		"javascriptreact",
		"typescriptreact",
		"vue",
	},
	on_attach = function(_, buf)
		vim.keymap.set(
			"n",
			"<leader>is",
			import_symbol,
			{ buffer = buf, desc = "Import symbol" }
		)
		vim.keymap.set(
			"n",
			"<leader>ia",
			add_missing_imports,
			{ buffer = buf, desc = "Add imports" }
		)
	end,
}
