vim.cmd(
	'let g:lightline = { "colorscheme": "gruvbox8", "active": { "left": [ [ "mode", "paste" ], [ "gitbranch", "readonly", "filename", "modified" ]] } , "component_function": { "gitbranch": "FugitiveHead" },}'
)

-- require'lightline'.setup {
--     colorscheme = 'gruvbox8',
--     active = {
--         left = {
--             {'mode', 'paste'}, {'gitbranch', 'readonly', 'filename', 'modified'}
--         },
--         component_function = {gitbranch = 'FugitiveHead'}
--     }
-- }
