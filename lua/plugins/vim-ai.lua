local models = {
	turbo = "gpt-3.5-turbo",
	gpt4_turbo = "gpt-4-1106-preview",
	gpt4 = "gpt-4",
}

return {
	"madox2/vim-ai",
	config = function()
		vim.cmd [[
			let g:vim_ai_chat = {
			\  "options": {
			\    "model": "gpt-4-1106-preview",
			\    "max_tokens": 1000,
			\    "temperature": 1,
			\    "request_timeout": 20,
			\    "selection_boundary": "",
			\    "initial_prompt": ">>> system\n - You are a code assistant\n - Always add line breaks at collumn 78\n - Always use 80 characters for each line of the respone\n - If you attach a code block add syntax type after ``` to enable syntax highlighting.\n",
			\  },
			\  "ui": {
			\    "code_syntax_enabled": 1,
			\    "populate_options": 0,
			\    "open_chat_command": "preset_below",
			\    "scratch_buffer_keep_open": 0,
			\  },
			\}
		]]

		-- Function to ask the user for the commit intention
		local function askCommitIntention()
			return vim.fn.input "Enter the intention of the commit: "
		end

		-- Function to obtain the git diff
		local function getGitDiff()
			return vim.fn.system "git --no-pager diff --staged"
		end

		-- Function to build the prompt for the GPT-4 model
		local function buildPrompt(diff, intention)
			local instructions = "Generate a professional git commit message using the"
				.. " Conventional Commits format. "
				.. "This includes using a commit type (such as 'feat', 'fix', 'refactor', etc.), "
				.. "optionally a scope in parentheses, and a brief description that reflects"
				.. " the intention '"
				.. intention
				.. "'."
				.. "- All explanation must be inside the commit message. Do not write"
				.. " anything before or after."
				.. "- Do not enclose the commit message between ``` and ```"
				.. "- Add line breaks at collumn 78"
				.. "- Try to use 40 characters or less for the body of the commit message if the diff is small"
				.. "- Base the commit message on the changes provided below:\n"
				.. diff

			return instructions
		end

		-- Function to execute the AI and generate the commit message
		local function generateCommitMessage()
			local intention = askCommitIntention()
			local diff = getGitDiff()

			if diff == "" then
				print "\nNo changes detected. Cannot generate a commit message."
				return
			end

			local prompt = buildPrompt(diff, intention)
			local range = 0
			local config = {
				engine = "chat",
				options = {
					model = models.gpt4_turbo,
					endpoint_url = "https://api.openai.com/v1/chat/completions",
					max_tokens = 1000,
					initial_prompt = [[ >>> system\n
					- You are a code assistant\n
					- Add line breaks at collumn 78\n
					- Try to use 80 characters for each line of the respone\n
				    - If you attach a code block add syntax type after ``` to enable syntax highlighting.\n
					]],
					temperature = 1,
				},
			}

			-- Execute the AI with the provided configuration
			vim.api.nvim_call_function("vim_ai#AIRun", { config, prompt })
		end

		-- Custom command to suggest a commit message
		vim.api.nvim_create_user_command(
			"GitCommitMessage",
			generateCommitMessage,
			{}
		)
	end,
}
