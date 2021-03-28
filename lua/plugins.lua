---@diagnostic disable: undefined-global
vim.cmd [[packadd packer.nvim]]

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '
                .. install_path)
    execute 'packadd packer.nvim'
end

return require('packer').startup(function()
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- Colorschemes
    use 'lifepillar/vim-gruvbox8'
    use 'phanviet/vim-monokai-pro'
    use 'mhartington/oceanic-next'
    use 'morhetz/gruvbox'

    -- Telescope
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-media-files.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'

    -- LSP
    use 'neovim/nvim-lsp'
    use 'onsails/lspkind-nvim'
    use 'neovim/nvim-lspconfig'
    -- use 'nvim-lua/completion-nvim'
    -- use 'steelsojka/completion-buffers'
    use 'hrsh7th/nvim-compe'
    -- use 'mattn/vim-lsp-settings'
    use 'tjdevries/nlua.nvim'
    use 'tjdevries/lsp_extensions.nvim'

    -- LSP Saga
    use 'glepnir/lspsaga.nvim'

    -- Git
    use 'tpope/vim-fugitive'

    -- TreeSitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/playground'

    -- Polyglot (?)
    -- use 'sheerun/vim-polyglot'

    -- System Copy
    use 'christoomey/vim-system-copy'

    -- Cheat Sheet
    use 'dbeniamine/cheat.sh-vim'

    -- Colorizer
    use 'norcalli/nvim-colorizer.lua'

    -- AutoPairs
    -- use 'jiangmiao/auto-pairs'
    -- light lua auto pairs
    use 'windwp/nvim-autopairs'
    -- Autotags
    use 'windwp/nvim-ts-autotag'

    -- Vim Surround
    use 'tpope/vim-surround'

    -- NERD Commenter
    use 'scrooloose/nerdcommenter'

    -- Undo Tree
    use 'mbbill/undotree'

    -- lua development
    use 'rafcamlet/nvim-luapad'

    -- vimG
    use 'szw/vim-g'

    -- vim closetag
    use 'alvan/vim-closetag'

    -- light line
    -- use 'itchyny/lightline.vim'

    -- lua line
    use 'hoob3rt/lualine.nvim'
    -- galaxyline
    -- use 'glepnir/galaxyline.nvim'

    -- nvim web devicons
    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'

    -- Startup time
    use 'tweekmonster/startuptime.vim'

    -- Nerdtree
    -- use 'preservim/nerdtree'

    -- nvim tree
    use 'kyazdani42/nvim-tree.lua'

    -- React TESTING
    -- use 'MaxMEllon/vim-jsx-pretty'
    -- use 'neoclide/vim-jsx-improve'

    use 'junegunn/vim-emoji'

    -- UltiSnips and vim snips
    use 'honza/vim-snippets'
    use 'SirVer/ultisnips'
    use 'thomasfaingnaert/vim-lsp-snippets'
    use 'mlaursen/vim-react-snippets'
    use 'dsznajder/vscode-es7-javascript-react-snippets'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use 'ChristianChiarulli/html-snippets'
    -- use 'thomasfaingnaert/vim-lsp-ultisnips'

    -- Change root folder to the one opened with vim
    use 'airblade/vim-rooter'

    -- welcome dashboard on start
    use 'glepnir/dashboard-nvim'

    -- An always-on highlight for a unique character in every word on a line to help you use f, F and family
    use 'unblevable/quick-scope'

    -- Ranger inside vim
    use 'kevinhwang91/rnvimr'

    -- Maybe later
    -- use 'gennaro-tedesco/nvim-peekup''
end)
