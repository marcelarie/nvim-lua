return {
	-- {
	-- 	"hrsh7th/nvim-cmp",
	-- 	optional = true,
	-- 	enabled = false,
	-- },
	{
		"saghen/blink.cmp",
		lazy = false, -- lazy loading handled internally
		-- optional: provides snippets for the snippet source
		enabled = false,
		dependencies = {
			"giuxtaposition/blink-cmp-copilot",
			"rafamadriz/friendly-snippets",
			"zbirenbaum/copilot.lua",
		}, -- enabled = false,
		--
		-- -- use a release tag to download pre-built binaries
		-- uild from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- -- build = 'cargo build --release',
		--
		opts = {
			-- Disable for some filetypes
			-- enabled = function()
			-- 	return not vim.tbl_contains(
			-- 		{ "TelescopePrompt" },
			-- 		vim.bo.filetype
			-- 	)
			-- end,

			completion = {
				-- 'prefix' will fuzzy match on the text before the cursor
				-- 'full' will fuzzy match on the text before *and* after the cursor
				-- example: 'foo_|_bar' will match 'foo_' for 'prefix' and 'foo__bar' for 'full'
				keyword = { range = "full" },

				-- Disable auto brackets
				-- NOTE: some LSPs may add auto brackets themselves anyway
				accept = {
					auto_brackets = { enabled = false },
				},

				-- Insert completion item on selection, don't select by default
				list = { selection = "auto_insert" },

				menu = {
					-- Don't automatically show the completion menu
					auto_show = true,

					-- nvim-cmp style menu
					draw = {
						columns = {
							{ "label", "label_description", gap = 1 },
							{ "kind_icon", "kind" },
						},
					},
				},

				-- Show documentation when selecting a completion item
				documentation = { auto_show = true, auto_show_delay_ms = 500 },

				-- Display a preview of the selected item on the current line
				ghost_text = { enabled = true },
			},

			sources = {
				-- Remove 'buffer' if you don't want text completions, by default it's only enabled when LSP returns no items
				-- default = { "lsp", "path", "snippets", "buffer" },
				default = { "copilot", "lsp", "path", "snippets", "buffer" },
				providers = {
					copilot = {
						name = "copilot",
						module = "blink-cmp-copilot",
						score_offset = 100,
						async = true,
						transform_items = function(_, items)
							local CompletionItemKind =
								require("blink.cmp.types").CompletionItemKind
							local kind_idx = #CompletionItemKind + 1
							CompletionItemKind[kind_idx] = "Copilot"
							for _, item in ipairs(items) do
								item.kind = kind_idx
							end
							return items
						end,
					},
				},
				-- Disable cmdline completions
				cmdline = {},
			},

			-- Experimental signature help support
			signature = { enabled = true },
		},

		config = function()
			vim.defer_fn(function()
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
					copilot_node_command = "node", -- Node version must be < 18
					server_opts_overrides = {},
				}

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

			require("blink.cmp").setup()
		end,
	},
}
