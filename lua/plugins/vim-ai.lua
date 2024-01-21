return {
	"madox2/vim-ai",
	config = function()
		vim.cmd [[
            let g:vim_ai_chat = {
            \  "options": {
            \    "model": "gpt-3.5-turbo",
            \    "max_tokens": 1000,
            \    "temperature": 1,
            \    "request_timeout": 20,
            \    "selection_boundary": "",
            \  },
            \  "ui": {
            \    "code_syntax_enabled": 1,
            \    "populate_options": 0,
            \    "open_chat_command": "preset_right",
            \    "scratch_buffer_keep_open": 0,
            \  },
            \}
        ]]

		vim.cmd [[
            " custom command suggesting git commit message, takes no arguments
            function! GitCommitMessageFn()
              let l:diff = system('git --no-pager diff --staged')
              let l:prompt = "generate a short commit message from the diff below:\n" . l:diff
              let l:range = 0
              let l:config = {
              \  "engine": "chat",
              \  "options": {
              \    "model": "gpt-3.5-turbo",
              \    "initial_prompt": ">>> system\nyou are a code assistant",
              \    "temperature": 1,
              \  },
              \}
              call vim_ai#AIRun(l:range, l:config, l:prompt)
            endfunction
            command! GitCommitMessage call GitCommitMessageFn()

            " custom command that provides a code review for selected code block
            function! CodeReviewFn(range) range
              let l:prompt = "programming syntax is " . &filetype . ", review the code below"
              let l:config = {
              \  "options": {
              \    "initial_prompt": ">>> system\nyou are a clean code expert",
              \  },
              \}
              '<,'>call vim_ai#AIChatRun(a:range, l:config, l:prompt)
            endfunction
            command! -range CodeReview <line1>,<line2>call CodeReviewFn(<range>)
            ]]
	end,
}
