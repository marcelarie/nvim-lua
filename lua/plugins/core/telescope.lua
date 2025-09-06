-- Simplified Telescope config for minimal startup performance

-- Simple function implementations without complex entry makers
local function grep_string_prompt_with_regex()
	local pattern = vim.fn.input "grep (regex ok) > "
	require("telescope.builtin").live_grep {
		default_text = pattern,
	}
end

local function egrepify()
	require("telescope").extensions.egrepify.egrepify {}
end

local function pretty_lsp_references(local_options)
	local options = local_options or {}
	require("telescope.builtin").lsp_references(options)
end

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	-- Ultra aggressive lazy loading - only load when actually used
	cmd = "Telescope", 
	keys = {
		{ "<Leader>f", ":Telescope find_files<cr>", desc = "Find Files" },
		{ "<leader>rg", desc = "Live Grep" },
		{ "<leader>tb", desc = "Buffers" },
		{ "<leader>do", desc = "Find Hidden Files" },
		{ "<Leader>km", desc = "Keymaps" },
		{ "<Leader>em", desc = "Symbols" },
		{ "<Leader>gr", desc = "LSP References" },
		{ "<Leader>gs", desc = "Git Status" },
		{ "<Leader>gb", desc = "Git Branches" },
		{ "<leader>as", desc = "AST Grep" },
		{ "<leader>tu", desc = "Telescope undo" },
		{ "<leader>rw", desc = "Grep Current Word" },
		{ "<leader>r", desc = "Live Grep (with egrepify)" },
		{ "<leader>ht", desc = "Help Tags" },
		{ "<leader>br", desc = "Buffer Fuzzy Find" },
		{ "<leader>bu", desc = "Buffer Fuzzy Find" },
		{ "<leader>rc", desc = "Vimrc Files" },
		{ "<leader>nf", desc = "Node Modules Grep" },
		{ "<leader>nm", desc = "Node Modules Live Grep" },
		{ "<leader>sy", desc = "Document Symbols" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- Required for telescope icons
		-- Keep only essential extensions for better startup
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable "make" == 1
			end,
		},
		-- Essential extensions only
		"fdschmidt93/telescope-egrepify.nvim",
		"AckslD/nvim-neoclip.lua",
	},
	config = function()
		local actions = require "telescope.actions"
		local builtin = require "telescope.builtin"
		local ts = require "telescope"

		-- Simple send to quickfix function
		local smart_send_to_qflist = function(prompt_bufnr)
			local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
			local multi = picker:get_multi_selection()

			if not vim.tbl_isempty(multi) then
				actions.send_selected_to_qflist(prompt_bufnr)
			else
				actions.send_to_qflist(prompt_bufnr)
			end
			actions.open_qflist(prompt_bufnr)
		end

		ts.setup {
			defaults = {
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
				},
				mappings = {
					i = {
						["<C-x>"] = false,
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
				file_ignore_patterns = {
					"node_modules/.*",
					"%package.json",
					"%package-lock.json", 
					"build/.*",
					"coverage/.*",
					"%.git/.*",
					"%.github/.*",
				},
				winblend = 0,
				border = {},
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
				set_env = { ["COLORTERM"] = "truecolor" },
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
			},
		}

		-- Load only essential extensions
		ts.load_extension "egrepify"
		ts.load_extension "neoclip"
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
		{ "<Leader>tb", function() require("telescope.builtin").buffers() end, desc = "Buffers" },
		{
			"<leader>rg",
			grep_string_prompt_with_regex,
			desc = "Grep String with regex",
		},
		{
			"<leader>rw",
			function()
				require("telescope.builtin").grep_string {
					search = vim.fn.expand "<cword>",
				}
			end,
			desc = "Grep Current Word",
		},
		{
			"<leader>r",
			egrepify,
			desc = "Live Grep (with egrepify)",
		},
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
			function() require("telescope.builtin").current_buffer_fuzzy_find() end,
			desc = "Buffer Fuzzy Find",
		},
		{
			"<leader>rc",
			function()
				require("telescope.builtin").find_files {
					prompt_title = "< vimrc >",
					cwd = vim.fn.stdpath "config",
				}
			end,
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
		{
			"<leader>sy",
			function() require("telescope.builtin").lsp_document_symbols() end,
			desc = "Document Symbols",
		},
	},
}