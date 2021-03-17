
require('lspconfig')

-- Use <Tab> and <S-Tab> to navigate through popup menu
vim.cmd([[inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"]])
vim.cmd([[inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"]])

-- Set completeopt to have a better completion experience
vim.cmd('set completeopt=menuone,noinsert,noselect')
--  Avoid showing message extra message when using completion
vim.cmd("set shortmess+=c")
vim.cmd("let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']")

vim.cmd('nnoremap <leader>gd <cmd>lua vim.lsp.buf.definition()<CR>')
vim.cmd('nnoremap <leader>gD <cmd>lua vim.lsp.buf.declaration()<CR>')
vim.cmd('nnoremap <leader>gr <cmd>lua vim.lsp.buf.references()<CR>')
vim.cmd('nnoremap <leader>gi <cmd>lua vim.lsp.buf.implementation()<CR>')
vim.cmd('nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>')
vim.cmd('nnoremap <silent>K <cmd>lua vim.lsp.buf.hover()<CR>')

-- nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
-- nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
-- nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
-- nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
-- nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
-- nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
-- nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
-- nnoremap <leader>vsd :lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
-- nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>
-- nnoremap <leader>vll :lua vim.lsp.diagnostic.set_loclist()<CR>

-- vim.cmd('nnoremap <silent> ca :Lspsaga code_action<CR>')
-- vim.cmd('nnoremap <silent> <C-p> :Lspsaga diagnostic_jump_prev<CR>')
-- vim.cmd('nnoremap <silent> <C-n> :Lspsaga diagnostic_jump_next<CR>')
-- " Avoid showing message extra message when using completion
--
