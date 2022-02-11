-- local function is_whitespace(line)
-- 	return vim.fn.match(line, [[^\s*$]]) ~= -1
-- end
--
-- local function all(tbl, check)
-- 	for _, entry in ipairs(tbl) do
-- 		if not check(entry) then
-- 			return false
-- 		end
-- 	end
-- 	return true
-- end

require("neoclip").setup({
	history = 1000,
	settings = { enable_persistant_history = true },
	db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
	preview = true,
	default_register = '"',
	default_register_macros = "q",
	enable_macro_history = true,
	content_spec_column = false,
	on_paste = {
		set_reg = false,
	},
	on_replay = {
		set_reg = false,
	},
	-- filter = function(data)
	-- 	return all(data.event.regcontents, is_whitespace)
	-- end,
	keys = {
		telescope = {
			i = {
				select = "<cr>",
				paste = "<c-p>",
				paste_behind = "<c-k>",
				replay = "<c-q>",
				custom = {},
			},
			n = {
				select = "<cr>",
				paste = "p",
				paste_behind = "P",
				replay = "q",
				custom = {},
			},
		},
		fzf = {
			select = "default",
			paste = "ctrl-p",
			paste_behind = "ctrl-k",
			custom = {},
		},
	},
})

vim.api.nvim_set_keymap(
	"n",
	"<Leader>v",
	":lua require('telescope').extensions.neoclip.default()<cr>",
	{ noremap = true, silent = false }
)
