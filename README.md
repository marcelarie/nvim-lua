## Install Instructions

> Install requires Neovim 0.10+. Always review the code before installing a configuration.

Clone the repository and install the plugins:

```bash
git clone git@github.com:marcelarie/nvim-lua ~/.config/marcelarie-nvim-lua
NVIM_APPNAME=marcelarie-nvim-lua/ nvim --headless +"Lazy! sync" +qa
```

Open Neovim with this config:

```bash
NVIM_APPNAME=marcelarie-nvim-lua/ nvim
```

## Startup time

```bash
LazyStart 17.24ms
LazyDone  219.65ms (+202.41ms)
UIEnter   289.97ms (+70.32ms)
```

## File Tree

```bash
.
├── data
│   └── telescope-sources
│       ├── emoji.json
│       ├── gitmoji.json
│       ├── julia.json
│       ├── kaomoji.json
│       ├── latex.json
│       ├── math.json
│       └── url_encoded.json
├── Dockerfile
├── info.md
├── init.lua
├── lazy-lock.json
├── ltex-dictionaries
│   ├── ltex.dictionary.en-US.txt
│   └── ltex.hiddenFalsePositives.en-US.txt
├── lua
│   ├── autocmd.lua
│   ├── color-settings.lua
│   ├── commands.lua
│   ├── global.lua
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
│   │   ├── automa.lua
│   │   ├── avante.lua
│   │   ├── blink.lua
│   │   ├── boo.lua
│   │   ├── cmp.lua
│   │   ├── colorbox.lua
│   │   ├── colorizer.lua
│   │   ├── colorschemes.lua
│   │   ├── comment.lua
│   │   ├── dropbar.lua
│   │   ├── easypick.lua
│   │   ├── fall.lua
│   │   ├── feline.lua
│   │   ├── flog.lua
│   │   ├── fzf.lua
│   │   ├── git-blame.lua
│   │   ├── git-conflict.lua
│   │   ├── git-signs.lua
│   │   ├── gp.lua
│   │   ├── harpoon.lua
│   │   ├── highlight-undo.lua
│   │   ├── hoversplit.lua
│   │   ├── img-clip.lua
│   │   ├── incline.lua
│   │   ├── init.lua
│   │   ├── kanagawa.lua
│   │   ├── lazydev.lua
│   │   ├── linefly.lua
│   │   ├── lsp-trouble.lua
│   │   ├── lualine.lua
│   │   ├── luasnip.lua
│   │   ├── markdown.lua
│   │   ├── markdown-preview.lua
│   │   ├── markview.lua
│   │   ├── mason-null-ls.lua
│   │   ├── mdx.lua
│   │   ├── neoclip.lua
│   │   ├── nvim-nu.lua
│   │   ├── nvim-surround.lua
│   │   ├── nvim-treesitter-context.lua
│   │   ├── oil.lua
│   │   ├── ollama.lua
│   │   ├── otter.lua
│   │   ├── rest.lua
│   │   ├── session.lua
│   │   ├── sg.lua
│   │   ├── snap.lua
│   │   ├── sttusline.lua
│   │   ├── substitute.lua
│   │   ├── telekasten.lua
│   │   ├── telescope.lua
│   │   ├── text-to-colorscheme.lua
│   │   ├── tsc.lua
│   │   ├── undotree.lua
│   │   ├── urlview.lua
│   │   ├── vim-ai.lua
│   │   ├── watch.lua
│   │   ├── zen-mode.lua
│   │   └── zk.lua
│   ├── tmux.lua
│   └── treesitter-setup.lua
├── README.md
├── scripts
│   └── install-neovim-latest.sh
├── spell
│   ├── en.utf-8.add
│   └── en.utf-8.add.spl
└── stylua.toml

10 directories, 90 files
```

Dependencies:
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fd](https://github.com/sharkdp/fd)
- [fzf](https://github.com/junegunn/fzf)
- [bat](https://githubn.com/sharkdp/bat)
