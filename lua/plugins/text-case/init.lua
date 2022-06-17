require("textcase").setup()

local map = vim.keymap.set
local opts = { silent = true }

-- lower case

map("n", "<Leader>wlc", function()
	require("textcase").current_word "to_lower_case"
end, opts)

map("n", "<Leader>rlc", function()
	require("textcase").lsp_rename "to_lower_case"
end, opts)

map("n", "<Leader>tlc", function()
	require("textcase").operator "to_lower_case"
end, opts)

-- UPPER CASE

map("n", "<Leader>wuc", function()
	require("textcase").current_word "to_upper_case"
end, opts)

map("n", "<Leader>rnu", function()
	require("textcase").lsp_rename "to_upper_case"
end, opts)

map("n", "<Leader>tuc", function()
	require("textcase").operator "to_upper_case"
end, opts)

-- PascalCase

map("n", "<Leader>wpc", function()
	require("textcase").current_word "to_pascal_case"
end, opts)

map("n", "<Leader>rpc", function()
	require("textcase").lsp_rename "to_pascal_case"
end, opts)

map("n", "<Leader>tpc", function()
	require("textcase").operator "to_pascal_case"
end, opts)

-- dash-case

map("n", "<Leader>wdc", function()
	require("textcase").current_word "to_dash_case"
end, opts)

map("n", "<Leader>rdc", function()
	require("textcase").lsp_rename "to_dash_case"
end, opts)

map("n", "<Leader>odc", function()
	require("textcase").operator "to_dash_case"
end, opts)

-- camelCase

map("n", "<Leader>wcc", function()
	require("textcase").current_word "to_camel_case"
end, opts)

map("n", "<Leader>rcc", function()
	require("textcase").lsp_rename "to_camel_case"
end, opts)

map("n", "<Leader>occ", function()
	require("textcase").operator "to_camel_case"
end, opts)

-- CONSTANT_CASE

map("n", "<Leader>wco", function()
	require("textcase").current_word "to_constant_case"
end, opts)

map("n", "<Leader>rco", function()
	require("textcase").lsp_rename "to_constant_case"
end, opts)

map("n", "<Leader>oco", function()
	require("textcase").operator "to_constant_case"
end, opts)
