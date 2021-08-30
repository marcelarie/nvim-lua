-- nvim-cmp setup
--  cmp.setup { completion = { autocomplete = { ... } },
--  snippet = { ... },
--  preselect = ...,
--  documentation = { ... },
--  sorting = { priority_weight = 2., comparators = { ... } },
--  mapping = { ... },
--  sources = { ... },
--  }
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = function(fallback)
			local check_back_space = function()
				local col = vim.fn.col(".") - 1
				return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
			end
			if vim.fn.pumvisible() == 1 then
				vim.fn.feedkeys(
					vim.api.nvim_replace_termcodes("<C-n>", true, true, true),
					"n"
				)
			elseif check_back_space() then
				vim.fn.feedkeys(
					vim.api.nvim_replace_termcodes("<Tab>", true, true, true),
					"n"
				)
			elseif vim.fn["vsnip#available"]() == 1 then
				vim.fn.feedkeys(
					vim.api.nvim_replace_termcodes(
						"<Plug>(vsnip-expand-or-jump)",
						true,
						true,
						true
					),
					""
				)
			else
				fallback()
			end
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "luasnip" },
		{ name = "calc" },
		{ name = "emoji" },
		{ name = "vsnip" },
		{ name = "path" },
		{ name = "latex_symbols" },
	},
})
