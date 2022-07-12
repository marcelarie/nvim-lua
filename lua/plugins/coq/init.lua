require "coq_3p" {
	{ src = "nvimlua", short_name = "nLUA" },
	{ src = "copilot", short_name = "COP", accept_key = "<c-f>" },
}

vim.g.coq_settings = {
	auto_start = true,
	clients = {
		tree_sitter = { enabled = false },
		paths = { enabled = true, resolution = { "file" } },
		snippets = { enabled = true, warn = {} },
		tags = { enabled = false },
	},
	keymap = { recommended = false },
	display = {
		preview = {
			positions = { north = 4, south = nil, west = 2, east = 3 },
		},
	},
}
