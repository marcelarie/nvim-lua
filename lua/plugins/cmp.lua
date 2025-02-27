local function get_plus_18_node()
	local home = vim.fn.expand "$HOME"
	local fnm_path = home .. "/.local/share/fnm/node-versions"
	local entries = vim.fn.glob(fnm_path .. "/*", false, true)

	local node_path

	for _, entry in ipairs(entries) do
		local major, _, _ = entry:match "v(%d+)%.(%d+)%.(%d+)"
		if major and tonumber(major) >= 18 then
			node_path = entry .. "/installation/bin/node"
			break
		end
	end

	return node_path
end

return {
	-- Autocompletion
	-- "iguanacucumber/magazine.nvim", -- Better performance fork. Original --> "hrsh7th/nvim-cmp",
	"hrsh7th/nvim-cmp",
	name = "nvim-cmp", -- Otherwise highlighting gets messed up
	-- enabled = false,
	-- branch = "perf",
	dependencies = {
		-- Snippet Engine & its associated nvim-cmp source
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",

		-- Adds LSP completion capabilities
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		-- "hrsh7th/cmp-nvim-lua",
		-- "andersevenrud/cmp-tmux",
		"hrsh7th/cmp-buffer",

		-- Adds a number of user-friendly snippets
		"rafamadriz/friendly-snippets",

		"zbirenbaum/copilot.lua",
		"zbirenbaum/copilot-cmp",
		-- "mtoohey31/cmp-fish",
	},
	config = function()
		local cmp = require "cmp"

		vim.cmd "set shortmess+=c"
		vim.cmd "let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']"

		local border = {
			{ "╭", "CmpBorder" },
			{ "─", "CmpBorder" },
			{ "╮", "CmpBorder" },
			{ "│", "CmpBorder" },
			{ "╯", "CmpBorder" },
			{ "─", "CmpBorder" },
			{ "╰", "CmpBorder" },
			{ "│", "CmpBorder" },
		}

		vim.defer_fn(function()
			local node_path = get_plus_18_node()
			require("copilot").setup {
				panel = {
					enabled = false,
					auto_refresh = false,
					keymap = {
						jump_prev = "[[",
						jump_next = "]]",
						accept = "<CR>",
						refresh = "gr",
						open = "<M-CR>",
					},
				},
				suggestion = {
					enabled = false,
					auto_trigger = false,
					debounce = 75,
					keymap = {
						accept = "<M-l>",
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-]>",
					},
				},
				filetypes = {
					yaml = true,
					markdown = true,
					-- 	help = false,
					gitcommit = true,
					gitrebase = true,
					-- 	hgcommit = false,
					-- 	svn = false,
					-- 	cvs = false,
					-- 	["."] = false,
					["*"] = true, -- enable for all filetypes
				},
				copilot_node_command = node_path,
				server_opts_overrides = {},
			}

			vim.print("Copilot using node: " .. node_path)
			vim.cmd "Copilot disable"

			vim.keymap.set(
				"n",
				"<leader>ce",
				":Copilot enable<cr>",
				{ noremap = true, silent = false }
			)
			vim.keymap.set(
				"n",
				"<leader>cd",
				":Copilot disable<cr>",
				{ noremap = true, silent = false }
			)
		end, 100)

		require("copilot_cmp").setup()

		cmp.setup {
			formatting = {
				format = require("nvim-highlight-colors").format,
			},
			performance = {
				debounce = 0, -- default is 60ms
				throttle = 0, -- default is 30ms
			},
			window = {
				documentation = {
					border = border,
				},
				-- completion = {
				-- 	border = border,
				-- },
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
					-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
				end,
			},

			preselect = cmp.PreselectMode.None,
			-- view = {
			-- 	entries = "native", -- can be "custom", "wildmenu" or "native"
			-- },
			mapping = {
				["<C-n>"] = cmp.mapping(
					cmp.mapping.select_next_item {
						behavior = cmp.SelectBehavior.Insert,
					},
					{ "i", "c" }
				),
				["<C-p>"] = cmp.mapping(
					cmp.mapping.select_prev_item {
						behavior = cmp.SelectBehavior.Insert,
					},
					{ "i", "c" }
				),
				["<C-d>"] = cmp.mapping(
					cmp.mapping.scroll_docs(-4),
					{ "i", "c" }
				),
				["<C-f>"] = cmp.mapping(
					cmp.mapping.scroll_docs(4),
					{ "i", "c" }
				),
				["<C-Space>"] = cmp.mapping(
					cmp.mapping.complete(),
					{ "i", "c" }
				),
				["<C-e>"] = cmp.mapping {
					i = cmp.mapping.abort(),
					c = cmp.mapping.close(),
				},
				["<CR>"] = cmp.mapping.confirm {
					select = true,
					behavior = cmp.ConfirmBehavior.Replace,
					-- behavior = cmp.ConfirmBehavior.Insert,

					-- behavior = cmp.ConfirmBehavior.Insert,
				},
				-- ["<C-e>"] = cmp.mapping.confirm {
				-- 	select = true,
				-- 	behavior = cmp.ConfirmBehavior.Replace,
				-- 	-- behavior = cmp.ConfirmBehavior.Insert,
				-- },
			},

			experimental = { ghost_text = true },
			sources = {
				{ name = "path" },
				{ name = "copilot" },
				{ name = "luasnip", max_item_count = 10 },
				{ name = "lazydev", group_index = 0 }, -- set group index to 0 to skip loading LuaLS completions
				{ name = "nvim_lsp", max_item_count = 40 },
				{
					name = "buffer",
					max_item_count = 4,
					-- option = {
					-- 	-- Avoid accidentally running on big files
					-- 	get_bufnrs = function()
					-- 		local buf = vim.api.nvim_get_current_buf()
					-- 		local byte_size = vim.api.nvim_buf_get_offset(
					-- 			buf,
					-- 			vim.api.nvim_buf_line_count(buf)
					-- 		)
					-- 		if byte_size > 1024 * 1024 then -- 1 Megabyte max
					-- 			return {}
					-- 		end
					-- 		return { buf }
					-- 	end,
					-- },
				},
				-- { name = "nvim_lua" },
				{ name = "tmux", max_item_count = 4 },
				-- { name = "fish" },
			},
		}

		local tab_mapping_enabled = cmp.mapping.preset.cmdline {}

		-- Use buffer source for `/`.
		cmp.setup.cmdline("/", {
			sources = {
				{ name = "buffer" },
			},
			mapping = tab_mapping_enabled,
		})

		-- Use cmdline & path source for ':'.
		cmp.setup.cmdline(":", {
			sources = {
				{ name = "cmdline" },
			},
			mapping = tab_mapping_enabled,
		})
	end,
}
