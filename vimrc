" =============================================
"	 _   ________  ______  _____
"	| | / /  _/  |/  / _ \/ ___/
"	| |/ // // /|_/ / , _/ /__  
"	|___/___/_/  /_/_/|_|\___/  wangye
" =============================================
" =============================================
"               基础设置
" =============================================

" 打开语法高亮。自动识别代码，使用多种颜色显示
syntax on
"syntax enable

" 显示命令" 使用vim键盘模式
set nocompatible

" 使用 utf-8 编码
set encoding=utf-8

" 启用256色
set t_Co=256

" 配色不对 兼容某些终端用vim可能会出现问题
let &t_ut=''

" 使用鼠标
"set mouse=a

" 恢复上次编辑位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" =============================================
"               缩进设置
" =============================================

" 按下回车键后，下一行的缩进会自动跟上一行的缩进保持一致
set autoindent
set cindent

" 按下 Tab 键时，Vim 显示的空格数
set tabstop=4

" 在文本上按下>>（增加一级缩进）、<<（取消一级缩进）或者==（取消全部缩进）时，每一级的字符数
set shiftwidth=4

" 由于 Tab 键在不同的编辑器缩进不一致，该设置自动将 Tab 转为空格
set expandtab

" Tab 转为多少个空格
set softtabstop=4

" 不要用空格代替制表符
set noexpandtab


" =============================================
"               外观设置
" =============================================

" 显示行号
set number

" 显示光标所在的当前行的行号，其他行都为相对于该行的相对行号
set relativenumber

" 光标所在的当前行高亮
set cursorline

" 不超出屏幕
set wrap

" 只有遇到指定的符号（比如空格、连词号和其他标点符号），才发生折行。也就是说，不会在单词内部折行
set linebreak

" 指定折行处与编辑窗口的右边缘之间空出的字符数
" set wrapmargin=2

" 设置行宽，即一行显示多少个字符
" set textwidth=80

" 显示命令
set showcmd

" 在底部显示，当前处于命令模式还是插入模式
set showmode

" 上下预留
set scrolloff=5

" 是否显示状态栏。0 表示不显示，1 表示只在多窗口时显示，2 表示显示
set laststatus=2
set statusline=%F%m%r%h%w\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=\ %F%m%r%h%w\ \ \ \ ASCII=\%03.3b\ \ \ \ HEX=\%02.2B\ \ \ \ POS=%04l,%04v\ \ \ \ %p%%\ \ \ \ NumOfLine=%L

" 命令行（在状态行下）的高度，默认为1
set cmdheight=1

" 在状态栏显示光标的当前位置（位于哪一行哪一列）
" set ruler

" 显示不可见字符
" set list

" 设置在状态行显示的信息
set foldcolumn=0
set foldmethod=indent 
set foldlevel=0
set foldenable 

" 光标设置
"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"


" =============================================
"               搜索设置
" =============================================

" 命令提示
set wildmenu

" 光标遇到圆括号、方括号、大括号时，自动高亮对应的另一个圆括号、方括号和大括号
set showmatch

" 搜索时，高亮显示匹配结果
set hlsearch

" 文件打开防止高亮
exec "nohlsearch"

" 输入搜索模式时，每输入一个字符，就自动跳到第一个匹配的结果
set incsearch

" 搜索忽略大小写
set ignorecase

" 如果同时打开了ignorecase，那么对于只有一个大写字母的搜索词，将大小写敏感；其他情况都是大小写不敏感
" 比如，搜索Test时，将不匹配test；搜索test时，将匹配Test
set smartcase


" =============================================
"               编辑设置
" =============================================
set encoding=utf-8

" 命令模式下，底部操作指令按下 Tab 键自动补全。第一次按下 Tab，会显示所有匹配的操作指令的清单；第二次按下 Tab，会依次选择各个指令
set wildmenu
set wildmode=longest:list,full

" 打开英语单词的拼写检查
"set spell spelllang=en_us

" 不创建备份文件。默认情况下，文件保存时，会额外创建一个备份文件
" 它的文件名是在原文件名的末尾，再添加一个波浪号（〜）
set nobackup

" 不创建交换文件。交换文件主要用于系统崩溃时恢复文件，文件名的开头是.、结尾是.swp
set noswapfile

" 保留撤销历史
"
" Vim 会在编辑时保存操作历史，用来供用户撤消更改
" 默认情况下，操作记录只在本次编辑时有效，一旦编辑结束、文件关闭，操作历史就消失了
"
" 打开这个设置，可以在文件关闭后，操作记录保留在一个文件里面，继续存在
" 这意味着，重新打开一个文件，可以撤销上一次编辑时的操作。撤消文件是跟原文件保存在一起的隐藏文件，文件名以.un~开头
set undofile

" 设置备份文件、交换文件、操作历史文件的保存位置
" 结尾的//表示生成的文件名带有绝对路径，路径中用%替换目录分隔符，这样可以防止文件重名
"set backupdir=~/.vim/.backup//
"set directory=~/.vim/.swp//
"set undodir=~/.vim/.undo//
set undodir=$VIM\.undo

" 自动切换工作目录。这主要用在一个 Vim 会话之中打开多个文件的情况，默认的工作目录是打开的第一个文件的目录。
" 该配置可以将工作目录自动切换到，正在编辑的文件的目录
"set autochdi

" 出错时，不要发出响声
set noerrorbells

" 出错时，发出视觉提示，通常是屏幕闪烁
set visualbell

" Vim 需要记住多少次历史操作
set history=1000

" 打开文件监视。如果在编辑过程中文件发生外部改变（比如被别的编辑器编辑了），就会发出提示
set autoread

" 如果行尾有多余的空格（包括 Tab 键），该配置将让这些空格显示成可见的小方块
" set listchars=tab:»■,trail:■

" 自动补全
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>i<tab><CR><Esc>kA
inoremap ' ''<Esc>i
"inoremap " ""<Esc>i


" =============================================
"               键位设置
" =============================================

" leader键为空格
let mapleader=" "

" 搜索后取消高亮
noremap <LEADER><CR> :nohlsearch<CR>

" 搜索移动后居中
noremap N Nzz
noremap n nzz

" 方向键
"noremap h i
"noremap j h
"noremap i k
"noremap k j

" 大幅度移动
noremap H 5h
noremap J 7j
noremap K 5k
noremap L 7l

" 行首B 行尾E
noremap B ^
noremap E $

" 插入模式
"noremap H I

" 退出插入模式
inoremap <C-h> <Esc>
inoremap jj <Esc>
" 历史记录前进U 后退u
noremap U <C-r>

" 插入空行不进入插入模式
nnoremap co o<Esc>
nnoremap cO O<Esc>

" 搜索当前单词
"map Y *

" 查看寄存器
noremap "" :reg<CR>

noremap M :delmarks 
" 保存
map S :w!<CR>
map W :w!<CR>

" 退出
map Q :q!<CR>

" 读取配置
map R :source $MYVIMRC<CR>

" 失效
map s <nop>
map t <nop>

" 替换模式
"noremap r R

" 折叠展开
"noremap [ zo
"noremap ] zc

"切换缓冲区
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
nnoremap [B :bfirst<CR>
nnoremap ]B :blast<CR>

" 标签
map tn :tabe<CR>
map te :tabe<CR>:e 
map [t :-tabnext<CR>
map ]t :+tabnext<CR>

" 分屏
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>

" 分屏切换样式
map sn <C-w>t<C-w>H
map sh <C-w>t<C-w>K

" 分屏切换编辑
map <LEADER>l <C-w>l
"map <LEADER>k <C-w>k
map <LEADER>h <C-w>h
"map <LEADER>j <C-w>j

" 屏幕尺寸
"map <up> :res +5<CR>
"map <down> :res -5<CR>
map <left> :vertical resize -5<CR>
map <right> :vertical resize +5<CR>


" =============================================
"               插件设置
" =============================================

"call plug#begin('~/.vim/plugged')

" 状态栏
"Plug 'vim-airline/vim-airline'

" 文件树
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" 缩进线
"Plug 'Yggdroot/indentLine'

" 简约风
"Plug 'junegunn/goyo.vim'


" 代码补全
"Plug 'Valloric/YouCompleteMe'

"call plug#end()


" =============================================
"               插件配置
" =============================================

" NERDTree
"map ff :NERDTreeToggle<CR>
"let NERDTreeShowLineNumber=1
"let NERDTreeShowHidden=1
"let NERDTreeMapOpenExpl = ""
"let NERDTreeMapUpdir = "J"
"let NERDTreeMapUpdirKeepOpen = "j"
"let NERDTreeMapOpenSplit = "s"
"let NERDTreeOpenVSplit = ""
"let NERDTreeMapActivateNode = "o"
"let NERDTreeMapOpenInTab = "t"
"let NERDTreeMapPreview = "T"
"let NERDTreeMapCloseDir = "q"
"let NERDTreeMapChangeRoot = "l"

" You Complete ME
"nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap g/ :YcmCompleter GetDoc<CR>
"nnoremap gt :YcmCompleter GetType<CR>
"nnoremap gr :YcmCompleter GoToReferences<CR>

" Goyo
"map <LEADER>gy :Goyo<CR>
