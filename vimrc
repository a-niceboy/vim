" 使用vim键盘模式
set nocompatible

" 文件检测
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" 行数
set number
set norelativenumber

" 行线
set cursorline

" 不超出屏幕
set wrap

" 显示命令
set showcmd

" 命令提示
set wildmenu

" 上下预留
set scrolloff=5

" 下面状态栏
set laststatus=2

" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=1

" 设置在状态行显示的信息
set foldcolumn=0
set foldmethod=indent 
set foldlevel=3
set foldenable 

" 使用鼠标
"set mouse=a

" 编码
set encoding=utf-8

" 配色不对
let &t_ut=''

" 恢复上次编辑位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" 自动缩进
set autoindent
set cindent
" tab
set expandtab
" 统一缩进为4
set tabstop=4
set softtabstop=4
set shiftwidth=4

" 不要用空格代替制表符
set noexpandtab

" 高亮关键词
syntax on

" 搜索高亮
set hlsearch
" 文件打开防止高亮
exec "nohlsearch"
" 边搜边高亮
set incsearch
" 搜索忽略大小写
set ignorecase
" 精准大小写
set smartcase


" 搜索后移动
noremap - Nzz
noremap = nzz

" leader键为空格
let mapleader=" "

" 取消搜索
noremap <LEADER><CR> :nohlsearch<CR>

" 方向键
noremap h i
noremap H I
noremap j h
noremap i k
noremap k j

noremap B ^
noremap E $

noremap I 10k
noremap K 10j
noremap J 7h
noremap L 7l

" 自定义插入空行
nnoremap co o<Esc>
nnoremap cO O<Esc>

map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>

" 分屏
map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:vsplit<CR>
map si :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>
" 分屏切换样式
map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K
" 分屏切换编辑
map <LEADER>l <C-w>l
map <LEADER>i <C-w>k
map <LEADER>j <C-w>h
map <LEADER>k <C-w>j

" 屏幕尺寸
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize -5<CR>
map <right> :vertical resize +5<CR>

" 标签
map ti :tabe<CR>
map tj :-tabnext<CR>
map tl :+tabnext<CR>

" 自动补全
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>i<tab><CR><Esc>kA
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

