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
        file_ignore_patterns = {
            "node_modules", "yarn.lock", "package-lock.json"
        },
        mappings = {i = {["<C-x>"] = false, ["<C-q>"] = actions.send_to_qflist}}
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true
        },
        media_files = {}
    }
}

ts.load_extension('fzy_native')
ts.load_extension('media_files')
require'colorizer'.setup()
