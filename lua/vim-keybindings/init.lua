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
    endif
endfunc
]]

-- vim.api.nvim_set_keymap(
-- 	"n",
-- 	"<Leader>t",
-- 	":call AddTodo()<cr>",
-- 	{ noremap = true, silent = false }
-- )
vim.api.nvim_set_keymap(
	"n",
	"<Leader>x",
	":normal ddGp<cr>",
	{ noremap = true, silent = false }
)

if vim.lsp.inlay_hint then
	vim.keymap.set("n", "H", function()
		vim.lsp.inlay_hint(0, nil)
	end, { desc = "Toggle inlay hints" })
end
