" =============================================
"	 _   ________  ______  _____
"	| | / /  _/  |/  / _ \/ ___/
"	| |/ // // /|_/ / , _/ /__  
"	|___/___/_/  /_/_/|_|\___/  wangye
" =============================================

" =============================================
"               基础设置
" =============================================
" 去掉开界面时显示内容
autocmd GUIEnter * set shortmess=atI

" 启动vim 全屏
"autocmd GUIEnter * simalt ~x
if has('gui_running') && has('libcall')
	autocmd GUIEnter * call libcallnr("gvimfullscreen", "ToggleFullScreen", 0)
endif

" 使用vim键盘模式 不与vi兼容 大部分插件需求
set nocompatible

" 使用 utf-8 编码
set encoding=utf-8

" 兼容某些终端用vim可能会出现问题 
let &t_ut=''

" 使用鼠标
"set mouse=a

" 恢复上次编辑位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" 命令模式下，底部操作指令按下 Tab 键自动补全。第一次按下 Tab，会显示所有匹配的操作指令的清单；第二次按下 Tab，会依次选择各个指令
set wildmenu
set wildmode=longest:list,full

" 文件打开防止高亮
exec "nohlsearch"

" 自动切换工作目录。这主要用在一个 Vim 会话之中打开多个文件的情况，默认的工作目录是打开的第一个文件的目录。
" 该配置可以将工作目录自动切换到，正在编辑的文件的目录
"set autochdir

" 关闭折叠
set nofoldenable

" 预览 输入搜索模式时，每输入一个字符，就自动跳到第一个匹配的结果
set incsearch

" 搜索忽略大小写
set ignorecase

" 如果同时打开了ignorecase，那么对于只有一个大写字母的搜索词，将大小写敏感；其他情况都是大小写不敏感
" 比如，搜索Test时，将不匹配test；搜索test时，将匹配Test
set smartcase

" 打开英语单词的拼写检查
"set spell spelllang=en_us

" 不创建备份文件。默认情况下，文件保存时，会额外创建一个备份文件
" 它的文件名是在原文件名的末尾，再添加一个波浪号
set nobackup

" 不创建交换文件。交换文件主要用于系统崩溃时恢复文件，文件名的开头是.、结尾是.swp
set noswapfile

" 保留撤销历史()
" Vim 会在编辑时保存操作历史，用来供用户撤消更改
" 默认情况下，操作记录只在本次编辑时有效，一旦编辑结束、文件关闭，操作历史就消失了
" 打开这个设置，可以在文件关闭后，操作记录保留在一个文件里面，继续存在
" 这意味着，重新打开一个文件，可以撤销上一次编辑时的操作。撤消文件是跟原文件保存在一起的隐藏文件，文件名以.un~开头
set undofile

" 设置备份文件、交换文件、操作历史文件的保存位置
" 结尾的//表示生成的文件名带有绝对路径，路径中用%替换目录分隔符，这样可以防止文件重名
"set backupdir=~/.vim/.backup//
"set directory=~/.vim/.swp//
"set undodir=~/.vim/.undo//
set undodir=$VIM\.undo

" 出错时，不要发出响声
set noerrorbells

" 出错时，发出视觉提示，通常是屏幕闪烁
set visualbell

" Vim 需要记住多少次历史操作
set history=1000

" 打开文件监视。如果在编辑过程中文件发生外部改变（比如被别的编辑器编辑了），就会发出提示
set autoread

" set backspace? 为空 退格键只能删除本次插入模式输入的内容
" 0 都不能删除 1 indent,eol 删除缩进 行首合并两行 2 indent,eol,start 插入前内容
set backspace=indent,eol,start

" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l

" 自动补全配置菜单行为和IDE一致 preview
set completeopt=longest,menu

" 检测文件类型
filetype on

" 载入文件类型插件
filetype indent on

" 设置跳转文件
" :autocmd BufWitePost * call system("ctags -R")
"set tags=tags;

" =============================================
"               缩进设置
" =============================================

" 缩进基础值 在文本上按下>>（增加一级缩进）、<<（取消一级缩进）或者==（取消全部缩进）时，每一级的字符数
set shiftwidth=4

" 按下 Tab 键时，Vim 显示的空格数
set tabstop=4

" Tab 转为多少个空格
set softtabstop=4

" 按下回车键后，下一行的缩进会自动跟上一行的缩进保持一致
"set autoindent		添加与上一行一致的缩进 取消set no ...
"set smartindent	在autoindent的基础上根据{、} 来调整本行缩进
"set cindent		根据类似c java 的代码动态调节缩进 见到if 之类的可以自动缩进
"set indentexpr		未找到解释
set smartindent

" 由于 Tab 键在不同的编辑器缩进不一致，该设置自动将 Tab 转为空格
set expandtab

" 不要用空格代替制表符
set noexpandtab

" =============================================
"               表现设置
" =============================================
" 打开语法高亮。自动识别代码，使用多种颜色显示
syntax on
"syntax enable

" 启用256色
set t_Co=256

" 颜色主题
colorscheme molokai

" 显示行号
set number

" 显示光标所在的当前行的行号，其他行都为相对于该行的相对行号
set relativenumber

" 光标所在的当前行高亮
set cursorline

" 搜索时，高亮显示匹配结果
set hlsearch

" 不超出屏幕
set wrap

" 只有遇到指定的符号（比如空格、连词号和其他标点符号），才发生折行。也就是说，不会在单词内部折行
set linebreak

" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,-

" 指定折行处与编辑窗口的右边缘之间空出的字符数
" set wrapmargin=2

" 设置行宽，即一行显示多少个字符
" set textwidth=80

" 显示命令
set showcmd

" 在底部显示，当前处于命令模式还是插入模式
set showmode

" 光标遇到圆括号、方括号、大括号时，自动高亮对应的另一个圆括号、方括号和大括号
set showmatch

" 匹配括号高亮时间 单位十分之一秒
set matchtime=1

" 上下滚动时预留行数
set scrolloff=3

" 是否显示状态栏。0 表示不显示，1 表示只在多窗口时显示，2 表示显示
set laststatus=2

" 设置状态行显示常用信息 
" %< 如果状态行过长，在何处换行
" %F 完整文件路径名 
" %.50F 文件路径名长度不超过0，超过进行缩写
" %m 如果当前缓冲被修改标记 [+]
" %r 如果当前缓冲为只读标记 [RO]
" %h 如果为帮助缓冲区显示为 [Help]
" %w 如果为预览缓冲区显示为 [Preview]
" %{&ff} 显示文件系统类型
" %Y 文件类型 
" %{&fenc} 显示文件编码
" %l 光标所在行数 
" %L 总行数 
" %v 光标所在列数 
" %b ASCII值 
" %B 十六进制值 
" %p 当前行数占总行数的的百分比 
" cterm:设置粗体，斜体，正体；ctermfg:前景色；ctermbg:背景色
" %{...} 评估表达式的值，并用值代替 
" %number *\ ... \%*和hi User<number>对应，hi User<number>后面设置的颜色样式会应用到%number *\ ... \%*中的...部分
set statusline=%1*\%<%.50F\									"显示文件名和文件路径 (%<应该可以去掉)
set statusline+=%=%2*\%y%m%r%h%w\ %*						"显示文件类型及文件状态
set statusline+=%3*\%{&ff}\[%{&fenc}]\ %*					"显示文件编码类型
set statusline+=%4*\[%p%%]\%*								"显示光标前文本所占总文本的比例
set statusline+=%5*\ row:%l/%L,col:%c\ %*					"显示光标所在行和列
set statusline+=%6*\%{strftime(\"%y/%m/%d\ -\ %H:%M\")}%*	"显示时间

hi User1 cterm=none ctermfg=25 ctermbg=0 
hi User2 cterm=none ctermfg=208 ctermbg=0
hi User3 cterm=none ctermfg=169 ctermbg=0
hi User4 cterm=none ctermfg=100 ctermbg=0
hi User5 cterm=none ctermfg=green ctermbg=0
hi User6 cterm=none ctermfg=green ctermbg=0

" 选中的tab颜色 
hi SelectTabLine term=Bold cterm=Bold ctermfg=DarkYellow ctermbg=LightGray 
hi SelectPageNum cterm=None ctermfg=DarkRed ctermbg=LightGray 
hi SelectWindowsNum cterm=None ctermfg=DarkCyan ctermbg=LightGray 
" 未选中状态的tab 
hi NormalTabLine cterm=None ctermfg=Gray ctermbg=DarkGray 
hi NormalPageNum cterm=None ctermfg=Gray ctermbg=DarkGray 
hi NormalWindowsNum cterm=None ctermfg=Gray ctermbg=DarkGray 
" tab栏背景色 
hi TabLineFill term=reverse ctermfg=5 ctermbg=7 guibg=#6c6c6c

" 命令行（在状态行下）的高度，默认为1
set cmdheight=1

" 在状态栏显示光标的当前位置（位于哪一行哪一列）
" set ruler

" 折叠相关配置
set foldcolumn=0
set foldmethod=indent 
set foldlevel=0

" 光标设置
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 设置字体和字体大小, 只对gui客户端起作用，终端使用需要修改终端字体和大小
"set guifont=Hack_Nerd_Font_Mono:h16
"
" 不显示缩进 tab ^I 行尾$
set nolist

" 在被分割的窗口间显示空白 默认|
set fillchars=vert:\ ,stl:\ ,stlnc:\ 

" =============================================
"               键位设置
" =============================================
if has('gui_running') && has('libcall')
	let g:MyVimLib = $VIMRUNTIME.'/gvimfullscreen.dll'
	function ToggleFullScreen()
		call libcallnr(g:MyVimLib, "ToggleFullScreen", 0)
	endfunction
    
	"Alt+Enter
	map <A-Enter> <Esc>:call ToggleFullScreen()<CR>

	let g:VimAlpha = 240
	function! SetAlpha(alpha)
		let g:VimAlpha = g:VimAlpha + a:alpha
		if g:VimAlpha < 180
			let g:VimAlpha = 180
		endif
		if g:VimAlpha > 255
			let g:VimAlpha = 255
		endif
		call libcall(g:MyVimLib, 'SetAlpha', g:VimAlpha)
	endfunction
    
	"Shift+Y
	nmap <s-y> <Esc>:call SetAlpha(3)<CR>
	"Shift+T
	nmap <s-t> <Esc>:call SetAlpha(-3)<CR>

"	let g:VimTopMost = 0
"	function! SwitchVimTopMostMode()
"		if g:VimTopMost == 0
"			let g:VimTopMost = 1
"		else
"			let g:VimTopMost = 0
"		endif
"		call libcall(g:MyVimLib, 'EnableTopMost', g:VimTopMost)
"	endfunction
"    
"	"Shift+R
"	nmap <s-r> <Esc>:call SwitchVimTopMostMode()<CR>
endif

" 命令行%% 为当前目录路径
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" leader键为空格
let mapleader=" "

" 搜索后取消高亮
nnoremap <C-l> :nohlsearch<CR><C-l>

" 搜索移动后居中
noremap N Nzz
noremap n nzz

" J改大幅度移动 J功能映射H键
noremap H J

" 大幅度移动
noremap J 5j
noremap K 5k

" 行首B 行尾E
noremap B ^
noremap E $

" 退出插入模式
inoremap jj <Esc>

" 历史记录前进U 后退u
noremap U <C-r>

" 插入空行不进入插入模式
nnoremap co o<Esc>
nnoremap cO O<Esc>

" 查看寄存器
noremap "" :reg<CR>

" M原为光标到屏幕中间 改为删除标记
noremap M :delmarks 

" &命令 重复替换并保留上次所有参数
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" 保存
noremap S :w!<CR>
noremap W :w!<CR>

" 退出
noremap Q :q!<CR>

" 读取配置
noremap <LEADER>r :source $MYVIMRC<CR>

" 失效
noremap s <nop>

"切换缓冲区
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
nnoremap [B :bfirst<CR>
nnoremap ]B :blast<CR>

" 标签 n gt
noremap tn :tabe<CR>
noremap te :tabe<CR>:e 
noremap tm :tabmove 
noremap [t :gT 
noremap ]t :gt 

" 分屏
noremap sh :set nosplitright<CR>:vsplit<CR>
noremap sl :set splitright<CR>:vsplit<CR>
"noremap sk :set nosplitbelow<CR>:split<CR>
"noremap sj :set splitbelow<CR>:split<CR>

" 分屏切换样式 左右 上下
"noremap s[ <C-w>t<C-w>H
"noremap s] <C-w>t<C-w>K

" 分屏切换编辑
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l
"noremap <LEADER>k <C-w>k
"noremap <LEADER>j <C-w>j

" 屏幕尺寸
"noremap <up> :res +5<CR>
"noremap <down> :res -5<CR>
noremap <left> :vertical resize -5<CR>
noremap <right> :vertical resize +5<CR>

" 自动补全
"inoremap ( ()<Esc>i
"inoremap [ []<Esc>i
"inoremap { {<CR>}<Esc>i<tab><CR><Esc>kA
"inoremap ' ''<Esc>i
"inoremap " ""<Esc>i

" 可视模式高亮区域搜索 类似正常模式 *快捷键
"xnoremap * :<C-u>call
"<SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
"xnoremap # :<C-u>call
"<SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
"function! s:VSetSearch()
	"let temp = @s
	"norm! gv"sy
	"let @/ = '\V' . substitute(escape(@s, '/\'), '\n','\\n', 'g')
	"let @s = temp
"endfunction

" =============================================
"               插件设置
" =============================================

" linux os 参数参数路径
"call plug#begin('~/.vim/plugged')
" windows 参数路径
call plug#begin('~/vimfiles/plugged')

" 文件树
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" 搜索文件 需要安装py3
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
" 找到py3动态库赋值
set pythonthreedll=C:Users\admin\AppData\Local\Programs\Python\Python310\python310.dll

" 缩进线
"Plug 'Yggdroot/indentLine'

" 简约风
"Plug 'junegunn/goyo.vim'

call plug#end()

" =============================================
"               插件配置
" =============================================

" NERDTree
map <C-n> :NERDTreeToggle<CR>
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

" Goyo
"map <LEADER>gy :Goyo<CR>
"
" =============================================
"               笔记
" =============================================

" 搜索成对单引号中的内容
" \v'([^']|'\w)+'

" 查看上次搜索匹配数量
"nnoremap <C-r> :%s///gn<CR>

" 映射关键字map
" map 递归
" map a b 
" map b c
" 相当于 map a c
" noremap 非递归
" 前缀:
"n ：仅正常 
"v ：视觉和选择 
"o ：运营商待定 
"x ：仅视觉 
"s ：仅选择 
"i ：插入 
"c ：命令行 
"l ：insert，命令行，regexp-search（以及其他。集体称为“Lang-Arg”伪模式）
