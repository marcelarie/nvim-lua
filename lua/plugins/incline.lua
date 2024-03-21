return {
	"b0o/incline.nvim",
	-- event = "VeryLazy",
	opts = {
		debounce_threshold = {
			falling = 50,
			rising = 10,
		},
		hide = {
			cursorline = true,
			focused_win = false,
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
			if p.bufname == "" or p.buf == nil then
				return "[No Name]"
			end

			local full_path = vim.api.nvim_buf_get_name(p.buf)
			if full_path == nil then
				return "[No Name]"
			end

			-- if current working directory is in full path, replace it with .

			local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":p")
			if cwd == nil then
				return "[No Name]"
			end

			--
			if string.find(full_path, cwd, 1, true) then
				local modified_path = vim.fn.fnamemodify(full_path, ":.")
				if modified_path ~= nil then
					full_path = modified_path
				end
			end

			-- append ./ if it is a relative path
			if string.find(full_path, cwd, 1, true) == nil then
				full_path = "./" .. full_path
			end

			return full_path
		end,
		window = {
			margin = {
				horizontal = 1,
				vertical = 2,
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
	},
}
