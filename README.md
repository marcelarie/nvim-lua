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
Startuptime: 158.78ms

LazyStart 11.56ms
LazyDone  122.16ms (+110.6ms)
UIEnter   158.78ms (+36.61ms)
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
│   ├── lazy-bootstrap.lua
│   ├── lazy-plugins.lua
│   ├── lsp-on-attach.lua
│   ├── lsp-setup.lua
│   ├── options.lua
│   ├── plugins
│   │   ├── alpha.lua
│   │   ├── avante.lua
│   │   ├── bamboo-colorscheme.lua
│   │   ├── blame.lua
│   │   ├── blink.lua
│   │   ├── boo.lua
│   │   ├── cmp.lua
│   │   ├── colorbox.lua
│   │   ├── colorschemes.lua
│   │   ├── comment.lua
│   │   ├── copilot.lua
│   │   ├── debug.lua
│   │   ├── dropbar.lua
│   │   ├── easypick.lua
│   │   ├── everforest-colorscheme.lua
│   │   ├── flog.lua
│   │   ├── footnote.lua
│   │   ├── fzf.lua
│   │   ├── git-blame.lua
│   │   ├── git-conflict.lua
│   │   ├── git-signs.lua
│   │   ├── harpoon.lua
│   │   ├── hoversplit.lua
│   │   ├── img-clip.lua
│   │   ├── incline.lua
│   │   ├── init.lua
│   │   ├── kanagawa.lua
│   │   ├── lazydev.lua
│   │   ├── link-vim.lua
│   │   ├── lsp-trouble.lua
│   │   ├── luasnip.lua
│   │   ├── markdown.lua
│   │   ├── markdown-preview.lua
│   │   ├── mason-null-ls.lua
│   │   ├── mdx.lua
│   │   ├── mini-notify.lua
│   │   ├── mini-starter.lua
│   │   ├── mini-status.lua
│   │   ├── neoclip.lua
│   │   ├── no-clown-fiesta.lua
│   │   ├── nvim-highlight-colors.lua
│   │   ├── nvim-nu.lua
│   │   ├── nvim-surround.lua
│   │   ├── nvim-treesitter-context.lua
│   │   ├── oil.lua
│   │   ├── rustaceanvim.lua
│   │   ├── session.lua
│   │   ├── snap.lua
│   │   ├── substitute.lua
│   │   ├── telekasten.lua
│   │   ├── telescope.lua
│   │   ├── timber.lua
│   │   ├── tsc.lua
│   │   ├── ts-comments.lua
│   │   ├── undotree.lua
│   │   ├── urlview.lua
│   │   ├── vgit.lua
│   │   ├── watch.lua
│   │   ├── zen-mode.lua
│   │   └── zk.lua
│   ├── profiler.lua
│   ├── sys-clip.lua
│   ├── tmux.lua
│   ├── treesitter-setup.lua
│   ├── ziggy.lua
│   └── zig-official-color.lua
├── README.md
├── scripts
│   └── install-neovim-latest.sh
├── spell
│   ├── en.utf-8.add
│   └── en.utf-8.add.spl
├── startup.log
└── stylua.toml

8 directories, 95 files
```

Dependencies:

- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fd](https://github.com/sharkdp/fd)
- [fzf](https://github.com/junegunn/fzf)
- [bat](https://githubn.com/sharkdp/bat)
