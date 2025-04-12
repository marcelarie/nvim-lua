local function get_plus_than_node(v)
	local node_version
	local home = vim.fn.expand "$HOME"
	local fnm_path = home .. "/.local/share/fnm/node-versions"
	local entries = vim.fn.glob(fnm_path .. "/*", false, true)

	local node_path

	for _, entry in ipairs(entries) do
		local major, minor, patch = entry:match "v(%d+)%.(%d+)%.(%d+)"
		if major and tonumber(major) >= v then
			node_path = entry .. "/installation/bin/node"
			node_version = major .. "." .. minor .. "." .. patch
			break
		end
	end

	return node_path, node_version
end

-- write a function to get the node version from the path

return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = {
		"giuxtaposition/blink-cmp-copilot",
		"rafamadriz/friendly-snippets",
		"L3MON4D3/LuaSnip",
	},

	-- use a release tag to download pre-built binaries
	version = "1.*",
	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
		-- 'super-tab' for mappings similar to vscode (tab to accept)
		-- 'enter' for enter to accept
		-- 'none' for no mappings
		--
		-- All presets have the following mappings:
		-- C-space: Open menu or open docs if already open
		-- C-n/C-p or Up/Down: Select next/previous item
		-- C-e: Hide menu
		-- C-k: Toggle signature help (if signature.enabled = true)
		--
		-- See :h blink-cmp-config-keymap for defining your own keymap
		keymap = { preset = "enter" },

		appearance = {
			-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},

		-- (Default) Only show the documentation popup when manually triggered
		completion = {
			ghost_text = { enabled = true },
			documentation = { auto_show = true },
			list = {
				selection = {
					preselect = true,
					auto_insert = true,
				},
			},
		},

		snippets = { preset = "luasnip" },

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = {
				"lsp",
				"snippets",
				"copilot",
				"path",
				"buffer",
			},
			providers = {
				snippets = {
					min_keyword_length = 2,
					score_offset = 4,
				},
				copilot = {
					min_keyword_length = 3,
					name = "copilot",
					module = "blink-cmp-copilot",
					score_offset = 100,
					async = true,
				},
			},
		},

		-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
		-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
		-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
		--
		-- See the fuzzy documentation for more information
		fuzzy = {
			implementation = "prefer_rust_with_warning",
		},
	},
	opts_extend = { "sources.default" },
	config = function(_, opts)
		vim.defer_fn(function()
			local node_path, node_version = get_plus_than_node(18)
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

			vim.print("Copilot using node v" .. node_version)
			vim.cmd "silent Copilot disable"

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

		require("blink.cmp").setup(opts)
	end,
}
