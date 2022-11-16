" TODO サーバ用途とローカル用途を分ける
" vim scriptの文字コード
scriptencoding utf-8
" ファイル文字コード自動判断、iconvに依存
set fileencodings=ucs-bom,utf-8,cp932,sjis,euc-jp,iso-2022-jp
" vim互換モードオフ: 方向キー問題対応
set nocompatible

" search
set ignorecase
" 大文字小文字が混在しているときは区別
set smartcase
" インクリメンタルサーチオフ
set noincsearch

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

" for DropBox
autocmd BufNewFile,BufRead *
  \ if expand('%:~') =~ '/Dropbox/' |
  \   set noswapfile |
  \ else |
  \   set swapfile |
  \ endif

" vimdiff
"highlight DiffAdd    ctermfg=10
"highlight DiffDelete    ctermfg=10
"highlight DiffChange ctermfg=10
"highlight DiffText   ctermfg=10
highlight DiffAdd    ctermfg=10 ctermbg=22
highlight DiffDelete ctermfg=10 ctermbg=52
highlight DiffChange ctermfg=10 ctermbg=17
highlight DiffText   ctermfg=10 ctermbg=21


" ------- key -----------
:inoremap <C-@> <C-G>u<C-@>

" ------- neobundle -----------
" TODO 環境変数がセットされていたらロードするようにする
if 0
  " Note: Skip initialization for vim-tiny or vim-small.
  if 0 | endif

  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
  endif

  " Required:
  call neobundle#begin(expand('~/.vim/bundle/'))

  " Let NeoBundle manage NeoBundle
  " Required:
  NeoBundleFetch 'Shougo/neobundle.vim'

  " My Bundles here:
  NeoBundle 'Shougo/vimproc'
  "NeoBundle 'https://github.com/Shougo/clang_complete.git'
  "NeoBundle 'https://github.com/Shougo/echodoc.git'
  "NeoBundle 'https://github.com/Shougo/neocomplcache.git'
  "NeoBundle 'https://github.com/Shougo/neobundle.vim.git'

  NeoBundle 'https://github.com/Shougo/unite.vim.git'
  NeoBundle 'https://github.com/Shougo/neomru.vim.git'
    let g:ctrlp_mruf_max   = 100
    let g:unite_source_file_mru_limit=100
  "NeoBundle 'https://github.com/Shougo/vim-vcs.git'
  "NeoBundle 'https://github.com/Shougo/vimfiler.git'
  "NeoBundle 'https://github.com/Shougo/vimshell.git'
  "NeoBundle 'https://github.com/Shougo/vinarise.git'
  NeoBundle 'Shougo/neomru.vim'

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
  NeoBundle 'https://github.com/OrangeT/vim-csharp.git'
  NeoBundle 'posva/vim-vue'
  " 文字列囲い込み入力補佐
  NeoBundle 'surround.vim'
    let g:surround_{char2nr("「")} = "「\r」"
  " コメントアウト入力補佐
  NeoBundle 'tomtom/tcomment_vim'

  call neobundle#end()

  " Required:
  filetype plugin indent on

  " If there are uninstalled bundles found on startup,
  " this will conveniently prompt you to install them.
  NeoBundleCheck
endif

" ---------------------------
" user command

command! -range Escape :<line1>,<line2>!perl -CIO -pE 'use utf8;s/([\#\%\\\\])/\\$1/g'

command! -range Kata2hira :<line1>,<line2>!perl -CIO -pE 'use utf8;tr/ァ-ン/ぁ-ん/'
command! -range Hira2kata :<line1>,<line2>!perl -CIO -pE 'use utf8;tr/ぁ-ん/ァ-ン/'
command! -range Hankana2zen :<line1>,<line2>!perl -CIO -mEncode -mEncode::JP::H2Z -pE 'use utf8;$_=Encode::encode("euc-jp",$_);Encode::JP::H2Z::h2z(\$_);$_=Encode::decode("euc-jp",$_)'
command! -range Zen2han :<line1>,<line2>!perl -CIO -pE "use utf8;tr/０-９Ａ-Ｚａ-ｚ　！“”＃＄％＆‘’（）＊＋，－．／：；＜＝＞？＠［］＾＿｛｜｝/0-9A-Za-z \!\"\"\#\$\%&\'\'()*+,\\-.\\/:;<=>?@[]^_{\|}/"
command! Randstr8 :r!perl -e 'print ['A'..'Z','0'..'9']->[int(rand(34))] for(1..8)'
"command! Randstr8 :r!perl -e 'print "\#"; print ['A'..'Z','0'..'9']->[int(rand(34))] for(1..8)'
" 開発中
" command! AddTopicTag :Randstr8kJr　

command! -nargs=1 Grep :vim <args> **|cw|/<args>
command! Genmemotags :!grep  -P '[ \t　\#][0-9A-Z]{8}\r*$' *.txt **/*.txt | tr -d $"\r" | perl -CIO -nE 'use utf8;@a=split ":";if($a[1] \!~ /→/ && ($a[1] \!~ /□/ || $a[1] =~ /^□/)){if($a[1]=~/([0-9A-Z]{8})$/){$k=$1;$a[1]=~s/\//\\\//g;print "$k\t$a[0]\t/^$a[1]"}}' | sort > .tags_in; cat .tags_in .tags_out | sort > tags
command! GenmemotagsOut :!grep  -P '[ \t　\#][0-9A-Z]{8}\r*$' `cat .tags_path` | tr -d $"\r" | perl -CIO -nE 'use utf8;@a=split ":";if($a[0] \!~ / / && $a[1] \!~ /→/ && ($a[1] \!~ /□/ || $a[1] =~ /^□/)){if($a[1]=~/([0-9A-Z]{8})$/){$k=$1;$a[1]=~s/\//\\\//g;print "$k\t$a[0]\t/^$a[1]"}}' | sort > .tags_out

" インデントのタブ、スペース切り替え
command! IndentTab set noexpandtab tabstop=4 softtabstop=4 shiftwidth=4
command! IndentSpace set expandtab tabstop=2 softtabstop=2 shiftwidth=2
command! IndentSpace4 set expandtab tabstop=4 softtabstop=4 shiftwidth=4

" ---------------------------
" post vimrc

" シンタックスハイライト
syntax enable
"colorscheme monokai
" デフォルトのインデント設定
set tabstop=4
set shiftwidth=4
set autoindent
" ファイルタイプの検出と各種プラグインオン
filetype plugin indent on
" ファイルタイプ設定とインデント設定
augroup fileTypeSettings
    autocmd!
    autocmd BufNewFile,BufRead *.txt set filetype=mytxt
    autocmd BufNewFile,BufRead *.txt setlocal noexpandtab tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.py setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.rb setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.md setlocal tabstop=4 softtabstop=4 shiftwidth=4 filetype=markdown
augroup END

" 検索語のハイライト
set hlsearch
" hlsearch color、検索語ハイライトの色
hi Search ctermfg=black ctermbg=blue

set history=3000

" カレントディレクトリの自動変更は行わない
set noautochdir

