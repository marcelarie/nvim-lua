-- local utils = require('my-utils') -- ./my-utils/init.lua
-- 
-- utils.define_augroups({
--     fugitive = {'FileType', 'fugitive', 'nnoremap <Leader>c :Git commit<cr>'}
-- })

 vim.api.nvim_command([[
     augroup Fugitive
     autocmd FileType fugitive nnoremap <Leader>c :Git commit<cr>
     augroup END
]])

