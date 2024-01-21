return {
    -- Autocompletion
    "hrsh7th/nvim-cmp",
    dependencies = {
        -- Snippet Engine & its associated nvim-cmp source
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",

        -- Adds LSP completion capabilities
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lua",
        "andersevenrud/cmp-tmux",
        "hrsh7th/cmp-buffer",

        -- Adds a number of user-friendly snippets
        "rafamadriz/friendly-snippets",

        "zbirenbaum/copilot.lua",
        "onsails/lspkind-nvim",
        "zbirenbaum/copilot-cmp",
    },
    config = function()
        local cmp = require "cmp"
        local lspkind = require "lspkind"

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
                -- filetypes = {
                -- 	yaml = false,
                -- 	markdown = false,
                -- 	help = false,
                -- 	gitcommit = false,
                -- 	gitrebase = false,
                -- 	hgcommit = false,
                -- 	svn = false,
                -- 	cvs = false,
                -- 	["."] = false,
                -- },
                copilot_node_command = "node", -- Node version must be < 18
                server_opts_overrides = {},
            }
        end, 100)

        require("copilot_cmp").setup()

        cmp.setup {
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
                end,
            },
            formatting = {
                format = lspkind.cmp_format {
                    mode = "symbol", -- show only symbol annotations
                    maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

                    -- The function below will be called before any actual modifications from lspkind
                    -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                    before = function(entry, vim_item)
                        local menu = ({
                            nvim_lsp = "[lsp]",
                            luasnip = "[snip]",
                            buffer = "[buf]",
                            nvim_lua = "[lua]",
                            treesitter = "[ts]",
                            look = "[look]",
                            spell = "[spell]",
                            neorg = "[neorg]",
                            latex_symbols = "[latex]",
                            calc = "[calc]",
                            crates = "🦀",
                            cmp_git = "[git]",
                            cmp_tabnine = "",
                            copilot = "[cop]",
                            rg = "[rg]",
                            package = "[pack]",
                            fuzzy_path = "[fpath]",
                            tmux = "[tmux]",
                            plugins = "[plugins]",
                            -- buf_lines = "[buf-lines]",
                        })[entry.source.name]

                        if
                            entry.completion_item.data ~= nil
                            and entry.completion_item.data.detail ~= nil
                        then
                            menu = entry.completion_item.data.detail
                                .. " "
                                .. menu
                        end

                        vim_item.menu = menu
                        return vim_item
                    end,
                },
            },
            -- view = {
            -- 	entries = "native", -- can be "custom", "wildmenu" or "native"
            -- },
            mapping = {
                ["<C-n>"] = cmp.mapping(
                    cmp.mapping.select_next_item(),
                    { "i", "c" }
                ),
                ["<C-p>"] = cmp.mapping(
                    cmp.mapping.select_prev_item(),
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
                { name = "copilot",  group_index = 2 },
                { name = "luasnip",  max_item_count = 4,   group_index = 2 },
                -- { name = "nvim_lsp", max_item_count = 100, group_index = 2 },
                { name = "tmux",     max_item_count = 4,   group_index = 2 },
                {
                    name = "buffer",
                    max_item_count = 4,
                    group_index = 2,
                    option = {
                        get_bufnrs = function()
                            return vim.api.nvim_list_bufs()
                        end,
                    },
                },
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
