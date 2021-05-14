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
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/home/marcel/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/marcel/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/marcel/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/marcel/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/marcel/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["FTerm.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/FTerm.nvim"
  },
  ["auto-session"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/auto-session"
  },
  ["cheat.sh-vim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/cheat.sh-vim"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["git-worktree.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/git-worktree.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/gruvbox.nvim"
  },
  ["html-snippets"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/html-snippets"
  },
  ["lir.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/lir.nvim"
  },
  ["lsp-trouble.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/lsp-trouble.nvim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/lush.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim"
  },
  melange = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/melange"
  },
  neoformat = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  ["neoscroll.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/neoscroll.nvim"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nlua.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-comment"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nvim-comment"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nvim-lightbulb"
  },
  ["nvim-lsp"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nvim-lsp"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils"
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
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring"
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
  ["quick-scope"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  rnvimr = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/rnvimr"
  },
  ["session-lens"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/session-lens"
  },
  ["shade.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/shade.nvim"
  },
  ["spellsitter.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/spellsitter.nvim"
  },
  ["startuptime.vim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/startuptime.vim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim"
  },
  ["telescope-bookmarks.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/telescope-bookmarks.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope-github.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/telescope-github.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim"
  },
  ["telescope-node-modules.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/telescope-node-modules.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/ultisnips"
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
  ["vim-emoji"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-emoji"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-g"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-g"
  },
  ["vim-gruvbox8"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-gruvbox8"
  },
  ["vim-http"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-http"
  },
  ["vim-lsp-snippets"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-lsp-snippets"
  },
  ["vim-monokai-pro"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-monokai-pro"
  },
  ["vim-react-snippets"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-react-snippets"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-rooter"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-snippets"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-system-copy"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-system-copy"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  },
  ["vscode-es7-javascript-react-snippets"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vscode-es7-javascript-react-snippets"
  }
}

time("Defining packer_plugins", false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
