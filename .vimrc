:set fileencodings=ucs-bom,utf-8,cp932,sjis,euc-jp,iso-2022-jp
:set hlsearch
:set tabstop=4
:set shiftwidth=4
:set history=1000
:set autoindent
:syntax enable


" ------- neobundle -----------
set nocompatible
filetype off

if has('vim_starting')
  "set runtimepath+='path to neobundle directory'
  set runtimepath+=~/.vim/neobundle.vim.git/
  call neobundle#rc(expand('~/.vim/bundle/'))
  "call neobundle#rc(expand('~/.vim'))
endif

"NeoBundle 'git://github.com/Shougo/clang_complete.git'
"NeoBundle 'git://github.com/Shougo/echodoc.git'
"NeoBundle 'git://github.com/Shougo/neocomplcache.git'
"NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
"NeoBundle 'git://github.com/Shougo/vim-vcs.git'
"NeoBundle 'git://github.com/Shougo/vimfiler.git'
"NeoBundle 'git://github.com/Shougo/vimshell.git'
"NeoBundle 'git://github.com/Shougo/vinarise.git'

filetype plugin on
filetype indent on
" ---------------------------
