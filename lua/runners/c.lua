vim.api.nvim_create_autocmd("FileType", {
	pattern = "c",
	callback = function()
		local function has_make_run()
			local file_dir = vim.fn.expand "%:h"
			local makefile_path = file_dir == "" and "Makefile"
				or file_dir .. "/Makefile"
			if vim.fn.filereadable(makefile_path) == 1 then
				local _result = vim.fn.system(
					"cd " .. file_dir .. " && make -n run 2>/dev/null"
				)
				return vim.v.shell_error == 0
			end
			return false
		end

		local function get_build_cmd()
			if has_make_run() then
				return "make"
			else
				return "gcc "
					.. vim.fn.expand "%"
					.. " -o "
					.. vim.fn.expand "%<"
			end
		end

		vim.keymap.set("n", "<leader>r", function()
			vim.cmd "w"
			local file_dir = vim.fn.expand "%:h"
			if has_make_run() then
				vim.cmd(
					"terminal cd " .. file_dir .. " && make run; bash"
				)
			else
				local binary = vim.fn.expand "%<"
				vim.cmd(
					"terminal cd "
						.. file_dir
						.. " && "
						.. get_build_cmd()
						.. " && "
						.. binary
						.. "; bash"
				)
			end
			vim.cmd "startinsert"
		end, { buffer = true, silent = true })

		vim.keymap.set("n", "<leader>R", function()
			local args = vim.fn.input "Args: "
			vim.cmd "w"
			local file_dir = vim.fn.expand "%:h"
			if has_make_run() then
				vim.cmd(
					"terminal cd "
						.. file_dir
						.. " && make run ARGS='"
						.. args
						.. "'; bash"
				)
			else
				local binary = vim.fn.expand "%<"
				vim.cmd(
					"terminal cd "
						.. file_dir
						.. " && "
						.. get_build_cmd()
						.. " && "
						.. binary
						.. " "
						.. args
						.. "; bash"
				)
			end
			vim.cmd "startinsert"
		end, { buffer = true, silent = true })
	end,
})
