"dein設定
set nocompatible
filetype off

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
  call dein#add('vim-scripts/vim-auto-save') "自動保存
  call dein#add('scrooloose/nerdtree') "ファイルエクスプローラー
  call dein#add('racer-rust/vim-racer') "Rustのコード補完
  call dein#add('rust-lang/rust.vim') "Rustのシンタックスハイライト，自動フォーマット
  call dein#add('tomlion/vim-solidity') "Solidityのシンタックスハイライト

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
set showcmd
syntax enable
filetype plugin indent on

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

let g:auto_save = 1  "enable AutoSave on Vim startup

"nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

"Rust
"racer
set hidden
let g:racer_cmd = $HOME.'/.cargo/bin/racer'
let g:racer_experimental_completer = 1

"rust.vim
"let g:rustfmt_autosave = 1
let g:rustfmt_command = $HOME.'/.cargo/bin/rustfmt'
