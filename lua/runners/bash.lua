vim.api.nvim_create_autocmd("FileType", {
	pattern = "sh",
	callback = function()
		vim.keymap.set(
			"n",
			"<leader>r",
			"<cmd>w<CR><cmd>!bash %<CR>",
			{ buffer = true, silent = true }
		)
		vim.keymap.set("n", "<leader>R", function()
			local args = vim.fn.input "Args: "
			vim.cmd "w"
			vim.cmd("!" .. "bash " .. vim.fn.expand "%" .. " " .. args)
		end, { buffer = true, silent = true })
		vim.keymap.set("n", "<leader>t", function()
			vim.cmd "w"
			vim.cmd "vsplit | terminal bash %"
		end, { buffer = true, silent = true })
		vim.keymap.set("n", "<leader>T", function()
			local args = vim.fn.input "Args: "
			vim.cmd "w"
			vim.cmd(
				"vsplit | terminal bash " .. vim.fn.expand "%" .. " " .. args
			)
		end, { buffer = true, silent = true })
	end,
})
