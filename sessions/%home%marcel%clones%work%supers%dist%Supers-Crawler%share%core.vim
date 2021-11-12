let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/clones/work/supers/dist/Supers-Crawler/share/core
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
edit browser/index.js
argglobal
balt ~/clones/work/supers/dist/Supers-Crawler/lib/Supers/France/Autourdebebe.pm
let s:l = 243 - ((54 * winheight(0) + 33) / 67)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 243
normal! 0
tabnext 1
badd +11 ~/clones/work/supers/dist/Supers-Crawler/lib/Supers/Italy/Esselungaacasa.pm
badd +33 ~/clones/work/supers/dist/Supers-Crawler/lib/Supers/France/Autourdebebe.pm
badd +6 ~/clones/work/supers/dist/Supers-Crawler/lib/Supers/France/Cdiscount.pm
badd +44 ~/clones/work/supers/dist/Supers-Crawler/lib/Supers/Crawler/AntiCaptcha.pm
badd +32 ~/clones/work/supers/dist/Supers-Crawler/lib/Supers/Mercadona/V1.pm
badd +1 ~/clones/work/supers/apps/buy_it_now/client/src/utils/index.js
badd +12 ~/clones/work/supers/dist/Supers-Crawler/share/france/autourdebebe/index.js
badd +0 browser/index.js
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
