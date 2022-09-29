local Job = require "plenary.job"

local source = {}

source.new = function()
	local self = setmetatable({ cache = {} }, { __index = source })

	return self
end

source.complete = function(self, _, callback)
	local bufnr = vim.api.nvim_get_current_buf()

	-- This just makes sure that we only hit the GH API once per session.
	-- You could remove this if you wanted, but this just makes it so we're
	-- good programming citizens.
	if not self.cache[bufnr] then
		Job
			:new({
				-- Uses `github` api executable to request the issues from the remote repository.
				"curl",
				"-H",
				'"Accept: application/vnd.github.v3+json"',
				"https://api.github.com/search/repositories?per_page=5&q=telescope.nvim",

				on_exit = function(job)
					local result = job:result()
					local ok, parsed = pcall(vim.json.decode, result)
					if not ok then
						vim.notify "Failed to parse github api result"
						return
					end

					local items = {}
					for _, item in ipairs(parsed) do
						item.description =
							string.gsub(item.description or "", "\r", "")

						table.insert(items, {
							label = string.format("#%s", item.number),
							documentation = {
								kind = "markdown",
								value = string.format(
									"# %s\n\n%s",
									item.name,
									item.description
								),
							},
						})
					end

					callback { items = items, isIncomplete = false }
					self.cache[bufnr] = items
				end,
			})
			:start()
	else
		callback { items = self.cache[bufnr], isIncomplete = false }
	end
end

source.get_trigger_characters = function()
	return { '"', "'" }
end

source.is_available = function()
	return vim.bo.filetype == "lua"
end

require("cmp").register_source("pack_cmp", source.new())
