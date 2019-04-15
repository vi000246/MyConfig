"忽略大小寫
:set smartcase
:set ignorecase

"設定配色
syntax on
colorscheme slate

set ai 

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
