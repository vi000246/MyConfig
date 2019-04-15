"忽略大小寫
:set smartcase
:set ignorecase

"設定配色
syntax on
colorscheme slate

set ai 

"設定工作目錄為當前文件
:nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

"自動縮進寬度
set sw=4 
set ts=4 
"關閉高亮顯示
set nohlsearch   
set is


set backspace=indent,eol,start
"默認的剪貼寄存器
set clipboard=unnamed
"顯示行號
set number

" 让配置变更立即生效
:autocmd BufWritePost $MYVIMRC source $MYVIMRC

"自动保存
set autowrite 

"退出插入模式
:inoremap jj <esc>
:nnoremap <c-j> <c-w>j
:nnoremap <c-k> <c-w>k
:nnoremap <c-l> <c-w>l
:nnoremap <c-h> <c-w>h

" 讓vim的yank跟ctrl+c獨立  ctrl+c或ctrl+x複製的東西 就用ctrl+v貼上
" 用d c s不會yank 用y或x複製 就用p貼上
:nnoremap d "_d
:nnoremap c "_c
:nnoremap C "_C
:nnoremap S "_S
:nnoremap s "_s
:nnoremap x "xx
:vnoremap x "xx
:nnoremap X "xX
:vnoremap X "xX
:vnoremap d "_d
:nnoremap D "_D
:nnoremap y "xy
:vnoremap y "xy
:nnoremap p "xp
:vnoremap p "xp

:nnoremap . .<Esc>
