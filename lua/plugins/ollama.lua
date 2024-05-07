---@class Ollama.Config
---@field model string The model to use.
---@field url string The URL for the service.
---@field serve table Configuration for the serve command.
---@field prompts table A table of prompts configurations.
-- ---@field prompts.Sample_Prompt table A sample prompt configuration.

---@class OllamaPluginSpec
---@field dependencies string[] @List of plugins this plugin depends on.
---@field cmd string[] @List of commands added by the plugin.
---@field keys table[] @List of keybinds added by the plugin.
---@field opts Ollama.Config @Configuration for the plugin.

---@type OllamaPluginSpec
return {
	"nomnivore/ollama.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },

	keys = {
		-- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
		{
			"<leader>oo",
			":<c-u>lua require('ollama').prompt()<cr>",
			desc = "ollama prompt",
			mode = { "n", "v" },
		},

		-- Sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
		{
			"<leader>oG",
			":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
			desc = "ollama Generate Code",
			mode = { "n", "v" },
		},
	},

	opts = {
		model = "llama3",
		url = "http://127.0.0.1:11434",
		serve = {
			on_start = false,
			command = "ollama",
			args = { "serve" },
			stop_command = "pkill",
			stop_args = { "-SIGTERM", "ollama" },
		},
		prompts = {
			Sample_Prompt = {
				prompt = "This is a sample prompt that receives $input and $sel(ection), among others.",
				input_label = "> ",
				model = "mistral",
				action = "display",
			},
		},
	},
}
