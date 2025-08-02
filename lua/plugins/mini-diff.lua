return {
	"echasnovski/mini.diff",
	-- enabled = false,
	config = function()
		local diff = require "mini.diff"
		diff.setup {
			-- Disabled by default
			source = diff.gen_source.none(),
			-- view = { priority = 1 },
		}

		local diff_colors = {
			delete = "#681300",
			add = "#055800",
			change = "#105090",
			base_text = "#000000",
			text_fg = "#ffffff",
		}

		vim.api.nvim_create_augroup("MyDiffSigns", { clear = true })
		vim.api.nvim_create_autocmd("ColorScheme", {
			group = "MyDiffSigns",
			pattern = "*",
			callback = function()
				vim.o.termguicolors = true
				vim.cmd "highlight SignColumn guibg=NONE ctermbg=NONE"

				vim.api.nvim_set_hl(
					0,
					"CustomDiffAdd",
					{ fg = diff_colors.text_fg, bg = diff_colors.add }
				)

				vim.api.nvim_set_hl(
					0,
					"CustomDiffChange",
					{ fg = diff_colors.text_fg, bg = diff_colors.change }
				)

				vim.api.nvim_set_hl(
					0,
					"CustomDiffDelete",
					{ fg = diff_colors.text_fg, bg = diff_colors.delete, bold = false }
				)

				vim.cmd [[highlight! link DiffAdd    CustomDiffAdd]]
				vim.cmd [[highlight! link DiffChange CustomDiffChange]]
				vim.cmd [[highlight! link DiffDelete CustomDiffDelete]]
			end,
		})
	end,
}
