
"SETTINGS:"
    " TreeSitter active
    syntax off
    filetype on
    autocmd FileType vim set foldmethod=indent
    set foldnestmax=1
    " autocmd FileType markdown set spell
    set spelllang=en,es
    set nu
    set relativenumber 
    set noerrorbells
    " Insert space characters for tabs.
    set expandtab
    set smarttab
    set smartindent 
    set tabstop=4 softtabstop=4
    set shiftwidth=4
    " Opening a new file when the current 
    " buffer has unsaved changes causes files 
    " to be hidden instead of closed.
    set hidden
    " No wrapping on the lines if they pass the screen
    " width.
    set nowrap
    " Case sensitive search.
    " :set nosmartcase
    set smartcase
    " disable creating swap files entirely.
        " set nobackup
        " set noswapfile
        " create a undodir for persisten undo 
        " after vim closes.
        set undofile
        set undodir=~/.vim/undodir
     " Turn on backup option
    set backup
    "Where to store backups
    set backupdir=~/.vim/backup
    "Make backup before overwriting the current buffer
    set writebackup
    "Overwrite the original backup file
    set backupcopy=yes
    "Meaningful backup name, ex: filename@2015-04-05.14:59
    au BufWritePre * let &bex = '@' . strftime("%F.%H:%M")
    " incremental search to move the 
    " highlight as you add characters.
    set incsearch
    " 8 lines on top/bottom of cursor when scrolling.
    set scrolloff=8
    set noshowcmd 
    set nohlsearch
    set noruler
    " invert screen splits.
    set splitbelow
    set splitright
    " Vim will wait for 500 ms after each 
    " keystroke for the mappings.
    set timeoutlen=500
    " Vim waits 300 ms after you stop typing
    " before it triggers the plugin.
    set updatetime=300
    set signcolumn=yes
    set colorcolumn=80
    " Turning off compatibility with old vi.
    set nocompatible
    filetype plugin on
    " Autoread
    " set autoread
    " Two spaces tabs
    " set cmdheight=2
    "2 tabs
    " set tabstop=2
    " set softtabstop=2
    " set shiftwidth=4

"PLUG:"
    call plug#begin('~/.vim/plugged')
    Plug 'lifepillar/vim-gruvbox8'
    Plug 'phanviet/vim-monokai-pro'
    Plug 'mhartington/oceanic-next'
    Plug 'tpope/vim-fugitive'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'stsewd/fzf-checkout.vim'
    Plug 'christoomey/vim-system-copy'
    Plug 'KabbAmine/vCoolor.vim'
    Plug 'theprimeagen/vim-be-good'
    Plug 'itchyny/lightline.vim'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(2) } }
    Plug 'szw/vim-maximizer'
    Plug 'alvan/vim-closetag'
    Plug 'szw/vim-g'
    Plug 'jiangmiao/auto-pairs'
    Plug 'jfonseca8/vim-bujo'
    Plug 'scrooloose/nerdcommenter'
    Plug 'tweekmonster/startuptime.vim'
    Plug 'tpope/vim-surround'
    Plug 'dbeniamine/cheat.sh-vim'
    Plug 'mbbill/undotree'
    Plug 'honza/vim-snippets'

    "STILL TESTING:"
    Plug 'lervag/vimtex'
    Plug 'vim-scripts/loremipsum'
    Plug 'stephpy/vim-php-cs-fixer'

    " Prettier
    Plug 'prettier/vim-prettier', {
          \ 'do': 'yarn install',
          \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
          
    " Telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'

    "TreeSitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
    Plug 'nvim-treesitter/playground'

    "Lua
    Plug 'euclidianAce/BetterLua.vim'
    Plug 'rafcamlet/nvim-luapad'

    "React
    Plug 'MaxMEllon/vim-jsx-pretty'
    Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
    
    " MAYBE LATER:
    " ...

    " FORGOTTEN:
    " Plug 'morhetz/gruvbox'
    " Plug 'cakebaker/scss-syntax.vim'
    " Plug 'mattn/emmet-vim'
    " Plug 'flazz/vim-colorschemes'
    " Plug 'raimondi/delimitmate'
    " Plug 'lifepillar/vim-gruvbox8'
    " Plug 'vimwiki/vimwiki'
    " Plug 'justincampbell/vim-eighties'
    " Plug 'valloric/youcompleteme'
    " Plug 'othree/html5.vim'
    " Plug 'puremourning/vimspector'
    " Plug 'sheerun/vim-polyglot'
    " Plug 'leafgarland/typescript-vim'
    " Plug 'roman/golden-ratio'
    " Plug 'rstacruz/vim-closer'
    " Plug 'hail2u/vim-css3-syntax'
    " Plug 'jiangmiao/auto-pairs'
    " Plug 'vim-airline/vim-airline'
    " Plug 'vim-airline/vim-airline-themes'
    call plug#end()

"COLORSCHEME:"
    if (has("termguicolors"))
         set termguicolors
    endif
    colorscheme gruvbox8
    
"LIGHTLINE:"
    let g:lightline = {
      \ 'colorscheme': 'gruvbox8',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

"FIRENVIM:"
    au BufEnter github.com_*.txt set filetype=markdown
    " let fc = g:firenvim_config['localSettings']
    " let fc['https?://twitter.com/'] = { 'takeover': 'never', 'priority': 1 }

"Leader Keybindings:"
    let mapleader = " "
    " Open tab
    map <leader>t :tabnew<cr>
    " Split screen
    map <leader>s :split<cr>
    map <leader>vs :vsplit<cr>
    " Split screen and resize 55
    nnoremap <leader>ss :wincmd v<bar> :Ex <bar> :vertical resize 55<CR>
    " Saves the file.
    map <leader>w :w<cr>
    " Saves the file with force.
    map <leader>W :w!<cr>
    " Quits vim.
    map <leader>q :q<cr>
    " Quits vim with force.
    map <leader>Q :q!<cr>
    " Autoread.(editor)
    map <leader>a :e<cr>
    " Changes windows
    nnoremap <leader>h :wincmd h<CR>
    nnoremap <leader>j :wincmd j<CR>
    nnoremap <leader>k :wincmd k<CR>
    nnoremap <leader>l :wincmd l<CR>
    " Resize vertical windows
    nnoremap <Leader>+ :vertical resize +5<CR>
    nnoremap <Leader>- :vertical resize -5<CR>
    "Source init.vim
    nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
    " Go to tab by number
    noremap <leader>1 1gt
    noremap <leader>2 2gt
    noremap <leader>3 3gt
    noremap <leader>4 4gt
    noremap <leader>5 5gt
    noremap <leader>6 6gt
    noremap <leader>7 7gt
    noremap <leader>8 8gt
    noremap <leader>9 9gt
    noremap <leader>0 :tablast<cr>
    " Fugitive Keybindings
    nmap <leader>g :Git<CR>
    nmap <leader>gh :diffget //3<CR>
    nmap <leader>gl :diffget //2<CR>
    nmap <leader>c :Git commit<CR> 
    autocmd Filetype fugitive nmap <leader>p :Git push<bar> :q<CR> 
    nmap <leader>gb :GBranches<CR> 
    " nmap <leader>r :Rg<CR> 
    nmap <leader>f :Buffers<CR> 
    nnoremap <C-p> :GitFiles<CR>
    " Maximizer
    nnoremap <leader>m :MaximizerToggle!<CR>
    " vim TODO
    nnoremap <leader>T :Todo<CR>
    nmap <Leader>t <Plug>BujoAddnormal
    nmap <Leader>x <Plug>BujoChecknormal

"VCoolor:"
    nnoremap <leader>vc :VCoolor<CR>

"SurroundVim:"
    nmap <leader>lo :norm yssfconsole.log<CR> 

"AutoRun:"
    " FOR PYTHON:
        " Runs the code.
            " autocmd FileType python map <buffer> <leader>e <esc>:w<CR>:8split term://python3 %<CR>
        " Runs the code but clears the terminal before.
             "autocmd FileType python map <buffer> <leader>E <esc>:w<esc>:!clear<CR>:8split term://python shellescape(@%, 1)<CR>
    " FOR JS:
        " Runs the code.
        autocmd FileType javascript map <buffer> <leader>we <esc>:w<CR>:8split term://node %<CR>
        " Runs just selected code
            " autocmd FileType javascript map <buffer> <leader>c <esc>:w<CR>:8split '<,'>term://node %<CR>

"COC SETTINGS:"
    "COC EXPLORER:"
        nmap <space>e :CocCommand explorer<CR>
    "CocAuto Install:"
    let g:coc_global_extensions = [
        \ 'coc-tsserver',
        \ 'coc-vimlsp',
        \ 'coc-css',
        \ 'coc-explorer',
        \ 'coc-html',
        \ 'coc-json',
        \ 'coc-phpls',
        \ 'coc-lua',
        \ 'coc-sh',
        \ 'coc-rust-analyzer',
        \ 'coc-python',
        \ 'coc-lists',
        \ 'coc-git',
        \ 'coc-sql',
        \ 'coc-db',
        \ 'coc-snippets',
        \ 'coc-marketplace',
        \ 'coc-emoji',
        \ 'coc-scssmodules',
        \ 'coc-word'
        \]
    "Coc Def Ref:"
        nmap <leader>gd <Plug>(coc-definition)
        nmap <leader>gr <Plug>(coc-references)
    "Coc Rename:"
        " Symbol renaming.
        nmap <leader>rn <Plug>(coc-rename)

    "CocVim KB:"
        " Use tab for trigger completion with characters ahead and navigate.
        " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
        " other plugin before putting this into your config.
        inoremap <silent><expr> <TAB>
              \ pumvisible() ? "\<C-n>" :
              \ <SID>check_back_space() ? "\<TAB>" :
              \ coc#refresh()
        inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

        " <CR>: confirm completion, or insert <CR>
        inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

        function! s:check_back_space() abort
          let col = col('.') - 1
          return !col || getline('.')[col - 1]  =~# '\s'
        endfunction

"FZF:"
    let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
    let $FZF_DEFAULT_OPTS='--reverse'    

"Auto Pairs:"
     let g:AutoPairsFlyMode = 0
     let g:AutoPairsMultilineClose = 0
     au FileType html let b:AutoPairs = AutoPairsDefine({'<!--' : '-->'})
     au FileType css  let b:AutoPairs = AutoPairsDefine({'/*' : '*/'})
     au FileType javascript let b:AutoPairs = AutoPairsDefine({'/*' : '*/'})

"NERDCOMMENTER:"
    " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 2

    " Use compact syntax for prettified multi-line comments
    let g:NERDCompactSexyComs = 1

"LaTeX:"
    let g:vimtex_view_method = 'zathura'
    let g:vimtex_compiler_progname = 'latexmk'

"DelimitMate:"
    " let delimitMate_expand_cr = 1
    " let delimitMate_expand_space = 1

"VimG Google:"
      let g:vim_g_command = "Go"
      let g:vim_g_f_command = "Gf"
      map <leader>go :Go<cr>
      map <leader>gf :Gf<cr>

"UndoTree:"
    nnoremap <leader>ut :UndotreeToggle<CR>

"Tree Sitter:"
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
lua require("treesitter")
"ColorizerLua:""
lua require'colorizer'.setup()

"CheatSh:"
    nnoremap <leader>ch :Cheat<cr>

"ABBREVIATIONS:"
    iabbrev log console.log(
    " iabbrev $ $(

"Remove Arrows:"
    " Remove newbie crutches in Normal Mode
     nnoremap <Down> <Nop>
     nnoremap <Left> <Nop>
     nnoremap <Right> <Nop>
     nnoremap <Up> <Nop>

     " Remove newbie crutches in Visual Mode
     vnoremap <Down> <Nop>
     vnoremap <Left> <Nop>
     vnoremap <Right> <Nop>
     vnoremap <Up> <Nop>

"Plug Keybindings:"
    nnoremap <leader>pi :PlugInstall<cr>
    nnoremap <leader>pc :PlugClean<cr>
    nnoremap <leader>pu :PlugUpdate<cr>

"VimRC Keybindings:"
    let g:php_cs_fixer_path = "~/programs/php-cs-fixer-v2.phar"
    " Format on save (only php files)
    autocmd FileType php map <leader>w :w <bar> :call PhpCsFixerFixFile()<cr><cr>
    " nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<CR>

"AUTOCOMMANDS:"
    " augroup coc-explorer
    " au VimEnter * :if bufname()=='' | call execute('CocCommand explorer') | endif
    " augroup END

"BONUS INFO:"
    " With the youcompletme pluggin there always the [ID] to show what its a variable, i change it to [V] 
    " to put the default one change the line with extra_menu_info on the file identifier_completer.py :D
    " 
    " On Tree Sitter:
    " Install languages:
    " :TSInstall c bash html json css javascript php lua python regex rust typescript query
    " On Vim Surround:
    " cs"' >> change \" to \'
    " cs'<q> >> change it to <q>
    " ds" >> delete "
    " ysiw] >> surround word with []
    " cs]{ >> change [ for {
    " yssb >> wrap whole line
