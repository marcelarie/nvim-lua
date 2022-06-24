-- this template is borrowed from nvim-lspconfig
local on_windows = vim.loop.os_uname().version:match("Windows")

local function join_paths(...)
	local path_sep = on_windows and "\\" or "/"
	local result = table.concat({ ... }, path_sep)
	return result
end

vim.cmd([[set runtimepath=$VIMRUNTIME]])

local temp_dir
if on_windows then
	temp_dir = vim.loop.os_getenv("TEMP")
else
	temp_dir = "/tmp"
end

vim.cmd("set packpath=" .. join_paths(temp_dir, "nvim", "site"))

local package_root = join_paths(temp_dir, "nvim", "site", "pack")
local install_path = join_paths(package_root, "packer", "start", "packer.nvim")
local compile_path = join_paths(install_path, "plugin", "packer_compiled.lua")

local function load_plugins()
	-- only add other plugins if they are necessary to reproduce the issue
	require("packer").startup({
		{
			"wbthomason/packer.nvim",
			{ "neovim/nvim-lspconfig" },
			{ "neovim/nvim-lsp" },
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "github/copilot.vim" }, -- needed for the auth
			{
				"zbirenbaum/copilot.lua",
				event = "VimEnter",
				config = function()
					vim.defer_fn(function()
						require("copilot").setup({})
					end, 100)
				end,
			},
			{
				"zbirenbaum/copilot-cmp",
				after = { "copilot.lua", "nvim-cmp" },
			},
			{ "williamboman/nvim-lsp-installer" },
		},
		config = {
			package_root = package_root,
			compile_path = compile_path,
		},
	})
end

if vim.fn.isdirectory(install_path) == 0 then
	vim.fn.system({
		"git",
		"clone",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	load_plugins()
	require("packer").sync()
else
	load_plugins()
	require("packer").sync()
end

vim.keymap.set("n", "<Space>w", ":w<cr>")
vim.keymap.set("n", "<Space>q", ":q<cr>")

require("lspconfig")

local cmp = require("cmp")
local kind = cmp.lsp.CompletionItemKind

-- vim.o.completeopt = "menu,menuone,noselect"
vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.cmd("set shortmess+=c")
vim.cmd("let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']")

cmp.setup({
	mapping = {
		["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
		["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({
			select = true,
			behavior = cmp.ConfirmBehavior.Replace,
		}),
	},
	experimental = { ghost_text = true },
	sources = {
		{ name = "copilot" },
		{ name = "nvim_lsp", max_item_count = 5 },
	},
})

require("nvim-lsp-installer").setup({})
