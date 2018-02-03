"dein設定
if &compatible
  set nocompatible
endif

" Required:
set runtimepath+=$HOME/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.vim/dein')
  call dein#begin('$HOME/.vim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('$HOME/.vim/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('scrooloose/nerdtree')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"基本設定
set encoding=utf-8
set noswapfile
set history=200
set number
set backspace=indent,eol,start
set clipboard=unnamed,autoselect
set scrolloff=5
set autoindent
set smartindent
syntax enable

"Tab設定
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
nnoremap [Tag] <Nop>
nmap t [Tag]
map <silent> [Tag]c :tablast<bar>tabnew<CR>
map <silent> [Tag]x :tabclose<CR>
map <silent> [Tag]n :tabnext<CR>
map <silent> [Tag]p :tabprevious<CR>

"検索関連
set hlsearch

"nerdtreeの設定
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
