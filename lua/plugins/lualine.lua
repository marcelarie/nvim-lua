return {
    -- Set lualine as statusline
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "mrjones2014/lighthaus.nvim",
        "kyazdani42/nvim-web-devicons",
        "folke/lsp-colors.nvim",
    },
    -- See `:help lualine.txt`
    opts = {
        options = {
            icons_enabled = true,
            theme = "lighthaus",
            component_separators = { ".", "." },
            section_separators = { "", "" },
            disabled_filetypes = {},
        },
        sections = {
            lualine_a = {
                {
                    "mode",
                    lower = true,
                    format = function(mode)
                        return mode:sub(1, 1)
                    end,
                },
            },
            lualine_b = { "branch" },
            lualine_c = {
                {
                    "filename",
                    path = 1,
                    file_status = true,
                    icons_enabled = true,
                },
            },
            lualine_d = {},
            lualine_x = {
                "encoding",
                "fileformat",
                "filetype",
            },
            lualine_y = {
                "progress",
            },
            lualine_z = { "location" },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename" },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {},
        extensions = {},
    },
}
