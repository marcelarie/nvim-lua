# Neovim config

<a href="https://dotfyle.com/marcelarie/nvim-lua"><img src="https://dotfyle.com/marcelarie/nvim-lua/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/marcelarie/nvim-lua"><img src="https://dotfyle.com/marcelarie/nvim-lua/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/marcelarie/nvim-lua"><img src="https://dotfyle.com/marcelarie/nvim-lua/badges/plugin-manager?style=flat" /></a>


## Install Instructions

 > Install requires Neovim 0.9+. Always review the code before installing a configuration.

Clone the repository and install the plugins:

```sh
git clone git@github.com:marcelarie/nvim-lua ~/.config/marcelarie/nvim-lua
NVIM_APPNAME=marcelarie/nvim-lua/ nvim --headless +"Lazy! sync" +qa
```

Open Neovim with this config:

```sh
NVIM_APPNAME=marcelarie/nvim-lua/ nvim
```

## Plugins

### colorscheme

+ [zootedb0t/citruszest.nvim](https://dotfyle.com/plugins/zootedb0t/citruszest.nvim)
+ [rebelot/kanagawa.nvim](https://dotfyle.com/plugins/rebelot/kanagawa.nvim)
+ [catppuccin/nvim](https://dotfyle.com/plugins/catppuccin/nvim)
+ [projekt0n/github-nvim-theme](https://dotfyle.com/plugins/projekt0n/github-nvim-theme)
+ [ishan9299/nvim-solarized-lua](https://dotfyle.com/plugins/ishan9299/nvim-solarized-lua)
+ [mhartington/oceanic-next](https://dotfyle.com/plugins/mhartington/oceanic-next)
+ [fenetikm/falcon](https://dotfyle.com/plugins/fenetikm/falcon)
+ [shaeinst/roshnivim-cs](https://dotfyle.com/plugins/shaeinst/roshnivim-cs)
+ [ishan9299/modus-theme-vim](https://dotfyle.com/plugins/ishan9299/modus-theme-vim)
+ [Verf/deepwhite.nvim](https://dotfyle.com/plugins/Verf/deepwhite.nvim)
+ [nyoom-engineering/oxocarbon.nvim](https://dotfyle.com/plugins/nyoom-engineering/oxocarbon.nvim)
+ [EdenEast/nightfox.nvim](https://dotfyle.com/plugins/EdenEast/nightfox.nvim)
### colorscheme-creation

+ [rktjmp/lush.nvim](https://dotfyle.com/plugins/rktjmp/lush.nvim)
### comment

+ [JoosepAlviste/nvim-ts-context-commentstring](https://dotfyle.com/plugins/JoosepAlviste/nvim-ts-context-commentstring)
+ [folke/todo-comments.nvim](https://dotfyle.com/plugins/folke/todo-comments.nvim)
+ [numToStr/Comment.nvim](https://dotfyle.com/plugins/numToStr/Comment.nvim)
### completion

+ [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)
+ [zbirenbaum/copilot.lua](https://dotfyle.com/plugins/zbirenbaum/copilot.lua)
### debugging

+ [rcarriga/nvim-dap-ui](https://dotfyle.com/plugins/rcarriga/nvim-dap-ui)
+ [mfussenegger/nvim-dap](https://dotfyle.com/plugins/mfussenegger/nvim-dap)
### diagnostics

+ [folke/trouble.nvim](https://dotfyle.com/plugins/folke/trouble.nvim)
+ [folke/lsp-colors.nvim](https://dotfyle.com/plugins/folke/lsp-colors.nvim)
### editing-support

+ [nvim-treesitter/nvim-treesitter-context](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter-context)
+ [gbprod/substitute.nvim](https://dotfyle.com/plugins/gbprod/substitute.nvim)
+ [folke/zen-mode.nvim](https://dotfyle.com/plugins/folke/zen-mode.nvim)
+ [nacro90/numb.nvim](https://dotfyle.com/plugins/nacro90/numb.nvim)
+ [debugloop/telescope-undo.nvim](https://dotfyle.com/plugins/debugloop/telescope-undo.nvim)
### file-explorer

+ [stevearc/oil.nvim](https://dotfyle.com/plugins/stevearc/oil.nvim)
### formatting

+ [cappyzawa/trim.nvim](https://dotfyle.com/plugins/cappyzawa/trim.nvim)
### fuzzy-finder

+ [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)
+ [camspiers/snap](https://dotfyle.com/plugins/camspiers/snap)
+ [jvgrootveld/telescope-zoxide](https://dotfyle.com/plugins/jvgrootveld/telescope-zoxide)
### git

+ [lewis6991/gitsigns.nvim](https://dotfyle.com/plugins/lewis6991/gitsigns.nvim)
+ [f-person/git-blame.nvim](https://dotfyle.com/plugins/f-person/git-blame.nvim)
+ [akinsho/git-conflict.nvim](https://dotfyle.com/plugins/akinsho/git-conflict.nvim)
+ [sindrets/diffview.nvim](https://dotfyle.com/plugins/sindrets/diffview.nvim)
### icon

+ [kyazdani42/nvim-web-devicons](https://dotfyle.com/plugins/kyazdani42/nvim-web-devicons)
### lsp

+ [nvimtools/none-ls.nvim](https://dotfyle.com/plugins/nvimtools/none-ls.nvim)
+ [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
### lsp-installer

+ [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)
### markdown-and-latex

+ [iamcco/markdown-preview.nvim](https://dotfyle.com/plugins/iamcco/markdown-preview.nvim)
### note-taking

+ [renerocksai/telekasten.nvim](https://dotfyle.com/plugins/renerocksai/telekasten.nvim)
+ [mickael-menu/zk-nvim](https://dotfyle.com/plugins/mickael-menu/zk-nvim)
### nvim-dev

+ [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)
+ [folke/neodev.nvim](https://dotfyle.com/plugins/folke/neodev.nvim)
### plugin-manager

+ [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)
### preconfigured

+ [shaeinst/roshnivim](https://dotfyle.com/plugins/shaeinst/roshnivim)
### project

+ [nyngwang/NeoRoot.lua](https://dotfyle.com/plugins/nyngwang/NeoRoot.lua)
### quickfix

+ [kevinhwang91/nvim-bqf](https://dotfyle.com/plugins/kevinhwang91/nvim-bqf)
### session

+ [olimorris/persisted.nvim](https://dotfyle.com/plugins/olimorris/persisted.nvim)
### snippet

+ [rafamadriz/friendly-snippets](https://dotfyle.com/plugins/rafamadriz/friendly-snippets)
+ [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)
### startup

+ [goolord/alpha-nvim](https://dotfyle.com/plugins/goolord/alpha-nvim)
### statusline

+ [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim)
+ [b0o/incline.nvim](https://dotfyle.com/plugins/b0o/incline.nvim)
### syntax

+ [nvim-treesitter/nvim-treesitter-textobjects](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter-textobjects)
+ [LhKipp/nvim-nu](https://dotfyle.com/plugins/LhKipp/nvim-nu)
+ [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)
+ [kylechui/nvim-surround](https://dotfyle.com/plugins/kylechui/nvim-surround)
### utility

+ [axkirillov/hbac.nvim](https://dotfyle.com/plugins/axkirillov/hbac.nvim)
## Language Servers

+ html
+ zk


 This readme was generated by [Dotfyle](https://dotfyle.com)

### Startup time
```
LazyStart 8.36ms
LazyDone  101.79ms (+93.43ms)
UIEnter   157.78ms (+56ms)
```

### File Tree

```bash
.
├── Dockerfile
├── README.md
├── data
│   └── telescope-sources
│       ├── emoji.json
│       ├── gitmoji.json
│       ├── julia.json
│       ├── kaomoji.json
│       ├── latex.json
│       ├── math.json
│       └── url_encoded.json
├── info.md
├── init.lua
├── lazy-lock.json
├── ltex-dictionaries
│   ├── ltex.dictionary.en-US.txt
│   └── ltex.hiddenFalsePositives.en-US.txt
├── lua
│   ├── autocmd.lua
│   ├── color-settings.lua
│   ├── keymaps.lua
│   ├── kickstart
│   │   └── plugins
│   │       └── debug.lua
│   ├── lazy-bootstrap.lua
│   ├── lazy-plugins.lua
│   ├── lsp-setup.lua
│   ├── options.lua
│   ├── plugins
│   │   ├── alpha.lua
│   │   ├── cmp.lua
│   │   ├── colorschemes.lua
│   │   ├── git-blame.lua
│   │   ├── git-conflict.lua
│   │   ├── git-signs.lua
│   │   ├── incline.lua
│   │   ├── init.lua
│   │   ├── kanagawa.lua
│   │   ├── lsp-trouble.lua
│   │   ├── lualine.lua
│   │   ├── luasnip.lua
│   │   ├── mason-null-ls.lua
│   │   ├── nvim-surround.lua
│   │   ├── oil.lua
│   │   ├── persisted.lua
│   │   ├── snap.lua
│   │   ├── substitute.lua
│   │   ├── telekasten.lua
│   │   ├── telescope.lua
│   │   ├── undotree.lua
│   │   ├── vim-ai.lua
│   │   ├── zen-mode.lua
│   │   └── zk.lua
│   └── treesitter-setup.lua
├── scripts
├── spell
│   ├── en.utf-8.add
│   └── en.utf-8.add.spl
└── stylua.toml

10 directories, 50 files
```
