
set nocompatible
set encoding=utf-8 fileencoding= nobackup
set noruler noshowmatch noshowmode nowrapscan report=1 modelines=10
set scrolloff=4 nohlsearch wrap linebreak sidescrolloff=5 sidescroll=1
set ignorecase nojoinspaces autoindent
set expandtab smarttab nosmartindent
set shiftwidth=4 tabstop=8 softtabstop=4
set shiftwidth=2 tabstop=8 softtabstop=4
set printfont=courier:h9 popt=paper:a4,left:5mm,right:5mm,top:5mm,bottom:5mm,syntax:n,portrait:n,formfeed:y

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif


set statusline=%#Search#[%n]
set statusline+=\ %{&ff}%y%r
set statusline+=\ %l/%L:%-4(%v%)
set statusline+=\ %<%F%m
set statusline+=%=
set statusline+=\ 0x%04B
set statusline+=\ %*
set laststatus=2


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
    redraws!
    redraw!
endfunction

" let did_load_filetypes = 1
syntax enable
filetype plugin on

set guifont=Courier\ New\ 8
set guifont=APL385\ Unicode\ 9,Courier\ New\ 8,Courier\ 10\ Pitch\ 8
set guifont=Courier\ New\ 8,Courier\ 10\ Pitch\ 8
set ambiwidth=double

hi MatchParen cterm=none ctermbg=darkblue ctermfg=white
" let loaded_matchparen = 1
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

" words I keep messing up for Prawn::Document scripting
abbr stoke_axis stroke_axis
abbr stoke_bounds stroke_bounds
abbr stoke_circle stroke_circle
abbr stoke_color stroke_color


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


function Renders() range
    execute ":" . a:firstline . "," . a:lastline . "g/\\C \\(SELECT\\|SHOW FIELDS\\) /d"
endfunction


map <silent> <F8> :call Renders()<CR>


" jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" hate automatic comment copying
au BufReadPost * set comments= commentstring= iskeyword-=:

" hate syntax coloring in diff mode
" au FilterWritePre * if &diff | syntax off | set nofoldenable | endif
au FilterWritePre * if &diff | syntax off | endif

function TabOn()
    set expandtab smarttab
endfunction

function TabOff()
   set noexpandtab nosmarttab
endfunction

hi Todo term=bold ctermfg=red ctermbg=none

imap <C-X><<    «
imap <C-X>>>        »
imap <C-X>neg       ¯
imap <C-X>-         ¯
imap <C-X>*         ×
imap <C-X>/         ÷
imap <C-X>pi        π
imap <C-X>inf       ∞
imap <C-X>take      ↑
imap <C-X>drop      ↓
imap <C-X>=>        ⇒
imap <C-X>impl      ⇒
imap <C-X>ceil      ⌈
imap <C-X>floor     ⌊
imap <C-X>ne        ≠
imap <C-X>le        ≤
imap <C-X>ge        ≥
imap <C-X>ma        ≡
imap <C-X>nm        ≢
imap <C-X><|    ⟨
imap <C-X>>|      ⟩
imap <C-X>gu        ⍋
imap <C-X>gd        ⍒
imap <C-X>iota      ⍳
imap <C-X>rho       ⍴
imap <C-X>circle    ○
imap <C-X>quad      ⎕
imap <C-X>[]        ⎕
imap <C-X>[[        ⟦
imap <C-X>]]        ⟧
imap <C-X>{{        ⦃
imap <C-X>}}        ⦄
imap <C-X>assign    ←
imap <C-X><-        ←
imap <C-X>arrow     →
imap <C-X>->        →
imap <C-X>join      ⋈|           " 22C8 natural join
imap <C-X>l-join    ⋉|           " 22C9 left semijoin
imap <C-X>r-join    ⋊|           " 22CA right semijoin
imap <C-X>a-join    ▷|           " 25B7 anti join
imap <C-X>l-outer   ⟕|           " 27D5 left outer join
imap <C-X>r-outer   ⟖|           " 27D6 right outer join
imap <C-X>f-outer   ⟗|           " 27D7 full outer join
imap <C-X>sigma     σ|           " 03C3 selection
imap <C-X>theta     θ
imap <C-X>ckboxf    ☐
imap <C-X>ckboxt    ☑


" STRICTLY SPEAKING: these are supposed to be circled letters
imap <C-X>A_        Ⓐ|          " U+24B6
imap <C-X>B_        Ⓑ|          " U+24B7
imap <C-X>C_        Ⓒ|          " U+24B8
imap <C-X>D_        Ⓓ|          " U+24B9
imap <C-X>E_        Ⓔ|          " U+24BA
imap <C-X>F_        Ⓕ|          " U+24BB
imap <C-X>G_        Ⓖ|          " U+24BC
imap <C-X>H_        Ⓗ|          " U+24BD
imap <C-X>I_        Ⓘ|          " U+24BE
imap <C-X>J_        Ⓙ|          " U+24BF
imap <C-X>K_        Ⓚ|          " U+24C0
imap <C-X>L_        Ⓛ|          " U+24C1
imap <C-X>M_        Ⓜ|          " U+24C2
imap <C-X>N_        Ⓝ|          " U+24C3
imap <C-X>O_        Ⓞ|          " U+24C4
imap <C-X>P_        Ⓟ|          " U+24C5
imap <C-X>Q_        Ⓠ|          " U+24C6
imap <C-X>R_        Ⓡ|          " U+24C7
imap <C-X>S_        Ⓢ|          " U+24C8
imap <C-X>T_        Ⓣ|          " U+24C9
imap <C-X>U_        Ⓤ|          " U+24CA
imap <C-X>V_        Ⓥ|          " U+24CB
imap <C-X>W_        Ⓦ|          " U+24CC
imap <C-X>X_        Ⓧ|          " U+24CD
imap <C-X>Y_        Ⓨ|          " U+24CE
imap <C-X>Z_        Ⓩ|          " U+24CF

" section           §   U+00A7
" diaeresis         ¨   U+00A8
"                   «   U+00AB
" neg               ¯   U+00AF
"                   »   U+00BB
" mul               ×   U+00D7
" div               ÷   U+00F7
" pi                π   U+03C0
"                   ‖   U+2016
"                   ‼   U+203C
"                   ⁅   U+2045
"                   ⁆   U+2046
" take              ↑   U+2191
" branch            →   U+2192
" drop              ↓   U+2193
"                   ⇒   U+21D2

" for-all           ∀   U+2200
" exists            ∃   U+2203
" not-exists        ∄   U+2204
"                   ∅   U+2205   empty set

" member            ∈   U+2208
" not member        ∉   U+2209
" small member      ∊   U+220A
" contains          ∈   U+220B
" not contains      ∌   U+220C
" small contains    ∍   U+200D

"                   ∏   U+220F
"                   ∐   U+2210
"                   ∑   U+2211
" subtract          −   U+2212
" jot               ∘   U+2218
" root              √   U+221A
" inf               ∞   U+221E
" abs               ∣   U+2223
" and               ∧   U+2227
" or                ∨   U+2228
" intersection      ∩   U+2229
" union             ∪   U+222A
" not               ∼   U+223C
" ne                ≠   U+2260
" match             ≡   U+2261
" mismatch          ≢   U+2262
" le                ≤   U+2264
" ge                ≥   U+2265
" proper subset     ⊂   U+2282
" proper superset   ⊃   U+2283
" subset            ⊆   U+2286
" superset          ⊇   U+2287
" rotate-first      ⊖   U+2296
" encode            ⊤   U+22A4
" decode            ⊥   U+22A5
" exponential       ⋆   U+22C6
" ceiling           ⌈   U+2308
" floor             ⌊   U+230A
"                   〈  U+2329  double-width
"                   〉  U+232A  double-width
" matrix-divide     ⌹   U+2339
" rotate-last       ⌽   U+233D
" reduce-first      ⌿   U+233F
" expand-first      ⍀   U+2340
" transpose         ⍉   U+2349
" grade-up          ⍋   U+234B
" execute           ⍎   U+234E
" grade-down        ⍒   U+2352
" format            ⍕   U+2355
" log               ⍟   U+235F
" nor               ⍱   U+2371
" nand              ⍲   U+2372
" iota              ⍳   U+2373
" rho               ⍴   U+2374
" circle            ○   U+25CB


"                   ⟦   U+27E6
"                   ⟧   U+27E7
"                   ⟨   U+27E8
"                   ⟩   U+27E9
"                   ⟪   U+27EA
"                   ⟫   U+27EB
"                   ⟬   U+27EC
"                   ⟭   U+27ED
"                   ⟮   U+27EE
"                   ⟯   U+27EF

"                   ⦃   U+2983
"                   ⦄   U+2984
"                   ⭅   U+2B45
"                   ⭆   U+2B46
"                   〈  U+3008  double-width
"                   〉  U+3009  double-width
"                   《  U+300A  double-width
"                   》  U+300B  double-width


" from U+3371 is a bunch of physical unit symbols

