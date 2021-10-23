let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
edit ~/.config/nvim/lua/plugins/luasnip/init.lua
argglobal
balt ~/.config/nvim/lua/plugins/cmp-setup/init.lua
let s:l = 60 - ((8 * winheight(0) + 33) / 67)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 60
normal! 0
tabnext 1
badd +40 lua/plugins/cmp-setup/sources/cmp-fish.lua
badd +31 ~/.config/nvim/init.lua
badd +31 ~/.config/nvim/lua/plugins/cmp-setup/init.lua
badd +86 ~/.config/nvim/lua/plugins/luasnip/init.lua
badd +69 ~/.config/nvim/lua/plugins/cmp-setup/sources/cmp-gh_issues.lua
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOFc
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
