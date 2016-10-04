"Dein.vimの設定
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

""TOMLの設定
if dein#load_state(s:dein_dir)
  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  call dein#begin(s:dein_dir, [s:toml])

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" vimprocだけは最初にインストールしてほしい
if dein#check_install(['vimproc'])
  call dein#install(['vimproc'])
endif

" もし、未インストールものものがあったらインストール
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

"Unite
let g:unite_enable_start_insert=1
let mapleader = "\<Space>"
nnoremap <Leader>unite :Unite<CR>
nnoremap <Leader>f :Unite file<CR>
nnoremap <Leader>,f :Unite file_rec/async<CR>
nnoremap <Leader>t :Unite tab<CR>
nnoremap <Leader>m :Unite file_mru<CR>
