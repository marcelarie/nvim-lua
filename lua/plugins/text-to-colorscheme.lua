return {
	"svermeulen/text-to-colorscheme.nvim",
	config = function()
		require("text-to-colorscheme").setup {
			ai = {
				openai_api_key = os.getenv "OPENAI_API_KEY",
				gpt_model = "gpt-3.5-turbo-0613",
			},
		}
	end,
}
