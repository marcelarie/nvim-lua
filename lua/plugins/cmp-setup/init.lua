local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0
		and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
				:sub(col, col)
				:match "%s"
			== nil
end

local luasnip = require "luasnip"
local cmp = require "cmp"
local kind = cmp.lsp.CompletionItemKind
local lspkind = require "lspkind"

-- vim.o.completeopt = "menu,menuone,noselect"
vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.cmd "set shortmess+=c"
vim.cmd "let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']"

cmp.setup {
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
					-- buf_lines = "[buf-lines]",
				})[entry.source.name]

				if
					entry.completion_item.data ~= nil
					and entry.completion_item.data.detail ~= nil
				then
					menu = entry.completion_item.data.detail .. " " .. menu
				end

				vim_item.menu = menu
				return vim_item
			end,
		},
	},
	mapping = {
		["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
		["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-e>"] = cmp.mapping {
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		},
		["<CR>"] = cmp.mapping.confirm {
			select = true,
			behavior = cmp.ConfirmBehavior.Replace,
		}, -- <- default
		-- ["<CR>"] = cmp.mapping(function(fallback)
		-- 	if not cmp.confirm({ select = true }) then
		-- 		require("pairs.enter").type()
		-- 	end
		-- end),
	},
	experimental = { ghost_text = true },
	sources = {
		{ name = "path" },
		{ name = "copilot" },
		{ name = "luasnip", max_item_count = 4 },
		{ name = "nvim_lsp", max_item_count = 5 },
		{
			name = "buffer",
			max_item_count = 4,
			option = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end,
			},
		},
	},
}

-- vim.api.nvim_exec(
-- 	[[
--   autocmd FileType markdown,text,tex,gitcommit lua require('cmp').setup.buffer {
--   \   sources = {
--   \ }
-- ]],
-- 	false
-- )

-- Use buffer source for `/`.
require("cmp").setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':'.
require("cmp").setup.cmdline(":", {
	sources = {
		{ name = "cmdline" },
	},
})
