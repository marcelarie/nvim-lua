function get_nvim_version()
	local nvim_version = vim.version()
	return string.format(
		"  v%d.%d",
		nvim_version.minor,
		nvim_version.patch
	)
end

_G.get_nvim_version = get_nvim_version
