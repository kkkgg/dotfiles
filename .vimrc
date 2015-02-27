" TODO サーバ用途とローカル用途を分ける
scriptencoding utf-8
set fileencodings=ucs-bom,utf-8,cp932,sjis,euc-jp,iso-2022-jp
set hlsearch
set tabstop=4
set shiftwidth=4
set autoindent

" for vim-airline
set t_Co=256


" display tab
set list
set listchars=tab:>\ ,trail:-,nbsp:%,extends:>,precedes:<

" display full width space
augroup highlightIdegraphicSpace
  autocmd!
  autocmd VimEnter,WinEnter,Colorscheme * highlight IdeographicSpace cterm=underline ctermfg=DarkBlue guifg=DarkBlue
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set laststatus=2

" vimdiff
highlight DiffAdd    ctermfg=10
highlight DiffChange ctermfg=10
highlight DiffText   ctermfg=10

" ------- key -----------
:inoremap <C-@> <C-G>u<C-@>

" ------- neobundle -----------
set nocompatible

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
"NeoBundle 'git://github.com/Shougo/clang_complete.git'
"NeoBundle 'git://github.com/Shougo/echodoc.git'
"NeoBundle 'git://github.com/Shougo/neocomplcache.git'
"NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
	let g:ctrlp_mruf_max   = 100
	let g:unite_source_file_mru_limit=100
"NeoBundle 'git://github.com/Shougo/vim-vcs.git'
"NeoBundle 'git://github.com/Shougo/vimfiler.git'
"NeoBundle 'git://github.com/Shougo/vimshell.git'
"NeoBundle 'git://github.com/Shougo/vinarise.git'
NeoBundle 'bling/vim-airline'
	"let g:airline#extensions#tabline#enabled = 1
	"let g:airline#extensions#tabline#tab_nr_type = 1
	"let g:airline#extensions#tabline#fnamemod = ':t'
	"let g:airline_left_sep = '▶'
	"let g:airline_right_sep = '◀'
	"let g:airline_left_sep = '▷'
	"let g:airline_right_sep = '◁'
	let g:airline_left_sep = '◤'
	let g:airline_right_sep = '◥'
	let g:airline#extensions#whitespace#enabled = 0
	let g:airline#extensions#default#section_truncate_width = {
		\ 'b': 79,
		\ 'x': 88,
		\ 'y': 60,
		\ 'z': 45,
		\ }
	let g:airline_mode_map = {
		\ '__' : '-',
		\ 'n'  : 'N',
		\ 'i'  : 'I',
		\ 'R'  : 'R',
		\ 'c'  : 'C',
		\ 'v'  : 'V',
		\ 'V'  : 'V',
		\ '' : 'V',
		\ 's'  : 'S',
		\ 'S'  : 'S',
		\ '' : 'S',
		\ }
NeoBundle "slim-template/vim-slim"

NeoBundleCheck
call neobundle#end()
" ---------------------------
" user command

command! -range Escape :<line1>,<line2>!perl -CIO -pE 'use utf8;s/([\#\%\\\\])/\\$1/g'

command! -range Kata2hira :<line1>,<line2>!perl -CIO -pE 'use utf8;tr/ァ-ン/ぁ-ん/'
command! -range Hira2kata :<line1>,<line2>!perl -CIO -pE 'use utf8;tr/ぁ-ん/ァ-ン/'
command! -range Hankana2zen :<line1>,<line2>!perl -CIO -mEncode -mEncode::JP::H2Z -pE 'use utf8;$_=Encode::encode("euc-jp",$_);Encode::JP::H2Z::h2z(\$_);$_=Encode::decode("euc-jp",$_)'
command! -range Zen2han :<line1>,<line2>!perl -CIO -pE "use utf8;tr/０-９Ａ-Ｚａ-ｚ　！“”＃＄％＆‘’（）＊＋，－．／：；＜＝＞？＠［］＾＿｛｜｝/0-9A-Za-z \!\"\"\#\$\%&\'\'()*+,\\-.\\/:;<=>?@[]^_{\|}/"
command! Randstr8 :r!perl -e 'print ['A'..'Z','0'..'9']->[int(rand(34))] for(1..8)'
command! -nargs=1 Grep :vim <args> **|cw|/<args>
command! Genmemotags :!grep  -P '[ \t　][0-9A-Z]{8}$'  **/*.txt | perl -CIO -nE 'use utf8;@a=split ":";if($a[1] \!~ /→/ && ($a[1] \!~ /□/ || $a[1] =~ /^□/)){if($a[1]=~/([0-9A-Z]{8})/){$k=$1;$a[1]=~s/\//\\\//g;print "$k\t$a[0]\t/^$a[1]"}}' | sort > tags

" ---------------------------
" post vimrc

syntax enable
filetype plugin indent on
set history=3000

