local function substitute_operator()
	require("substitute").operator()
end

local function substitute_line()
	require("substitute").line()
end

local function substitute_eol()
	require("substitute").eol()
end

local function substitute_visual()
	require("substitute").visual()
end

return {
	"gbprod/substitute.nvim",
	keys = {
		{ "n", "s", substitute_operator, desc = "Substitute Operator" },
		{ "n", "ss", substitute_line, desc = "Substitute Line" },
		{ "n", "S", substitute_eol, desc = "Substitute to End of Line" },
		{ "x", "s", substitute_visual, desc = "Visual Mode Substitute" },
	},
}
