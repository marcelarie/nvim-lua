-- Function to handle grep_string with user input
local function grep_string_prompt()
	require("telescope.builtin").grep_string {
		search = vim.fn.input "grep for > ",
	}
end

-- local function egrepify_string_prompt()
-- 	require("telescope").extensions.egrepify.egrepify {}
-- end

-- Function to handle live_grep
-- local function live_grep()
-- 	require("telescope.builtin").live_grep {}
-- end

local function egrepify()
	require("telescope").extensions.egrepify.egrepify {}
end

-- Function to handle zoxide list
local function zoxide_list()
	require("telescope").extensions.zoxide.list {}
end

-- Function to handle http list
local function http_list()
	require("telescope").extensions.http.list {}
end

local telescope_utilities = require "telescope.utils"
local plenary_strings = require "plenary.strings"
local nvim_web_devicons = require "nvim-web-devicons"
local telescope_make_entry_module = require "telescope.make_entry"
local telescope_entry_display_module = require "telescope.pickers.entry_display"
local builtin = require "telescope.builtin"

local function get_path_and_tail(file_name)
	local buffer_name_tail = telescope_utilities.path_tail(file_name)
	local path_without_tail =
		plenary_strings.truncate(file_name, #file_name - #buffer_name_tail, "")
	local path_to_display = telescope_utilities.transform_path(
		{ path_display = { "truncate" } },
		path_without_tail
	)
	return buffer_name_tail, path_to_display
end

local function create_displayer(file_type_icon_width)
	return telescope_entry_display_module.create {
		separator = " ",
		items = {
			{ width = file_type_icon_width },
			{ width = nil },
			{ remaining = true },
		},
	}
end

local function generate_entry_maker(options)
	local original_entry_maker =
		telescope_make_entry_module.gen_from_quickfix(options)

	options.entry_maker = function(line)
		local original_entry_table = original_entry_maker(line)
		local displayer = create_displayer(
			plenary_strings.strdisplaywidth(
				nvim_web_devicons.get_icon("fname", { default = true })
			)
		)

		original_entry_table.display = function(entry)
			local tail, path_to_display = get_path_and_tail(entry.filename)
			local tail_for_display = tail .. " "
			local icon, icon_highlight = telescope_utilities.get_devicons(tail)
			local coordinates =
				string.format("  %s:%s ", entry.lnum, entry.col)

			return displayer {
				{ icon, icon_highlight },
				tail_for_display .. coordinates,
				{ path_to_display, "TelescopeResultsComment" },
			}
		end
		return original_entry_table
	end
end

local function pretty_lsp_references(local_options)
	if local_options ~= nil and type(local_options) ~= "table" then
		print "Options must be a table."
		return
	end

	local options = local_options or {}
	generate_entry_maker(options)

	builtin.lsp_references(options)
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
		"fdschmidt93/telescope-egrepify.nvim",
		"nvim-telescope/telescope-github.nvim",
		"debugloop/telescope-undo.nvim",
		"benfowler/telescope-luasnip.nvim",
		"nvim-telescope/telescope-media-files.nvim",
		"nvim-telescope/telescope-fzy-native.nvim",
		"nvim-telescope/telescope-symbols.nvim",
		"andrew-george/telescope-themes",
		"dhruvmanila/telescope-bookmarks.nvim",
		"nvim-telescope/telescope-github.nvim",
		-- "barrett-ruth/telescope-http.nvim",
		"cljoly/telescope-repo.nvim",
		"jvgrootveld/telescope-zoxide",
		"ray-x/telescope-ast-grep.nvim",
		"AckslD/nvim-neoclip.lua",
		-- "olimorris/persisted.nvim",
	},
	ft = "alpha",
	config = function()
		local actions = require "telescope.actions"
		local actions_state = require "telescope.actions.state"
		-- local builtin = require "telescope.builtin"
		local ts = require "telescope"

		-- Opens marked items in a quickfix list.
		-- if there are no marked items, it opens all items in a quickfix list.
		local smart_send_to_qflist = function(prompt_bufnr)
			local picker =
				require("telescope.actions.state").get_current_picker(
					prompt_bufnr
				)
			local multi = picker:get_multi_selection()

			if not vim.tbl_isempty(multi) then
				actions.send_selected_to_qflist(prompt_bufnr)
			else
				actions.send_to_qflist(prompt_bufnr)
			end
			actions.open_qflist(prompt_bufnr)
		end

		ts.setup {
			file_sorter = require("telescope.sorters").get_fzy_sorter,
			file_previewer = require("telescope.previewers").vim_buffer_cat.new,
			grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
			qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
			generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,

			defaults = {
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					-- "-l",
				},
				mappings = {
					i = {
						["<C-x>"] = false,
						-- ["<C-q>"] = actions.send_to_qflist, -- default
						["<C-q>"] = smart_send_to_qflist,
					},
					n = {
						["<C-q>"] = smart_send_to_qflist,
					},
				},

				prompt_prefix = " > ",
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

				file_ignore_patterns = {
					"node_modules/.*",
					"%package.json",
					"%package-lock.json",
					"build/.*",
					"coverage/.*",
					"%git/.*",
					"%github/.*",
				},
				-- path_display = true,
				-- path_display = {
				-- 	shorten = {
				-- 		len = 3,
				-- 		exclude = { 1, -1 },
				-- 	},
				-- 	truncate = true,
				-- },
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
			},
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
				find_files = {
					find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
				},
				lsp_references = {

					-- layout_config = {
					-- 	width = 0.55,
					-- 	height = 0.65,
					-- },
				},
			},
		}

		require("browser_bookmarks").setup {
			selected_browser = "firefox",
			url_open_command = "xdg-open",
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
		ts.load_extension "luasnip"
		ts.load_extension "gh"
		-- ts.load_extension "persisted"
		-- ts.load_extension "http"
		ts.load_extension "themes"
		ts.load_extension "undo"
		ts.load_extension "egrepify"
		ts.load_extension "neoclip"

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
		{ "<Leader>km", ":Telescope keymaps<cr>", desc = "Keymaps" },
		{ "<Leader>em", ":Telescope symbols<cr>", desc = "Symbols" },
		{ "<Leader>gr", pretty_lsp_references, desc = "LSP References" },
		{ "<Leader>gs", ":Telescope git_status<cr>", desc = "Git Status" },
		{
			"<Leader>gb",
			":Telescope git_branches<cr>",
			desc = "Git Branches",
		},
		{ "<Leader>tb", builtin.buffers, desc = "Buffers" },
		{ "<leader>rg", grep_string_prompt, desc = "Grep String" },
		{ "<leader>as", ":Telescope AST_grep<cr>", desc = "AST Grep" },
		{ "<leader>tu", ":Telescope undo<cr>", desc = "Telescope undo" },
		{
			"<leader>rw",
			function()
				builtin.grep_string {
					search = vim.fn.expand "<cword>",
				}
			end,
			desc = "Grep Current Word",
		},
		-- { "<leader>r", live_grep, desc = "Live Grep" },
		{
			"<leader>r",
			egrepify,
			desc = "Live Grep (with egrepify)",
		},
		{ "<leader>ht", ":Telescope help_tags<cr>", desc = "Help Tags" },
		{
			"<leader>br",
			function()
				builtin.current_buffer_fuzzy_find {
					default_text = vim.fn.expand "<cword>",
				}
			end,
			desc = "Buffer Fuzzy Find",
		},
		{
			"<leader>bu",
			builtin.current_buffer_fuzzy_find,
			desc = "Buffer Fuzzy Find",
		},
		{
			"<leader>rc",
			function()
				builtin.find_files {
					prompt_title = "< vimrc >",
					cwd = vim.fn.stdpath "config",
				}
			end,
			desc = "Vimrc Files",
		},
		{
			"<leader>nf",
			function()
				builtin.grep_string {
					search = vim.fn.input "grep for > ",
					cwd = "./node_modules",
				}
			end,
			desc = "Node Modules Grep",
		},
		{
			"<leader>nm",
			function()
				builtin.live_grep {
					cwd = "./node_modules",
				}
			end,
			desc = "Node Modules Live Grep",
		},
		{
			"<leader>zo",
			zoxide_list,
			desc = "Zoxide List",
		},
		-- { "<leader>rh", http_list, desc = "HTTP List" },
		{
			"<leader>sy",
			builtin.lsp_document_symbols,
			desc = "Zoxide List",
		},
	},
}
