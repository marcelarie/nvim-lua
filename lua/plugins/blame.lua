return {
	{
		"FabijanZulj/blame.nvim",
		lazy = false,
		config = function()
			require("blame").setup {}
			vim.keymap.set(
				"n",
				"<Leader>gt",
				":BlameToggle window<cr>",
				{ noremap = true, silent = false }
			)
		end,
		opts = {
			blame_options = { "-w -C -C -C -C" },
			--     date_format = "%d.%m.%Y",
			--     virtual_style = "right_align",
			--     views = {
			--         window = window_view,
			--         virtual = virtual_view,
			--         default = window_view,
			--     },
			--     focus_blame = true,
			--     merge_consecutive = false,
			--     max_summary_width = 30,
			--     colors = nil,
			--     commit_detail_view = "vsplit",
			--     format_fn = formats.commit_date_author_fn,
			--     mappings = {
			--         commit_info = "i",
			--         stack_push = "<TAB>",
			--         stack_pop = "<BS>",
			--         show_commit = "<CR>",
			--         close = { "<esc>", "q" },
			--     }
		},
	},
}
