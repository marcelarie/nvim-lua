# Neovim config

<a href="https://dotfyle.com/marcelarie/nvim-lua"><img src="https://dotfyle.com/marcelarie/nvim-lua/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/marcelarie/nvim-lua"><img src="https://dotfyle.com/marcelarie/nvim-lua/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/marcelarie/nvim-lua"><img src="https://dotfyle.com/marcelarie/nvim-lua/badges/plugin-manager?style=flat" /></a>


## Install Instructions

 > Install requires Neovim 0.9+. Always review the code before installing a configuration.

Clone the repository and install the plugins:

```sh
git clone git@github.com:marcelarie/nvim-lua ~/.config/marcelarie/nvim-lua
NVIM_APPNAME=marcelarie/nvim-lua/ nvim --headless +"PackerSync" +qa
```

Open Neovim with this config:

```sh
NVIM_APPNAME=marcelarie/nvim-lua/ nvim
```

## Plugins

### color

+ [brenoprata10/nvim-highlight-colors](https://dotfyle.com/plugins/brenoprata10/nvim-highlight-colors)
### colorscheme

+ [ishan9299/nvim-solarized-lua](https://dotfyle.com/plugins/ishan9299/nvim-solarized-lua)
+ [projekt0n/github-nvim-theme](https://dotfyle.com/plugins/projekt0n/github-nvim-theme)
+ [mhartington/oceanic-next](https://dotfyle.com/plugins/mhartington/oceanic-next)
+ [catppuccin/nvim](https://dotfyle.com/plugins/catppuccin/nvim)
+ [rebelot/kanagawa.nvim](https://dotfyle.com/plugins/rebelot/kanagawa.nvim)
+ [zootedb0t/citruszest.nvim](https://dotfyle.com/plugins/zootedb0t/citruszest.nvim)
+ [shaeinst/roshnivim-cs](https://dotfyle.com/plugins/shaeinst/roshnivim-cs)
+ [ishan9299/modus-theme-vim](https://dotfyle.com/plugins/ishan9299/modus-theme-vim)
+ [EdenEast/nightfox.nvim](https://dotfyle.com/plugins/EdenEast/nightfox.nvim)
+ [fenetikm/falcon](https://dotfyle.com/plugins/fenetikm/falcon)
### colorscheme-creation

+ [tjdevries/colorbuddy.nvim](https://dotfyle.com/plugins/tjdevries/colorbuddy.nvim)
+ [rktjmp/lush.nvim](https://dotfyle.com/plugins/rktjmp/lush.nvim)
### comment

+ [numToStr/Comment.nvim](https://dotfyle.com/plugins/numToStr/Comment.nvim)
+ [JoosepAlviste/nvim-ts-context-commentstring](https://dotfyle.com/plugins/JoosepAlviste/nvim-ts-context-commentstring)
+ [folke/todo-comments.nvim](https://dotfyle.com/plugins/folke/todo-comments.nvim)
### completion

+ [zbirenbaum/copilot.lua](https://dotfyle.com/plugins/zbirenbaum/copilot.lua)
+ [simrat39/rust-tools.nvim](https://dotfyle.com/plugins/simrat39/rust-tools.nvim)
+ [ms-jpq/coq_nvim](https://dotfyle.com/plugins/ms-jpq/coq_nvim)
+ [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)
### debugging

+ [mfussenegger/nvim-dap](https://dotfyle.com/plugins/mfussenegger/nvim-dap)
### diagnostics

+ [folke/trouble.nvim](https://dotfyle.com/plugins/folke/trouble.nvim)
### editing-support

+ [nvim-treesitter/nvim-treesitter-context](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter-context)
+ [ZhiyuanLck/smart-pairs](https://dotfyle.com/plugins/ZhiyuanLck/smart-pairs)
+ [gbprod/substitute.nvim](https://dotfyle.com/plugins/gbprod/substitute.nvim)
+ [m4xshen/autoclose.nvim](https://dotfyle.com/plugins/m4xshen/autoclose.nvim)
+ [nacro90/numb.nvim](https://dotfyle.com/plugins/nacro90/numb.nvim)
+ [windwp/nvim-ts-autotag](https://dotfyle.com/plugins/windwp/nvim-ts-autotag)
+ [sQVe/sort.nvim](https://dotfyle.com/plugins/sQVe/sort.nvim)
### file-explorer

+ [SidOfc/carbon.nvim](https://dotfyle.com/plugins/SidOfc/carbon.nvim)
+ [kyazdani42/nvim-tree.lua](https://dotfyle.com/plugins/kyazdani42/nvim-tree.lua)
### formatting

+ [cappyzawa/trim.nvim](https://dotfyle.com/plugins/cappyzawa/trim.nvim)
### fuzzy-finder

+ [ibhagwan/fzf-lua](https://dotfyle.com/plugins/ibhagwan/fzf-lua)
+ [jvgrootveld/telescope-zoxide](https://dotfyle.com/plugins/jvgrootveld/telescope-zoxide)
+ [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)
+ [axkirillov/easypick.nvim](https://dotfyle.com/plugins/axkirillov/easypick.nvim)
### git

+ [lewis6991/gitsigns.nvim](https://dotfyle.com/plugins/lewis6991/gitsigns.nvim)
+ [ruifm/gitlinker.nvim](https://dotfyle.com/plugins/ruifm/gitlinker.nvim)
+ [f-person/git-blame.nvim](https://dotfyle.com/plugins/f-person/git-blame.nvim)
+ [akinsho/git-conflict.nvim](https://dotfyle.com/plugins/akinsho/git-conflict.nvim)
+ [sindrets/diffview.nvim](https://dotfyle.com/plugins/sindrets/diffview.nvim)
### github

+ [pwntester/octo.nvim](https://dotfyle.com/plugins/pwntester/octo.nvim)
### icon

+ [kyazdani42/nvim-web-devicons](https://dotfyle.com/plugins/kyazdani42/nvim-web-devicons)
### indent

+ [nvimdev/indentmini.nvim](https://dotfyle.com/plugins/nvimdev/indentmini.nvim)
### keybinding

+ [max397574/better-escape.nvim](https://dotfyle.com/plugins/max397574/better-escape.nvim)
### lsp

+ [jubnzv/virtual-types.nvim](https://dotfyle.com/plugins/jubnzv/virtual-types.nvim)
+ [simrat39/symbols-outline.nvim](https://dotfyle.com/plugins/simrat39/symbols-outline.nvim)
+ [smjonas/inc-rename.nvim](https://dotfyle.com/plugins/smjonas/inc-rename.nvim)
+ [jose-elias-alvarez/null-ls.nvim](https://dotfyle.com/plugins/jose-elias-alvarez/null-ls.nvim)
+ [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
+ [amrbashir/nvim-docs-view](https://dotfyle.com/plugins/amrbashir/nvim-docs-view)
+ [kosayoda/nvim-lightbulb](https://dotfyle.com/plugins/kosayoda/nvim-lightbulb)
+ [RishabhRD/nvim-lsputils](https://dotfyle.com/plugins/RishabhRD/nvim-lsputils)
+ [j-hui/fidget.nvim](https://dotfyle.com/plugins/j-hui/fidget.nvim)
+ [jose-elias-alvarez/typescript.nvim](https://dotfyle.com/plugins/jose-elias-alvarez/typescript.nvim)
### lsp-installer

+ [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)
### markdown-and-latex

+ [AckslD/nvim-FeMaco.lua](https://dotfyle.com/plugins/AckslD/nvim-FeMaco.lua)
+ [toppair/peek.nvim](https://dotfyle.com/plugins/toppair/peek.nvim)
+ [ellisonleao/glow.nvim](https://dotfyle.com/plugins/ellisonleao/glow.nvim)
+ [iamcco/markdown-preview.nvim](https://dotfyle.com/plugins/iamcco/markdown-preview.nvim)
### marks

+ [ofirgall/open.nvim](https://dotfyle.com/plugins/ofirgall/open.nvim)
### motion

+ [ggandor/lightspeed.nvim](https://dotfyle.com/plugins/ggandor/lightspeed.nvim)
### note-taking

+ [jakewvincent/mkdnflow.nvim](https://dotfyle.com/plugins/jakewvincent/mkdnflow.nvim)
+ [nvim-neorg/neorg](https://dotfyle.com/plugins/nvim-neorg/neorg)
+ [renerocksai/telekasten.nvim](https://dotfyle.com/plugins/renerocksai/telekasten.nvim)
+ [mickael-menu/zk-nvim](https://dotfyle.com/plugins/mickael-menu/zk-nvim)
### nvim-dev

+ [rafcamlet/nvim-luapad](https://dotfyle.com/plugins/rafcamlet/nvim-luapad)
+ [ray-x/guihua.lua](https://dotfyle.com/plugins/ray-x/guihua.lua)
+ [folke/neodev.nvim](https://dotfyle.com/plugins/folke/neodev.nvim)
+ [nvim-lua/popup.nvim](https://dotfyle.com/plugins/nvim-lua/popup.nvim)
+ [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)
### plugin-manager

+ [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)
+ [wbthomason/packer.nvim](https://dotfyle.com/plugins/wbthomason/packer.nvim)
### preconfigured

+ [shaeinst/roshnivim](https://dotfyle.com/plugins/shaeinst/roshnivim)
### project

+ [nyngwang/NeoRoot.lua](https://dotfyle.com/plugins/nyngwang/NeoRoot.lua)
### quickfix

+ [ashfinal/qfview.nvim](https://dotfyle.com/plugins/ashfinal/qfview.nvim)
### register

+ [tversteeg/registers.nvim](https://dotfyle.com/plugins/tversteeg/registers.nvim)
### scrolling

+ [declancm/cinnamon.nvim](https://dotfyle.com/plugins/declancm/cinnamon.nvim)
### search

+ [ray-x/sad.nvim](https://dotfyle.com/plugins/ray-x/sad.nvim)
### session

+ [olimorris/persisted.nvim](https://dotfyle.com/plugins/olimorris/persisted.nvim)
### snippet

+ [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)
### split-and-window

+ [luukvbaal/stabilize.nvim](https://dotfyle.com/plugins/luukvbaal/stabilize.nvim)
### startup

+ [goolord/alpha-nvim](https://dotfyle.com/plugins/goolord/alpha-nvim)
### statusline

+ [rebelot/heirline.nvim](https://dotfyle.com/plugins/rebelot/heirline.nvim)
+ [b0o/incline.nvim](https://dotfyle.com/plugins/b0o/incline.nvim)
### syntax

+ [kylechui/nvim-surround](https://dotfyle.com/plugins/kylechui/nvim-surround)
+ [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)
### test

+ [klen/nvim-test](https://dotfyle.com/plugins/klen/nvim-test)
### utility

+ [jghauser/mkdir.nvim](https://dotfyle.com/plugins/jghauser/mkdir.nvim)
+ [jbyuki/instant.nvim](https://dotfyle.com/plugins/jbyuki/instant.nvim)
+ [stevearc/dressing.nvim](https://dotfyle.com/plugins/stevearc/dressing.nvim)
## Language Servers

+ eslint
+ html
+ ltex
+ texlab
+ tsserver
+ zk


 This readme was generated by [Dotfyle](https://dotfyle.com)

## Language Servers

### Lua LSP install

```bash
git clone https://github.com/sumneko/lua-language-server.git
git submodule update --init --recursive
cd 3rd/luamake &&
./compile/install.sh &&
cd ../.. &&
./3rd/luamake/luamake rebuild
```

### Startup time
```
Total Time:   17.774 -- Flawless Victory
```

### File Tree

```bash
.
├── Dockerfile
├── README.md
├── after
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
├── ltex-dictionaries
│   ├── ltex.dictionary.en-US.txt
│   └── ltex.hiddenFalsePositives.en-US.txt
├── lua
│   ├── aliases.lua
│   ├── autocommands.lua
│   ├── colorscheme.lua
│   ├── diff-view
│   │   └── init.lua
│   ├── firenvim_config.lua
│   ├── formatting.lua
│   ├── g-worktree
│   │   └── init.lua
│   ├── git-blame
│   │   └── init.lua
│   ├── git-related
│   │   └── init.lua
│   ├── git-sings
│   │   └── init.lua
│   ├── global.lua
│   ├── globals.lua
│   ├── leader-remaps.lua
│   ├── lsp
│   │   ├── bash.lua
│   │   ├── c.lua
│   │   ├── clangd.lua
│   │   ├── css.lua
│   │   ├── deno.lua
│   │   ├── docker.lua
│   │   ├── eslint.lua
│   │   ├── html.lua
│   │   ├── init.lua
│   │   ├── json.lua
│   │   ├── latex.lua
│   │   ├── ltex.lua
│   │   ├── lua.lua
│   │   ├── marksman.lua
│   │   ├── nix.lua
│   │   ├── null.lua
│   │   ├── perl.lua
│   │   ├── perlpls.lua
│   │   ├── php.lua
│   │   ├── python.lua
│   │   ├── ruby.lua
│   │   ├── rust.lua
│   │   ├── sql.lua
│   │   ├── stylelint.lua
│   │   ├── tsserver.lua
│   │   ├── vimls.lua
│   │   ├── yaml.lua
│   │   ├── zk.lua
│   │   └── znote.lua
│   ├── lsp-kind
│   │   └── init.lua
│   ├── lsp-saga
│   │   └── init.lua
│   ├── lsp-sign
│   │   └── init.lua
│   ├── lsp-trouble
│   │   └── init.lua
│   ├── lsp-trouble-keybindings.lua
│   ├── mappings.lua
│   ├── my-utils
│   │   └── init.lua
│   ├── nv-telescope
│   │   └── init.lua
│   ├── octo
│   │   └── init.lua
│   ├── plugins
│   │   ├── alpha-menu
│   │   │   └── init.lua
│   │   ├── autopairs
│   │   │   └── init.lua
│   │   ├── autosession
│   │   │   └── init.lua
│   │   ├── better-esc
│   │   │   └── init.lua
│   │   ├── bubbly
│   │   │   └── init.lua
│   │   ├── carbon
│   │   │   └── init.lua
│   │   ├── catpuccin
│   │   │   └── init.lua
│   │   ├── cmp-setup
│   │   │   ├── init.lua
│   │   │   └── sources
│   │   │       ├── cmp-fish.lua
│   │   │       ├── cmp-gh_issues.lua
│   │   │       └── cmp-git.lua
│   │   ├── color-buddy
│   │   │   └── init.lua
│   │   ├── colorizer-setup
│   │   │   └── init.lua
│   │   ├── comment-box
│   │   │   └── init.lua
│   │   ├── context-print
│   │   │   └── init.lua
│   │   ├── coq
│   │   │   └── init.lua
│   │   ├── crates
│   │   │   └── init.lua
│   │   ├── dirbuf
│   │   │   └── init.lua
│   │   ├── distant
│   │   │   └── init.lua
│   │   ├── dressing
│   │   │   └── init.lua
│   │   ├── due-date
│   │   │   └── init.lua
│   │   ├── easy-pick
│   │   │   └── init.lua
│   │   ├── feline-status
│   │   │   └── init.lua
│   │   ├── fidget
│   │   │   └── init.lua
│   │   ├── focus
│   │   │   └── init.lua
│   │   ├── git-conflict
│   │   │   └── init.lua
│   │   ├── heirline
│   │   │   └── init.lua
│   │   ├── highlight-curr-n
│   │   │   └── init.lua
│   │   ├── impatient
│   │   │   └── init.lua
│   │   ├── inc-rename
│   │   │   └── init.lua
│   │   ├── lightbulb
│   │   │   └── init.lua
│   │   ├── lighthaus
│   │   │   └── init.lua
│   │   ├── lightspeed
│   │   │   └── init.lua
│   │   ├── linearf
│   │   │   └── init.lua
│   │   ├── lsp-lines
│   │   │   └── init.lua
│   │   ├── lsp-uti
│   │   │   └── init.lua
│   │   ├── lua-autopairs
│   │   │   └── init.lua
│   │   ├── lualine-status
│   │   │   └── init.lua
│   │   ├── luasnip
│   │   │   └── init.lua
│   │   ├── markdown-preview
│   │   │   └── init.lua
│   │   ├── neoclip
│   │   │   └── init.lua
│   │   ├── neodev
│   │   │   └── init.lua
│   │   ├── neorg
│   │   │   └── init.lua
│   │   ├── neoroot
│   │   │   └── init.lua
│   │   ├── nerd-tree
│   │   │   └── init.lua
│   │   ├── netrw
│   │   │   └── init.lua
│   │   ├── neuron-nvim
│   │   │   └── init.lua
│   │   ├── notifier
│   │   │   └── init.lua
│   │   ├── notify
│   │   │   └── init.lua
│   │   ├── numb-nvim
│   │   │   └── init.lua
│   │   ├── numbers
│   │   │   └── init.lua
│   │   ├── nvim-commented
│   │   │   └── init.lua
│   │   ├── nvim-cursorline
│   │   │   └── init.lua
│   │   ├── nvim-highlight-colors
│   │   │   └── init.lua
│   │   ├── nvim-tree
│   │   │   └── init.lua
│   │   ├── open
│   │   │   └── init.lua
│   │   ├── pack-cmp
│   │   │   └── init.lua
│   │   ├── pairs
│   │   │   ├── init.lua
│   │   │   └── smart-pairs
│   │   │       └── init.lua
│   │   ├── persistence
│   │   │   └── init.lua
│   │   ├── prime-harpoon
│   │   │   └── init.lua
│   │   ├── quick-scope
│   │   │   └── init.lua
│   │   ├── range-high
│   │   │   └── init.lua
│   │   ├── refactor
│   │   │   └── init.lua
│   │   ├── regexplainer
│   │   │   └── init.lua
│   │   ├── rs-tools
│   │   │   └── init.lua
│   │   ├── sad
│   │   │   └── init.lua
│   │   ├── session-manager
│   │   │   └── init.lua
│   │   ├── spell-sitter
│   │   │   └── init.lua
│   │   ├── substitute
│   │   │   └── init.lua
│   │   ├── surround
│   │   │   └── init.lua
│   │   ├── symbols
│   │   │   └── init.lua
│   │   ├── text-case
│   │   │   └── init.lua
│   │   ├── todo-finder
│   │   │   └── init.lua
│   │   ├── treesitter
│   │   │   └── init.lua
│   │   ├── trevJ
│   │   │   └── init.lua
│   │   ├── trim-lua
│   │   │   └── init.lua
│   │   ├── ts-autotags
│   │   │   └── init.lua
│   │   ├── ts-utils
│   │   │   └── init.lua
│   │   ├── undo-tree
│   │   │   └── init.lua
│   │   ├── vimtex
│   │   │   └── init.lua
│   │   ├── vsnip-config
│   │   │   └── init.lua
│   │   ├── web-devicons
│   │   │   └── init.lua
│   │   └── whichkey
│   │       └── init.lua
│   ├── plugins.lua
│   ├── settings.lua
│   ├── surroundings.lua
│   ├── telescope-keybindings.lua
│   ├── test.http
│   └── vim-keybindings
│       └── init.lua
├── minimal-configs
│   └── minimal_cmp_copilot.lua
├── plugin
│   └── packer_compiled.lua
├── scripts
│   └── install-lang-servers.sh
├── spell
│   ├── en.utf-8.add
│   └── en.utf-8.add.spl
└── stylua.toml

106 directories, 160 files
```
