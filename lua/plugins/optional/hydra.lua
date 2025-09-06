return {
	"nvimtools/hydra.nvim",
	-- Lazy load hydra only when git keymap is used
	keys = { "<C-g>" },
	dependencies = { "lewis6991/gitsigns.nvim" },
	config = function()
		local Hydra = require "hydra"
		local gitsigns = require "gitsigns"

		local hint = [[
			 _J_: next hunk   _s_: stage hunk        _d_: deleted      _b_: blame line
			 _K_: prev hunk   _u_: undo stage        _p_: preview      _B_: blame full
			 ^ ^              _S_: stage buffer      ^ ^               _/_: base file
			 ^ ^              _<Enter>_: Neogit      _q_: exit
		]]

		Hydra {
			name = "Git",
			mode = { "n", "x" },
			hint = hint,
			body = "<C-g>",
			config = {
				color = "pink",
				invoke_on_body = true,
			},
			heads = {
				{
					"J",
					function()
						gitsigns.next_hunk()
					end,
				},
				{
					"K",
					function()
						gitsigns.prev_hunk()
					end,
				},
				{ "s", ":Gitsigns stage_hunk<CR>", { silent = true } },
				{ "u", gitsigns.undo_stage_hunk },
				{ "S", gitsigns.stage_buffer },
				{ "p", gitsigns.preview_hunk },
				{ "d", gitsigns.toggle_deleted, { nowait = true } },
				{ "b", gitsigns.blame_line },
				{
					"B",
					function()
						gitsigns.blame_line { full = true }
					end,
				},
				{ "/", gitsigns.show, { exit = true } },
				{ "<Enter>", "<Cmd>Neogit<CR>", { exit = true } },
				{ "q", nil, { exit = true } },
			},
		}
	end,
}
