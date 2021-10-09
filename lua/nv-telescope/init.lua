local actions = require("telescope.actions")
local ts = require("telescope")

ts.setup({
	file_sorter = require("telescope.sorters").get_fzy_sorter,
	file_previewer = require("telescope.previewers").vim_buffer_cat.new,
	grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
	qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
	mappings = { i = { ["<C-x>"] = false, ["<C-q>"] = actions.send_to_qflist } },
	generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,

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
	},
	path_display = true,
	winblend = 0,
	border = {},
	borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
	use_less = true,
	set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
		bookmarks = {
			-- Available: 'brave', 'google_chrome', 'safari', 'firefox', 'firefox_dev'
			selected_browser = "brave",
			url_open_command = "open",
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
})

ts.load_extension("fzy_native")
-- ts.load_extension("session-lens")
ts.load_extension("bookmarks")
ts.load_extension("media_files")
-- ts.load_extension("node_modules")
--  ts.load_extension("cheat")
ts.load_extension("gh")
ts.load_extension("arecibo")
ts.load_extension("packer")

-- local M = {}
-- M.search_dotfiles = function()
-- require("telescope.builtin").find_files(
-- {prompt_title = "< VimRC >", cwd = "$HOME/"})
-- end

require("colorizer").setup()

-- return M
