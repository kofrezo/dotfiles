" Vim Editor Setup
"
" Copyright (c) 2017, Daniel Kroeger

" Enable pathogen plugin autoloader
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Setup basic appearance
syntax on
set expandtab
set number
set enc=utf-8
set tabstop=4
set shiftwidth=4
set colorcolumn=80
colorscheme darcula

" Setup vim-jedi autocompletion
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = 0

" Setup vim-lightline statusbar
set laststatus=2
let g:lightline = { 'colorscheme': 'powerline', }

" Setup vim-nerdtree sidebar
let g:nerdtree_tabs_open_on_console_startup=1
noremap <F10> :NERDTreeToggle <CR>

" Enable code folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
nnoremap <F8> zM
nnoremap <F9> zR

" Remove trailing white spaces.
autocmd BufWritePre * %s/\s\+$//e

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_php_checkers = ['php']

" Autopep8 formatting
autocmd FileType python map <buffer> <F6> :call Autopep8()<CR>
