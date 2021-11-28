require("cmp_git").setup({
	-- defaults
	filetypes = { "gitcommit" },
	github = {
		issues = {
			filter = "all", -- assigned, created, mentioned, subscribed, all, repos
			limit = 100,
			state = "all", -- open, closed, all
		},
		mentions = {
			limit = 100,
		},
	},
})
