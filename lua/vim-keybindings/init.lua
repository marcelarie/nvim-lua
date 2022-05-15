vim.api.nvim_set_keymap(
	"n",
	"<Leader>sw",
	[[:%s/\<<C-r><C-w>\>//g<Left><Left>]],
	{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>nn",
	":e ~/clones/pers/notes/notes.md<cr>",
	{ noremap = true, silent = false }
)

-- TODO improve this
vim.cmd [[
func! AddTodo()
    if getline('.') =~ '^\s*$'
        normal i- [ ]
    elseif getline('.') =~ '- [ ].*'
        s/\[ \]/\[x\]/
    elseif getline('.') =~ '- [x]'
        s/\[x\]/\[ \]/
    else
        normal I- [ ]
    endif
endfunc
]]

vim.api.nvim_set_keymap(
	"n",
	"<Leader>t",
	":call AddTodo()<cr>",
	{ noremap = true, silent = false }
)
