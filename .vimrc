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
