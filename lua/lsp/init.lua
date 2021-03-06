require("lspconfig")
-- vim.cmd("let g:completion_enable_snippet = 'UltiSnips'")

-- Use <Tab> and <S-Tab> to navigate through popup menu
vim.cmd([[inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"]])
vim.cmd([[inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"]])

-- Set completeopt to have a better completion experience
-- vim.cmd('set completeopt=menuone,noinsert,noselect')
vim.o.completeopt = "menuone,noinsert,noselect"
--  Avoid showing message extra message when using completion
vim.cmd("set shortmess+=c")
vim.cmd("let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']")

vim.cmd("nnoremap <leader>gd <cmd>lua vim.lsp.buf.definition()<CR>")
vim.cmd("nnoremap <leader>gD <cmd>lua vim.lsp.buf.declaration()<CR>")
-- vim.cmd('nnoremap <leader>gr <cmd>lua vim.lsp.buf.references()<CR>')
vim.cmd("nnoremap <leader>gi <cmd>lua vim.lsp.buf.implementation()<CR>")

-- Till LSPSaga works
-- vim.cmd('nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>')
-- vim.cmd('nnoremap <leader>a <cmd>lua vim.lsp.buf.code_action()<CR>')

vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap(
	"n",
	"<Leader>z",
	"<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "[", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "]", "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", { noremap = true, silent = true })

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	-- Enable underline, use default values
	underline = true,
	-- Enable virtual text, override spacing to 4
	virtual_text = { spacing = 12 },
	-- Disable a feature
	update_in_insert = true,
	-- -- Use a function to dynamically turn signs off
	-- -- and on, using buffer local variables
	-- signs = function(bufnr, client_id)
	-- return vim.bo[bufnr].show_signs == true
	-- end,
})

-- enable diagnostics color
vim.cmd([[ autocmd ColorScheme * :lua require('vim.lsp.diagnostic')._define_default_signs_and_highlights() ]])

-- change diagntostic signs
-- vim.cmd(
--     'sign define LspDiagnosticsSignError text=|> texthl=LspDiagnosticsSignError linehl= numhl=')
-- vim.cmd(
--     'sign define LspDiagnosticsSignWarning text=??? texthl=LspDiagnosticsSignWarning linehl= numhl=')
-- vim.cmd(
--     'sign define LspDiagnosticsSignInformation text=??? texthl=LspDiagnosticsSignInformation linehl= numhl=')
-- vim.cmd(
--     'sign define LspDiagnosticsSignHint text=??? texthl=LspDiagnosticsSignHint linehl= numhl=')
