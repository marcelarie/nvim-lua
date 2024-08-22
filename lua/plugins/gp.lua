return {
	"robitx/gp.nvim",
	config = function()
		local conf = {
			providers = {
				ollama = {
					disable = false,
					endpoint = "http://localhost:11434/v1/chat/completions",
					-- secret = "dummy_secret",
				},
			},
			agents = {
				{
					provider = "ollama",
					name = "ChatOllamaLlama3.1-8B",
					chat = true,
					command = false,
					-- string with model name or table with model name and parameters
					model = {
						model = "llama3.1",
						temperature = 0.6,
						top_p = 1,
						min_p = 0.05,
					},
					-- system prompt (use this to specify the persona/role of the AI)
					system_prompt = "You are a general AI assistant.",
				},
			},

			default_command_agent = nil,
			default_chat_agent = "ChatOllamaLlama3.1-8B",
		}

		require("gp").setup(conf)

		-- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
		vim.keymap.set(
			"n",
			"<leader>gp",
			":GpChatNew vsplit<cr>",
			{ noremap = true, silent = true }
		)

		vim.keymap.set(
			"n",
			"<leader>gr",
			":GpChatRespond<cr>",
			{ noremap = true, silent = true }
		)
	end,
}
