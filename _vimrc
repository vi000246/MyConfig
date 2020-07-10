"忽略大小寫
:set smartcase
:set ignorecase

"設定配色
syntax on
colorscheme slate

"設定buffer可以被隱藏，而不用存檔
:set hidden

set ai 

"設定插入模式和Normal模式的遊標樣式
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"

"呼叫出git指令，定位到當前檔案為工作目錄
:nnoremap ,git :cd %:p:h<CR>:!git
:nnoremap ,gui :cd %:p:h<CR>:!gitk<CR> 

"設定自動讀檔
set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
"當reload時出現提示訊息
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
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
:vnoremap <Tab> <Esc>gV
:onoremap <Tab> <Esc>
:inoremap <Tab> <Esc>`^

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

"將redo 改成ctrl+Y
:nnoremap <C-y> <C-r>

 "出現buffer list，方便快速切換
:nnoremap <F5> :buffers<CR>:buffer<Space>

"全選文字
:nnoremap <C-a> <esc>ggVG<CR>

"switch tab
:noremap ,1 1gt
:noremap ,2 2gt
:noremap ,3 3gt
:noremap ,4 4gt
:noremap ,5 5gt
:noremap ,6 6gt
:noremap ,7 7gt
:noremap ,8 8gt
:noremap ,9 9gt
:noremap ,0 :tablast<cr>

"移至下一個tab 需要把所有ctrl+方向左右鍵的綁定全刪掉，才會套用這設定
:noremap <C-Left> :tabprevious<CR>
:noremap <C-Right> :tabnext<CR>

" auto format json files on save
autocmd FileType json autocmd BufWritePre <buffer> %!python -m json.tool

"開啟gvim時讓視窗最大化
if has('win32')    
	au GUIEnter * simalt ~x
else    
	au GUIEnter * call MaximizeWindow()
endif 
 
function! MaximizeWindow()    
	silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction
