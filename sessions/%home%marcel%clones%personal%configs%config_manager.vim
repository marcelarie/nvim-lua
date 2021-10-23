let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/clones/personal/configs/config_manager
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
edit xdg_config/nvim/after/plugin/cmp_gh_source.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 135 + 136) / 272)
exe 'vert 2resize ' . ((&columns * 136 + 136) / 272)
argglobal
balt xdg_config/nvim/after/plugin/cmp_gh_source.lua
let s:l = 17 - ((16 * winheight(0) + 33) / 67)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 17
normal! 0
wincmd w
argglobal
if bufexists("~/clones/personal/configs/config_manager/xdg_config/nvim/after/plugin/luasnip.lua") | buffer ~/clones/personal/configs/config_manager/xdg_config/nvim/after/plugin/luasnip.lua | else | edit ~/clones/personal/configs/config_manager/xdg_config/nvim/after/plugin/luasnip.lua | endif
if &buftype ==# 'terminal'
  silent file ~/clones/personal/configs/config_manager/xdg_config/nvim/after/plugin/luasnip.lua
endif
balt ~/clones/personal/configs/config_manager/xdg_config/nvim/after/plugin/completion.lua
let s:l = 331 - ((58 * winheight(0) + 33) / 67)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 331
normal! 0
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 135 + 136) / 272)
exe 'vert 2resize ' . ((&columns * 136 + 136) / 272)
tabnext 1
badd +17 xdg_config/nvim/after/plugin/cmp_gh_source.lua
badd +39 ~/clones/personal/configs/config_manager/xdg_config/nvim/after/plugin/completion.lua
badd +0 ~/clones/personal/configs/config_manager/xdg_config/nvim/after/plugin/luasnip.lua
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOFc
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
