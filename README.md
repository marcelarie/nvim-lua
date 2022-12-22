# Neovim config

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
