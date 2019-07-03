"忽略大小寫
:set smartcase
:set ignorecase

"設定配色
syntax on
colorscheme slate

set ai 

"設定插入模式和Normal模式的遊標樣式
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"

"呼叫出git指令，定位到當前檔案為工作目錄
:nnoremap ,git :cd %:p:h<CR>:!git
:nnoremap ,gui :cd %:p:h<CR>:!gitk<CR> 

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

:inoremap <C-Y> <C-r>
"將redo 改成ctrl+Y
:nnoremap <C-Y> <C-r>

" auto format json files on save
autocmd FileType json autocmd BufWritePre <buffer> %!python -m json.tool

