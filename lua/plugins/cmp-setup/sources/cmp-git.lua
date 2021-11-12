require("cmp_git").setup({
	-- defaults
	filetypes = { "gitcommit" },
	github = {
		issues = {
			filter = "all", -- assigned, created, mentioned, subscribed, all, repos
			limit = 100,
			state = "open", -- open, closed, all
		},
		mentions = {
			limit = 100,
		},
	},
})
