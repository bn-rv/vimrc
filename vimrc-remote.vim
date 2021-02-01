" настройки поиска
set ic
set hls is
" настройки табуляции и отступов
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
" синтаксис
syntax on
" номера строк
set number
" история команд
set history=200
" перемещение по истории командной строки
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

call plug#begin('~/.vim/plugged')
" Управление файлами
Plug 'scrooloose/nerdtree'
" Тема
Plug 'junegunn/seoul256.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Настройки NerdTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

" Тема
let g:seoul256_background = 234
colo seoul256

" настройки Vim-Airline
set laststatus=2
let g:airline_theme='badwolf'
