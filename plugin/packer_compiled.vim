" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/marcel/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/marcel/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/marcel/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/marcel/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/marcel/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["cheat.sh-vim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/cheat.sh-vim"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["lightline.vim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/lightline.vim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nerdcommenter"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nlua.nvim"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-luapad"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nvim-luapad"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["oceanic-next"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/oceanic-next"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["startuptime.vim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/startuptime.vim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-closetag"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-closetag"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-g"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-g"
  },
  ["vim-gruvbox8"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-gruvbox8"
  },
  ["vim-lsp-settings"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-lsp-settings"
  },
  ["vim-monokai-pro"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-monokai-pro"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-system-copy"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-system-copy"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
