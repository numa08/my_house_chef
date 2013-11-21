set sm
set ai
syntax on
set number
:let java_highlight_all=1
"colors molokai

set expandtab
set tabstop=2
set shiftwidth=2


"Setting for Neobundle
set nocompatible

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'vim-scripts/nginx.vim'
NeoBundle 'kannokanno/previm'
NeoBundle 'tpope/vim-surround'
filetype plugin indent on

NeoBundleCheck

let g:previm_open_cmd = 'open'
