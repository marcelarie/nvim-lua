-- Function to handle grep_string with user input
local function grep_string_prompt()
	require("telescope.builtin").grep_string {
		search = vim.fn.input "grep for > ",
	}
end

-- Function to handle live_grep
local function live_grep()
	require("telescope.builtin").live_grep {}
end

-- Function to handle zoxide list
local function zoxide_list()
	require("telescope").extensions.zoxide.list {}
end

-- Function to handle http list
local function http_list()
	require("telescope").extensions.http.list {}
end

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- Fuzzy Finder Algorithm which requires local dependencies to be built.
		-- Only load if `make` is available. Make sure you have the system
		-- requirements installed.
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			-- NOTE: If you are having trouble with this installation,
			--       refer to the README for telescope-fzf-native for more instructions.
			build = "make",
			cond = function()
				return vim.fn.executable "make" == 1
			end,
		},
		"nvim-telescope/telescope-github.nvim",
		"debugloop/telescope-undo.nvim",
		"benfowler/telescope-luasnip.nvim",
		"nvim-telescope/telescope-media-files.nvim",
		"nvim-telescope/telescope-fzy-native.nvim",
		"nvim-telescope/telescope-symbols.nvim",
		"andrew-george/telescope-themes",
		"dhruvmanila/telescope-bookmarks.nvim",
		"nvim-telescope/telescope-github.nvim",
		"barrett-ruth/telescope-http.nvim",
		"cljoly/telescope-repo.nvim",
		"jvgrootveld/telescope-zoxide",
		"ray-x/telescope-ast-grep.nvim",
		"AckslD/nvim-neoclip.lua",
		"olimorris/persisted.nvim",
	},
	config = function()
		local actions = require "telescope.actions"
		-- local builtin = require "telescope.builtin"
		local ts = require "telescope"

		ts.setup {
			file_sorter = require("telescope.sorters").get_fzy_sorter,
			file_previewer = require("telescope.previewers").vim_buffer_cat.new,
			grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
			qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
			generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,

			mappings = {
				i = {
					["<C-x>"] = false,
					["<C-q>"] = actions.send_to_qflist,
				},
			},

			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
			},

			prompt_prefix = " >",
			color_devicons = true,

			selection_caret = "-> ",
			entry_prefix = "  ",
			initial_mode = "insert",
			selection_strategy = "reset",
			sorting_strategy = "descending",
			layout_strategy = "horizontal",

			-- layout_config = {
			-- horizontal = {mirror = false},
			-- vertical = {mirror = false},
			-- width = 0.75,
			-- preview_cutoff = 120,
			-- height = 1,
			-- prompt_position = "bottom",
			-- },
			--
			file_ignore_patterns = {
				"node_modules/.*",
				"%package.json",
				"%package-lock.json",
				"build/.*",
				"coverage/.*",
				"%git/.*",
				"%github/.*",
			},
			path_display = true,
			winblend = 0,
			border = {},
			-- defaults = {
			-- 	preview = {
			-- 		treesitter = false,
			-- 		languages = { "perl" },
			-- 	},
			-- },
			borderchars = {
				"─",
				"│",
				"─",
				"│",
				"╭",
				"╮",
				"╯",
				"╰",
			},
			use_less = true,
			set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil
			extensions = {
				-- fzy_native = {
				-- 	override_generic_sorter = false,
				-- 	override_file_sorter = true,
				-- },
				persisted = {
					layout_config = { width = 0.55, height = 0.55 },
				},
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
				bookmarks = {
					-- Available: 'brave', 'google_chrome', 'safari', 'firefox', 'firefox_dev'
					selected_browser = "firefox",

					-- Either provide a shell command to open the URL
					url_open_command = "xdg-open",

					-- Or provide the plugin name which is already installed
					-- Available: 'vim_external', 'open_browser'
					url_open_plugin = nil,
					firefox_profile_name = nil,
				},
				arecibo = {
					["selected_engine"] = "google",
					["url_open_command"] = "xdg-open",
					["show_http_headers"] = false,
					["show_domain_icons"] = true,
				},
				media_files = {
					-- filetypes whitelist
					-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
					filetypes = { "png", "webp", "jpg", "jpeg" },
					find_cmd = "rg", -- find command (defaults to `fd`)
				},
			},
			pickers = {
				live_grep = {
					mappings = {
						i = {
							["<c-f>"] = actions.to_fuzzy_refine,
						},
					},
				},
				colorscheme = {
					enable_preview = true,
				},
			},
		}

		-- ts.load_extension("fzy_native")
		-- ts.load_extension("fzf") -- TODO: check why this is broken
		-- ts.load_extension("session-lens")
		ts.load_extension "bookmarks"
		ts.load_extension "media_files"
		-- ts.load_extension("node_modules")
		--  ts.load_extension("cheat")
		ts.load_extension "gh"
		-- ts.load_extension("arecibo")
		ts.load_extension "zoxide"
		ts.load_extension "repo"
		ts.load_extension "neoclip"
		ts.load_extension "luasnip"
		ts.load_extension "gh"
		ts.load_extension "persisted"
		ts.load_extension "http"
		ts.load_extension "themes"
		ts.load_extension "undo"

		-- local M = {}
		-- M.search_dotfiles = function()
		-- require("telescope.builtin").find_files(
		-- {prompt_title = "< VimRC >", cwd = "$HOME/"})
		-- end

		-- return M
	end,
	keys = {
		{ "<Leader>f", ":Telescope find_files<cr>", desc = "Find Files" },
		{
			"<leader>do",
			":Telescope find_files hidden=true no_ignore=true<cr>",
			desc = "Find Hidden Files",
		},
		{ "<Leader>k", ":Telescope keymaps<cr>", desc = "Keymaps" },
		{ "<Leader>em", ":Telescope symbols<cr>", desc = "Symbols" },
		{
			"<Leader>gr",
			":Telescope lsp_references<cr>",
			desc = "LSP References",
		},
		{ "<Leader>gs", ":Telescope git_status<cr>", desc = "Git Status" },
		{
			"<Leader>gb",
			":Telescope git_branches<cr>",
			desc = "Git Branches",
		},
		{ "<Leader>tb", ":Telescope buffers<cr>", desc = "Buffers" },
		{ "<leader>rg", grep_string_prompt, desc = "Grep String" },
		{ "<leader>as", ":Telescope AST_grep<cr>", desc = "AST Grep" },
		{ "<leader>tu", ":Telescope undo<cr>", desc = "Telescope undo" },
		{
			"<leader>rw",
			function()
				require("telescope.builtin").grep_string {
					search = vim.fn.expand "<cword>",
				}
			end,
			desc = "Grep Current Word",
		},
		{ "<leader>r", live_grep, desc = "Live Grep" },
		{ "<leader>ht", ":Telescope help_tags<cr>", desc = "Help Tags" },
		{
			"<leader>br",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find {
					default_text = vim.fn.expand "<cword>",
				}
			end,
			desc = "Buffer Fuzzy Find",
		},
		{
			"<leader>bu",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find {}
			end,
			desc = "Buffer Fuzzy Find",
		},
		{
			"<leader>rc",
			":Telescope find_files{ prompt_title = '< vimrc >', cwd = '~/.config/nvim/' }<cr>",
			desc = "Vimrc Files",
		},
		{
			"<leader>nf",
			function()
				require("telescope.builtin").grep_string {
					search = vim.fn.input "grep for > ",
					cwd = "./node_modules",
				}
			end,
			desc = "Node Modules Grep",
		},
		{
			"<leader>nm",
			function()
				require("telescope.builtin").live_grep {
					cwd = "./node_modules",
				}
			end,
			desc = "Node Modules Live Grep",
		},
		{ "<leader>zo", zoxide_list, desc = "Zoxide List" },
		{ "<leader>rh", http_list, desc = "HTTP List" },
	},
}
