local actions = require('telescope.actions')
local ts = require('telescope')

ts.setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' >',
        color_devicons = true,

        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {i = {["<C-x>"] = false, ["<C-q>"] = actions.send_to_qflist}},
        vimgrep_arguments = {
            'rg', '--color=never', '--no-heading', '--with-filename',
            '--line-number', '--column', '--smart-case'
        },
        prompt_position = "bottom",
        selection_caret = "> ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_defaults = {
            horizontal = {mirror = false},
            vertical = {mirror = false}
        },
        file_ignore_patterns = {},
        generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
        shorten_path = true,
        winblend = 0,
        width = 0.75,
        preview_cutoff = 120,
        results_height = 1,
        results_width = 0.8,
        border = {},
        borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        use_less = true,
        set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,

        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true
        },
        bookmarks = {
            -- Available: 'brave', 'google_chrome', 'safari', 'firefox', 'firefox_dev'
            selected_browser = 'brave',
            url_open_command = 'open',
            firefox_profile_name = nil
        },
        media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = {"png", "webp", "jpg", "jpeg"},
            find_cmd = "rg" -- find command (defaults to `fd`)
        }
    }
}

ts.load_extension('fzy_native')
ts.load_extension('session-lens')
ts.load_extension('bookmarks')
ts.load_extension('media_files')
ts.load_extension('node_modules')
ts.load_extension('gh')
require'colorizer'.setup()
