
set nocompatible
set encoding=utf-8 fileencoding= nobackup
set noruler noshowmatch noshowmode nowrapscan report=1 modelines=10
set scrolloff=4 nohlsearch wrap linebreak sidescrolloff=5 sidescroll=1
set ignorecase nojoinspaces autoindent
set expandtab smarttab nosmartindent
set shiftwidth=4 tabstop=8 softtabstop=4
set shiftwidth=2 tabstop=8 softtabstop=4
set printfont=courier:h9 popt=paper:a4,left:5mm,right:5mm,top:5mm,bottom:5mm,syntax:n,portrait:n,formfeed:y

" set showtabline=2
set mouse=a

set tags=vitags\ tags\ ../vitags\ ../tags\ ../../vitags\ ../../tags\ $wacgenlib/vitags\ $wacgenlib/tags
set matchpairs=(:),{:},[:],<:>
set shortmess=aoOtTI
set noerrorbells visualbell t_vb=
set novisualbell

set diffopt=filler,context:4,icase,iwhite
set diffopt=filler,context:4,iwhite
set diffopt=filler,context:4
let diff_tem = 1
let diff_tem = 0

set diffexpr=MyDiff()
function MyDiff()
    let opt = ""
    if g:diff_tem           | let opt .= "-I '^[ \t]*\\#_template' " | endif
    if &diffopt =~ "icase"  | let opt .= "-i "   | endif
    if &diffopt =~ "iwhite" | let opt .= "-bBw " | endif
    silent execute "!diff -a " . opt . v:fname_in . " " . v:fname_new . " > " . v:fname_out
    redraw!
    redraws!
endfunction

" let did_load_filetypes = 1
" syntax off
filetype plugin on

set guifont=Courier\ New\ 8

let loaded_matchparen = 1
" let did_load_filetypes = 1

" abbr SQLCODE sqlca.sqlcode
" abbr notfound NOTFOUND
" abbr sqlcount sqlca.sqlerrd[3]
" abbr sqlisam sqlca.sqlerrd[2]
" abbr sqlrowid sqlca.sqlerrd[6]
" abbr sqlserial sqlca.sqlerrd[2]

abbr Heirarchy Hierarchy
abbr heirarchy hierarchy
abbr initialise initialize
abbr Heir Hier
abbr heir hier
abbr Teh The
abbr teh the
abbr vase case
abbr tehn then
abbr exti exit
abbr tav tab
abbr thakns thanks
abbr Thakns Thanks

" abbr javascript JavaScript
abbr ecma ECMA

abbr docHTMLs  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
abbr docHTMLt  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
abbr docHTMLf  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
abbr docXHTMLs <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
abbr docXHTMLt <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
abbr docXHTMLf <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
abbr metaUTF   <meta http-equiv="content-type" content="text/html;charset=utf-8" />
abbr xmlUTF    <?xml version="1.0" encoding="utf-8"?>
abbr docHTML   <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

set tagstack
map ] <C-]>
map [ <C-T>

map <C-A> :w<CR>:n<CR>
map <C-N> :next<CR>
map <C-P> :prev<CR>
" map Q :wqa<CR>
" bounce to last file

" map <C-Z> !1Gwac.header -t %<CR>
" map <C-U> !Guniq<CR><C-G>

map q :e#<CR>

" map <C-Z> !1Gwac.header -t %<CR>
" map <C-U> !Guniq<CR><C-G>
" map <F5> guwe
" map <F6> gUwe
" map <F7> b/\<\C[A-Z][A-Z0-9_]*\><CR>guwe
" map <F8> b/\<\C[a-z][a-z0-9_]*\><CR>gUwe

" map <F9> I  <ESC>J
" " wrap current line in braces
" " map { I{ <ESC>A }<ESC><CR>
" map { i{<ESC>ea}<ESC>
" " unwrap braces from current line
" " map } :s/^\([<space><tab>]*\){[<space><tab>]*\(.*\)[<space><tab>]*}[<space><tab>]*$/\1\2/<CR><CR>

" paste-mode management
map <F10> :set paste<CR>
map <F11> :set nopaste<CR>
imap <F10> <C-O>:set paste<CR>
imap <F11> <nop>
set pastetoggle=<F11>

" multi-pane hopping commands
nmap <M-Left> <C-W>h
nmap <M-Down> <C-W>j
nmap <M-Up> <C-W>k
nmap <M-Right> <C-W>l
imap <M-Left> <C-W>h
imap <M-Down> <C-W>j
imap <M-Up> <C-W>k
imap <M-Right> <C-W>l

" push diffs around
map <F1> :diffget<CR>
map <F2> :diffput<CR>

" next and previous diff
noremap <F3> [c
noremap <F4> ]c

" fold bending commands
map { zc
map } zo

" map <F5> :wa!<CR>:!wac-make<CR>
map <F5> <G
map <F6> >G
map <F7> I  <ESC>J
" map <F8> 1G!Greform.pl<CR>


function CleanEpub()
    set wrap linebreak scrolloff=10

    %s/ \+$//
    %s/[“”]/"/g
    %s/’/'/g
    %s/…/.../g
    g/2012/-2 s/^/!!!/ | +2 | d+3
    g/^!!!/ s/\v<(\w)(\w+)/\u\1\L\2/g
    g/^$/d
    2,$g/^!!!/s/^//
endfunction


let g:wrapA = ""
function WrapSelection() range
    let g:wrapA = input("Enter wrapper: ", g:wrapA)
    let wrapA = g:wrapA

    if wrapA =~? "^[a-z_][a-z0-9_]*$"
      let wrapZ = "</" . wrapA . ">"
      let wrapA = "<"  . wrapA . ">"
    elseif wrapA == "(" | let wrapZ = ")"
    elseif wrapA == "[" | let wrapZ = "]"
    elseif wrapA == "{" | let wrapZ = "}"
    elseif wrapA == "<" | let wrapZ = ">"
    else                | let wrapZ = wrapA
    endif

    " echo <thing>"WRAP: "</thing> . wrapA . " " . visualmode() . " " . wrapZ
    execute "normal `>i" . wrapZ . "\<Esc>`<i" . wrapA . "\<Esc>``"
endfunction


" jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

function TabOn()
    set expandtab smarttab
endfunction

function TabOff()
   set noexpandtab nosmarttab
endfunction

hi Todo term=none ctermfg=none ctermbg=none

