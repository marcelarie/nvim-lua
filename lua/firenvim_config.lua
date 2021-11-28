vim.cmd("autocmd BufWritePre * :set lines=120")
vim.cmd("set guifont=monospace:h8")
vim.cmd("set showtabline=1")
vim.cmd("set shortmess+=F")
vim.cmd("set colorcolumn=0")
vim.cmd("set textwidth=200")
vim.cmd("set noruler")
vim.cmd("let g:ale_enabled = 0")
vim.cmd("set cmdheight=1")
vim.cmd("set laststatus=0")
vim.cmd("set showmode")
vim.cmd("set nocursorline")
vim.cmd("set nonumber")
vim.api.nvim_set_keymap("n", "<Leader>q", ":wq<cr>", { noremap = true, silent = true })
vim.cmd([[
        let g:firenvim_config = {
            \ 'globalSettings': {
                \ 'alt': 'all',
            \  },
            \ 'localSettings': {
                \ '.*': {
                    \ 'cmdline': 'neovim',
                    \ 'content': 'text',
                    \ 'priority': 0,
                    \ 'selector': 'textarea',
                    \ 'takeover': 'always',
                \ },
            \ }
        \ }

        let fc = g:firenvim_config['localSettings']
        let fc['https?://[^/]*notion.so/*'] = { 'takeover': 'never', 'priority': 1 }
    ]])
vim.cmd([[
        function! s:IsFirenvimActive(event) abort
          if !exists('*nvim_get_chan_info')
            return 0
          endif
          let l:ui = nvim_get_chan_info(a:event.chan)
          return has_key(l:ui, 'client') && has_key(l:ui.client, 'name') &&
              \ l:ui.client.name =~? 'Firenvim'
        endfunction

        function! SetLinesForFirefox()
            set lines=28 columns=110 laststatus=0
        endfunction

        function! OnUIEnter(event) abort
          if s:IsFirenvimActive(a:event)
            call SetLinesForFirefox()
            nnoremap <silent> <Leader>f :call SetLinesForFirefox()<CR>
          endif
        endfunction

        autocmd UIEnter * call OnUIEnter(deepcopy(v:event))
    ]])
