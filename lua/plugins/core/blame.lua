return {
	{
		"FabijanZulj/blame.nvim",
		lazy = true,
		opts = {
			-- blame_options = { "-w -C -C -C -C" },
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
		keys = {
			{
				"<leader>gb",
				":BlameToggle window<cr>",
				desc = "Toggle Blame Window",
			},
		},
	},
}
