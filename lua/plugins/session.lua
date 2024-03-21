return {
	"natecraddock/sessions.nvim",
	-- enabled = false,
	config = function()
		require("sessions").setup {
			session_filepath = vim.fn.stdpath "data" .. "/sessions/sessions.nvim",
		}
	end,
	lazy = false,
	-- keys = {
	-- 	{
	-- 		"n",
	-- 		"<Leader>pe",
	-- 		":Telescope persisted<cr>",
	-- 		desc = "Telescope Persisted",
	-- 	},
	-- 	{
	-- 		"n",
	-- 		"<Leader>sel",
	-- 		":SessionLoadLast<cr>",
	-- 		desc = "Load Last Session",
	-- 	},
	-- 	{
	-- 		"n",
	-- 		"<Leader>ts",
	-- 		":Telescope persisted<cr>",
	-- 		desc = "Telescope Persisted",
	-- 	},
	-- },
}
