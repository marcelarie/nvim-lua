return {
    "b0o/incline.nvim",
    opts = {
        	debounce_threshold = {
		falling = 50,
		rising = 10,
	},
	hide = {
		cursorline = true,
		focused_win = true,
		only_win = false,
	},
	highlight = {
		groups = {
			InclineNormal = {
				default = true,
				group = "NormalFloat",
			},
			InclineNormalNC = {
				default = true,
				group = "NormalFloat",
			},
		},
	},
	ignore = {
		buftypes = "special",
		filetypes = {},
		floating_wins = true,
		unlisted_buffers = true,
		wintypes = "special",
	},
	-- render = "basic",
	render = function(p)
		-- luacheck: globals g1 g2, ignore vim
		local full_path = vim.api.nvim_buf_get_name(p.buf)

		-- escaping special characters
		local cwd = vim.fn.getcwd():gsub("[%(%)%.%%%+%-%*%?%[%]%^%$]", "%%%1")

		-- if cwd == nil then
		-- 	cwd = vim.fn.expand "$HOME"
		-- end

		return full_path:gsub(cwd, ".")
	end,
	window = {
		margin = {
			horizontal = 1,
			vertical = 1,
		},
		options = {
			signcolumn = "no",
			wrap = false,
		},
		padding = 0,
		padding_char = " ",
		placement = { horizontal = "right", vertical = "top" },
		width = "fit",
		winhighlight = {
			active = {
				EndOfBuffer = "None",
				Normal = "InclineNormal",
				Search = "None",
			},
			inactive = {
				EndOfBuffer = "None",
				Normal = "InclineNormalNC",
				Search = "None",
			},
		},
		zindex = 50,
	},

    }
}
