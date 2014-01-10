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

syntax enable
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set laststatus=2

" ------- key -----------
:inoremap <C-@> <C-G>u<C-@>

" ------- neobundle -----------
set nocompatible

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
"NeoBundle 'git://github.com/Shougo/clang_complete.git'
"NeoBundle 'git://github.com/Shougo/echodoc.git'
"NeoBundle 'git://github.com/Shougo/neocomplcache.git'
"NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
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

filetype plugin indent on
NeoBundleCheck
" ---------------------------
" Unite
"call unite#custom_max_candidates('file_mru', 500)
" ---------------------------
" user command

command! -range Kata2hira :<line1>,<line2>!perl -CIO -pE 'use utf8;tr/ァ-ン/ぁ-ん/'
command! -range Hira2kata :<line1>,<line2>!perl -CIO -pE 'use utf8;tr/ぁ-ん/ァ-ン/'
command! -range Hankana2zen :<line1>,<line2>!perl -CIO -mEncode -mEncode::JP::H2Z -pE 'use utf8;$_=Encode::encode("euc-jp",$_);Encode::JP::H2Z::h2z(\$_);$_=Encode::decode("euc-jp",$_)'
command! -range Zen2han :<line1>,<line2>!perl -CIO -pE "use utf8;tr/０-９Ａ-Ｚａ-ｚ　！“”＃＄％＆‘’（）＊＋，－．／：；＜＝＞？＠［］＾＿｛｜｝/0-9A-Za-z \!\"\"\#\$\%&\'\'()*+,\\-.\\/:;<=>?@[]^_{\|}/"


" ---------------------------

set history=3000

