let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/work/conejocookie
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +80 pkg/rest/rest.go
badd +142 cmd/wynton/internal/app/draft_order.go
badd +75 cmd/wynton/internal/config/config.go
badd +24 cmd/wynton/main.go
badd +52 cmd/wynton/internal/app/app.go
badd +29 cmd/wynton/internal/app/wynton.go
badd +225 cmd/wynton/internal/app/draft_order_test.go
badd +14 cmd/wynton/internal/model/order.go
badd +0 ~/work/conejocookie/.github/workflows/go.yml
argglobal
%argdel
edit ~/work/conejocookie/.github/workflows/go.yml
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
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
exe 'vert 1resize ' . ((&columns * 40 + 105) / 211)
exe 'vert 2resize ' . ((&columns * 100 + 105) / 211)
exe 'vert 3resize ' . ((&columns * 69 + 105) / 211)
argglobal
enew
file \[coc-explorer]-1
balt cmd/wynton/internal/model/order.go
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal nofen
wincmd w
argglobal
balt cmd/wynton/internal/app/draft_order_test.go
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 13 - ((12 * winheight(0) + 28) / 57)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 13
normal! 0
wincmd w
argglobal
if bufexists("cmd/wynton/internal/app/draft_order.go") | buffer cmd/wynton/internal/app/draft_order.go | else | edit cmd/wynton/internal/app/draft_order.go | endif
if &buftype ==# 'terminal'
  silent file cmd/wynton/internal/app/draft_order.go
endif
balt cmd/wynton/internal/config/config.go
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
44
normal! zo
78
normal! zo
105
normal! zo
let s:l = 139 - ((48 * winheight(0) + 28) / 57)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 139
normal! 033|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 40 + 105) / 211)
exe 'vert 2resize ' . ((&columns * 100 + 105) / 211)
exe 'vert 3resize ' . ((&columns * 69 + 105) / 211)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0&& getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
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
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
