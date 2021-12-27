-- -- space as leader key
vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", { noremap = true, silent = true })
vim.g.mapleader = " "

-- leader w to save
vim.api.nvim_set_keymap("n", "<Leader>w", ":w<cr>", { noremap = true, silent = true })
-- leader W to save
vim.api.nvim_set_keymap("n", "<Leader>w!", ":w!<cr>", { noremap = true, silent = true })

-- leader W to save ON SUDO
vim.api.nvim_set_keymap("c", "w!!", "w !sudo tee > /dev/null %", { noremap = false, silent = false })
-- leader q to quit
vim.api.nvim_set_keymap("n", "<Leader>q", ":q<cr>", { noremap = true, silent = true })
-- leader Q to quit!
vim.api.nvim_set_keymap("n", "<Leader>Q", ":q!<cr>", { noremap = true, silent = true })
-- leader a to autoread current file
vim.api.nvim_set_keymap("n", "<Leader>e", ":e<cr>", { noremap = true, silent = true })

-- horizontal split
vim.api.nvim_set_keymap("n", "<Leader>sj", ":split<cr>", { noremap = true, silent = true })

-- vertical split
vim.api.nvim_set_keymap("n", "<Leader>sl", ":vsplit<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<Leader>o", ":luafile %<cr>", { noremap = true, silent = false })
vim.api.nvim_set_keymap(
	"n",
	"<Leader>so",
	":luafile /home/marcel/.config/nvim/init.lua<cr>",
	{ noremap = true, silent = false }
)

-- open file path under cursor vertical split
-- vim.api.nvim_set_keymap('n', '<Leader>gf', ':vertical wincmd f<cr>',
--                         {noremap = true, silent = true})

-- change left window
-- vim.api.nvim_set_keymap('n', '<Leader>h', ':wincmd h<cr>',
--                         {noremap = true, silent = true})
-- -- change right window
-- vim.api.nvim_set_keymap('n', '<Leader>l', ':wincmd l<cr>',
--                         {noremap = true, silent = true})
-- -- change bottom window
-- vim.api.nvim_set_keymap('n', '<Leader>j', ':wincmd j<cr>',
--                         {noremap = true, silent = true})
-- -- change top window
-- vim.api.nvim_set_keymap('n', '<Leader>k', ':wincmd k<cr>',
--                         {noremap = true, silent = true})

-- switch windows vertically
vim.api.nvim_set_keymap("n", "<Leader>l", ":wincmd L<cr>", { noremap = true, silent = true })
-- switch windows horizontally
vim.api.nvim_set_keymap("n", "<Leader>j", ":wincmd J<cr>", { noremap = true, silent = true })

-- Packer
vim.api.nvim_set_keymap("n", "<Leader>pi", ":luafile %<cr>:PackerInstall<cr>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>pu", ":PackerUpdate<cr>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>pc", ":luafile %<cr>:PackerClean<cr>", { noremap = true, silent = false })

-- ; for :
vim.api.nvim_set_keymap("n", ";", ":", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", ":", ";", { noremap = true, silent = false })
