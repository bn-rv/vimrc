" настройки поиска
set ic
set hls is

" настройки вкладок
set showtabline=2
map <F8> :tabnext<CR>
map <F7> :tabprev<CR>
map <F6> :tabnew<CR>
map <F5>  :tabclose<CR>

" настройка буфферов
map <F12> :bnext<CR>
map <F11> :bprev<CR>
" Require MiniBufExplorer
map <F9>  :MBEbw<CR>

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
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug '907th/vim-auto-save'
Plug 'chun-yang/auto-pairs'
Plug 'fholgado/minibufexpl.vim'
Plug 'mattn/emmet-vim'
call plug#end()

" Настройки NerdTree
nnoremap <leader>n :NERDTree<CR>
nnoremap <C-n> :NERDTreeFocus<CR>
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
" настройка vim-auto-save
let g:auto_save = 1 " настройки pymode
let g:pymode = 1
let g:pymode_warnings = 1
let g:pymode_paths = []
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
let g:pymode_options_max_line_length = 79
let g:pymode_options_colorcolumn = 1
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 6
let g:pymode_preview_height = &previewheight
let g:pymode_preview_position = 'botright'
" Python version
let g:pymode_python = 'python3'
" Python indentation
let g:pymode_indent = 1
" Python folding
let g:pymode_folding = 0
" Vim motion
let g:pymode_motion = 1
" Show documentation
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
" Support virtualenv
let g:pymode_virtualenv = 1
let g:pymode_virtualenv_path = $V_ENV
" Run code
let g:pymode_run = 1
let g:pymode_run_bind = '<leader>r'
" Breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_breakpoint_cmd = ''
" Code checking
let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_unmodified = 0
let g:pymode_lint_on_fly = 0
let g:pymode_lint_message = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
let g:pymode_lint_ignore = ["E501", "W",]
let g:pymode_lint_select = ["E501", "W0011", "W430"]
let g:pymode_lint_sort = []
let g:pymode_lint_cwindow = 1
let g:pymode_lint_signs = 1
let g:pymode_lint_todo_symbol = 'WW'
let g:pymode_lint_comment_symbol = 'CC'
let g:pymode_lint_visual_symbol = 'RR'
let g:pymode_lint_error_symbol = 'EE'
let g:pymode_lint_info_symbol = 'II'
let g:pymode_lint_pyflakes_symbol = 'FF'
" Set code checkers options
let g:pymode_lint_options_pep8 =
    \ {'max_line_length': g:pymode_options_max_line_length}
let g:pymode_lint_options_pyflakes = { 'builtins': '_' }
let g:pymode_lint_options_mccabe = { 'complexity': 12 }
let g:pymode_lint_options_pep257 = {}
let g:pymode_lint_options_pylint =
    \ {'max-line-length': g:pymode_options_max_line_length}
" Rope support
let g:pymode_rope = 1
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_project_root = ""
let g:pymode_rope_ropefolder='.ropeproject'
" Show documentation for element under cursor
let g:pymode_rope_show_doc_bind = '<C-c>d'
let g:pymode_rope_regenerate_on_write = 1
" Completion
set completeopt=menuone,noinsert
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_completion_bind = '<C-Space>'
let g:pymode_rope_autoimport = 0
let g:pymode_rope_autoimport_modules = ['os', 'shutil', 'datetime']
let g:pymode_rope_autoimport_import_after_complete = 0
" Find definition
let g:pymode_rope_goto_definition_bind = '<C-c>g'
let g:pymode_rope_goto_definition_cmd = 'new'
" Refactoring
let g:pymode_rope_rename_bind = '<C-c>rr'
" Rename a current module/packag
let g:pymode_rope_rename_module_bind = '<C-c>r1r'
" Import
let g:pymode_rope_organize_imports_bind = '<C-c>ro'
let g:pymode_rope_autoimport_bind = '<C-c>ra'
" Convert module to package
let g:pymode_rope_module_to_package_bind = '<C-c>r1p'
" Extract method/variable
let g:pymode_rope_extract_method_bind = '<C-c>rm'
let g:pymode_rope_extract_variable_bind = '<C-c>rl'
" Use function
let g:pymode_rope_use_function_bind = '<C-c>ru'
" Move method/fields
let g:pymode_rope_move_bind = '<C-c>rv'
" Change function signature
let g:pymode_rope_change_signature_bind = '<C-c>rs'
" Syntax
let g:pymode_syntax = 1
let g:pymode_syntax_slow_sync = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_print_as_function = 0
let g:pymode_syntax_highlight_async_await = g:pymode_syntax_all
let g:pymode_syntax_highlight_equal_operator = g:pymode_syntax_all
let g:pymode_syntax_highlight_stars_operator = g:pymode_syntax_all
let g:pymode_syntax_highlight_self = g:pymode_syntax_all
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_syntax_string_formatting = g:pymode_syntax_all
let g:pymode_syntax_string_format = g:pymode_syntax_all
let g:pymode_syntax_string_templates = g:pymode_syntax_all
let g:pymode_syntax_doctests = g:pymode_syntax_all
let g:pymode_syntax_builtin_objs = g:pymode_syntax_all
let g:pymode_syntax_builtin_types = g:pymode_syntax_all
let g:pymode_syntax_highlight_exceptions = g:pymode_syntax_all
let g:pymode_syntax_docstrings = g:pymode_syntax_all
" настройки autoclose

" MiniBufExplorer settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" GRB: use fancy buffer closing that doesn't close the split
cnoremap <expr> bd (getcmdtype() == ':' ? 'Bclose' : 'bd')

