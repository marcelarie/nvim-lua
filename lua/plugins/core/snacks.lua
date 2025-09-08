return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		picker = {
			enabled = true,
			win = {
				style = "minimal",
			},
			layout = {
				box = "minimal",
				backdrop = false,
				cycle = false,
				preview = true,
			},
			icons = {
				enabled = false,
			},
			format = {
				file = function(ctx)
					local name = ctx.file
					if ctx.cwd and name:find(ctx.cwd, 1, true) == 1 then
						name = name:sub(#ctx.cwd + 2)
					end
					return name
				end,
			},
		},
		quickfile = { enabled = true },
		statuscolumn = { enabled = false },
		words = { enabled = false },
		bigfile = { enabled = true },
	},
	config = function(_, opts)
		require("snacks").setup(opts)
		vim.api.nvim_set_hl(0, "SnacksPickerNormal", { bg = "#000000" })
		vim.api.nvim_set_hl(
			0,
			"SnacksPickerBorder",
			{ bg = "#000000", fg = "#444444" }
		)
		vim.api.nvim_set_hl(
			0,
			"SnacksPickerTitle",
			{ bg = "#000000", fg = "#ffffff" }
		)
		vim.api.nvim_set_hl(
			0,
			"SnacksPickerInput",
			{ bg = "#000000", fg = "#ffffff" }
		)
		vim.api.nvim_set_hl(0, "SnacksPickerList", { bg = "#111111" })
		vim.api.nvim_set_hl(0, "SnacksPickerPreview", { bg = "#000000" })
	end,
	keys = {
		-- file operations
		{
			"<Leader>f",
			function()
				require("snacks").picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>do",
			function()
				require("snacks").picker.files { hidden = true }
			end,
			desc = "Find Hidden Files",
		},
		{
			"<leader>rc",
			function()
				require("snacks").picker.files { cwd = vim.fn.stdpath "config" }
			end,
			desc = "Config Files",
		},

		-- search and grep
		{
			"<leader>rg",
			function()
				vim.ui.input({ prompt = "Grep input > " }, function(query)
					if query and query ~= "" then
						require("snacks").picker.grep {
							search = query,
							title = "Grep (remember <c-g> to toggle live)",
						}
					end
				end)
			end,
			desc = "Live Grep",
		},
		{
			"<leader>re",
			function()
				require("snacks").picker.grep {
					title = "Grep (remember <c-g> to toggle live)",
				}
			end,
			desc = "Live Grep",
		},
		{
			"<leader>rw",
			function()
				require("snacks").picker.grep_word()
			end,
			desc = "Grep Current Word",
		},
		{
			"<leader>rq",
			function()
				vim.cmd.cclose()
				require("snacks").picker.qflist {
					live = true,
					title = "Quickfix",
				}
			end,
			desc = "Quickfix → Snacks picker",
		},
		{
			"<leader>br",
			function()
				require("snacks").picker.grep_buffers()
			end,
			desc = "Grep Buffers",
		},
		{
			"<leader>bu",
			function()
				require("snacks").picker.grep_buffers()
			end,
			desc = "Buffer Fuzzy Find",
		},

		-- buffers and navigation
		{
			"<leader>tb",
			function()
				require("snacks").picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<Leader>km",
			function()
				require("snacks").picker.keymaps()
			end,
			desc = "Keymaps",
		},
		{
			"<leader>ht",
			function()
				require("snacks").picker.help()
			end,
			desc = "Help Tags",
		},

		-- LSP
		{
			"<Leader>gr",
			function()
				require("snacks").picker.lsp_references()
			end,
			desc = "LSP References",
		},
		{
			"<leader>sy",
			function()
				require("snacks").picker.lsp_symbols()
			end,
			desc = "Document Symbols",
		},

		-- git
		{
			"<Leader>gs",
			function()
				require("snacks").picker.git_status()
			end,
			desc = "Git Status",
		},
		{
			"<Leader>gb",
			function()
				require("snacks").picker.git_branches()
			end,
			desc = "Git Branches",
		},

		-- node modules (TODO: Migrate to snacks)
		-- {
		-- 	"<leader>nf",
		-- 	function()
		-- 		require("snacks").picker.grep {
		-- 			search = vim.fn.input "grep for > ",
		-- 			cwd = "./node_modules",
		-- 		}
		-- 	end,
		-- 	desc = "Node Modules Grep",
		-- },
		-- {
		-- 	"<leader>nm",
		-- 	function()
		-- 		require("snacks").picker.grep { cwd = "./node_modules" }
		-- 	end,
		-- 	desc = "Node Modules Live Grep",
		-- },
	},
}
