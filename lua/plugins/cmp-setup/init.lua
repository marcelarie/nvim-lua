-- nvim-cmp setup
--  cmp.setup { completion = { autocomplete = { ... } },
--  snippet = { ... },
--  preselect = ...,
--  documentation = { ... }, sorting = { priority_weight = 2., comparators = { ... } },
--  mapping = { ... },
--  sources = { ... },
--  }

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

local tabnine = require "cmp_tabnine.config"
tabnine:setup {
	max_lines = 1000,
	max_num_results = 20,
	sort = true,
	run_on_every_keystroke = true,
	snippet_placeholder = "..",
}

-- vim.o.completeopt = "menu,menuone,noselect"
vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.cmd "set shortmess+=c"
vim.cmd "let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']"

-- cmp.register_source("buf_lines", {
-- 	complete = function(self, request, callback)
-- 		local start_line, end_line = 0, -1
-- 		local opt_context_lines = request.option.context_lines
-- 		if opt_context_lines then
-- 			local cursor_line = request.context.cursor.line
-- 			start_line = math.max(0, cursor_line - opt_context_lines)
-- 			end_line = math.max(0, cursor_line + opt_context_lines)
-- 		end
-- 		local lines = vim.api.nvim_buf_get_lines(request.context.bufnr, start_line, end_line, false)
-- 		local items = {}
-- 		for i = 1, #lines do
-- 			local line = vim.trim(lines[i])
-- 			if #line > 0 and line ~= opt_context_lines then
-- 				items[#items + 1] = { label = line }
-- 			end
-- 		end
-- 		callback({ items = items })
-- 	end,
-- })

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
		["<CR>"] = cmp.mapping.confirm { select = true }, -- <- default
		-- ["<CR>"] = cmp.mapping(function(fallback)
		-- 	if not cmp.confirm({ select = true }) then
		-- 		require("pairs.enter").type()
		-- 	end
		-- end),
	},

	--       local line = vim.trim(lines[i])
	-- ["<Tab>"] = cmp.mapping(function(fallback)
	-- 	if cmp.visible() then
	-- 		cmp.select_next_item()
	-- 	elseif luasnip.expand_or_jumpable() then
	-- 		luasnip.expand_or_jump()
	-- 	elseif has_words_before() then
	-- 		cmp.complete()
	-- 	else
	-- 		fallback()
	-- 	end
	-- end, {
	-- 	"i",
	-- 	"s",
	-- }),
	-- ["<S-Tab>"] = cmp.mapping(function(fallback)
	-- 	if cmp.visible() then
	-- 		cmp.select_prev_item()
	-- 	elseif luasnip.jumpable(-1) then
	-- 		luasnip.jump(-1)
	-- 	else
	-- 		fallback()
	-- 	end
	-- end, {
	-- 	"i",
	-- 	"s",
	-- }),
	experimental = { ghost_text = true },
	sources = {
		-- { name = "package" },
		{ name = "path" },
		{ name = "copilot" },
		-- { name = "cmp_tabnine" },
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
		-- { name = "fuzzy_path", options = { fd_timeout_msec = 1500 } },
		-- { name = "rg", max_item_count = 4 }, { name = "crates" },
		-- { name = "tags" }, { name = "treesitter" },
		-- { name = "nvim_lua" }, { name = "neorg" },
		-- { name = "cmp_git" }, { name = "gh_issues" },
		-- { name = "pack_cmp" }, { name = "zsh" },
		-- { name = "latex_symbols" }, { name = "cmdline" },
		-- { name = "spell" }, { name = "nuspell" },

		--  old snippets
		--   { name = "vsnip" },
		--   { name = "ultisnips" },
	},
}

-- cmp.event:on("confirm_done", function(event)
-- 	local item = event.entry:get_completion_item()
-- 	local parensDisabled = item.data and item.data.funcParensDisabled or false
-- 	if not parensDisabled and (item.kind == kind.Method or item.kind == kind.Function) then
-- 		require("pairs.bracket").type_left("(")
-- 	end
-- end)

vim.api.nvim_exec(
	[[
  autocmd FileType markdown,text,tex,gitcommit lua require('cmp').setup.buffer {
  \   sources = {
  \       { name = 'path' },
  \       { name = 'luasnip' },
  \       { name = 'nvim_lsp' },
  \  	  { name = 'calc' },
  \       {
  \           name = 'look',
  \           keyword_length = 2,
  \           max_item_count = 5,
  \           option = {
  \               convert_case = true,
  \               loud = true,
  \           },
  \          },
  \     },
  \ }
]],
	false
)

-- Use cmdline & path source for ':'.
-- cmp.setup.cmdline(":", {
-- 	sources = cmp.config.sources({
-- 		{ name = "path" },
-- 	}, {
-- 		{ name = "cmdline" },
-- 	}),
-- })

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
