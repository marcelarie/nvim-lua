require("nvim-treesitter.configs").setup {
	context_commentstring = {
		enable = true,
	},
}

require("Comment").setup {
	---@param ctx Ctx
	pre_hook = function(ctx)
		-- Only calculate commentstring for tsx filetypes
		if
			vim.bo.filetype == "typescriptreact"
			or vim.bo.filetype == "javascriptreact"
			or vim.bo.filetype == "javascript"
		then
			local U = require "Comment.utils"

			-- Determine whether to use linewise or blockwise commentstring
			local type = ctx.ctype == U.ctype.line and "__default"
				or "__multiline"

			-- Determine the location where to calculate commentstring from
			local location = nil
			if ctx.ctype == U.ctype.block then
				location =
					require("ts_context_commentstring.utils").get_cursor_location()
			elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
				location =
					require("ts_context_commentstring.utils").get_visual_start_location()
			end

			return require("ts_context_commentstring.internal").calculate_commentstring {
				key = type,
				location = location,
			}
		end
	end,
}

local comment_ft = require "Comment.ft"
comment_ft.set("fish", { "# %s", "# %s #" })
comment_ft.set("bash", { "# %s", "# %s #" })
comment_ft.set("sh", { "# %s", "# %s #" })
comment_ft.set("", { "# %s", "# %s #" })
