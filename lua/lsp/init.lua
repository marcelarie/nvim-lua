require('lspconfig')

vim.cmd("let g:completion_enable_snippet = 'UltiSnips'")

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
vim.cmd('nnoremap <leader>c <cmd>lua vim.lsp.buf.code_action()<CR>')
vim.cmd('nnoremap <silent>K <cmd>lua vim.lsp.buf.hover()<CR>')
vim.cmd('nnoremap <silent>: <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
vim.cmd([[nnoremap <silent>" <cmd>lua vim.lsp.diagnostic.goto_next()<CR>]])

-- enable diagnostics color
vim.cmd([[ autocmd ColorScheme * :lua require('vim.lsp.diagnostic')._define_default_signs_and_highlights() ]])
