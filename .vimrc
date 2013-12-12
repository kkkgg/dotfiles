set fileencodings=ucs-bom,utf-8,cp932,sjis,euc-jp,iso-2022-jp
set hlsearch
set tabstop=4
set shiftwidth=4
set autoindent
syntax enable
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" for vim-airline
set t_Co=256


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
	let g:airline#extensions#tabline#enabled = 1
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

set history=3000

