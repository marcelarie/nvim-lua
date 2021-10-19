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
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require("cmp")
-- local tabnine = require("cmp_tabnine.config")

-- tabnine:setup({
-- 	max_lines = 1000,
-- 	max_num_results = 20,
-- 	sort = true,
-- 	run_on_every_keystroke = true,
-- 	snippet_placeholder = "..",
-- })

cmp.register_source("buf_lines", {
	complete = function(self, request, callback)
		local start_line, end_line = 0, -1
		local opt_context_lines = request.option.context_lines
		if opt_context_lines then
			local cursor_line = request.context.cursor.line
			start_line = math.max(0, cursor_line - opt_context_lines)
			end_line = math.max(0, cursor_line + opt_context_lines)
		end
		local lines = vim.api.nvim_buf_get_lines(request.context.bufnr, start_line, end_line, false)
		local items = {}
		for i = 1, #lines do
			local line = vim.trim(lines[i])
			if #line > 0 and line ~= opt_context_lines then
				items[#items + 1] = { label = line }
			end
		end
		callback({ items = items })
	end,
})

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	formatting = {
		format = function(entry, vim_item)
			-- fancy icons and a name of kind
			vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

			-- set a name for each source
			vim_item.menu = ({
				buffer = "[buf]",
				buf_lines = "[buffer_lines]",
				nvim_lsp = "[lsp]",
				luasnip = "[luasnip]",
				nvim_lua = "[lua]",
				treesitter = "[treesitter]",
				look = "[look]",
				spell = "[spell]",
				neorg = "[neorg]",
				latex_symbols = "[latex]",
				cmp_tabnine = "",
			})[entry.source.name]
			return vim_item
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
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	},
	--  documentation = {
	--  border = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" },
	--  },
	sources = {
		{ name = "nvim_lsp" },
		--  { name = "cmp_tabnine" }, -- wait for better RAM managment
		{ name = "luasnip" },
		{
			name = "buffer",
			opts = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end,
			},
		},
		{ name = "buf_lines", max_item_count = 4 },
		{ name = "treesitter" },
		{ name = "path" },
		{ name = "nvim_lua" },
		{ name = "calc" },
		{ name = "look", keyword_length = 2, max_item_count = 3 },
		{ name = "emoji" },
		{ name = "latex_symbols" },
		{ name = "crates" },
		{ name = "tags" },
		{ name = "neorg" },
		--  { name = "spell" },
		--  { name = "nuspell" },
		--  snippets
		--  { name = "vsnip" },
		--  { name = "ultisnips" },
	},
})
