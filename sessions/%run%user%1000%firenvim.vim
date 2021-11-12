let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd /run/user/1000/firenvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
edit github.com_soysuper-supers-issues-7792_TEXTAREA-id-new-comment-field_2021-11-12T09-52-12-446Z.txt
argglobal
balt github.com_soysuper-supers-issues-7792_TEXTAREA-id-new-comment-field_2021-11-12T09-52-12-446Z.txt
let s:l = 3 - ((2 * winheight(0) + 2) / 4)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 3
normal! 0
tabnext 1
badd +0 github.com_soysuper-supers-issues-7792_TEXTAREA-id-new-comment-field_2021-11-12T09-52-12-446Z.txt
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
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
