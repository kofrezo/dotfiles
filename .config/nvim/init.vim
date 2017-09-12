" NEOVIM Setup
"
" Copyright (C) 2017, Daniel Kröger

" Load pathgen plugin manager
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Basic vim appreance
syntax on
set expandtab
set number
set enc=utf-8
set tabstop=4
set shiftwidth=4
set colorcolumn=80
colorscheme darcula

" NERDTree Setup
set splitright
let g:nerdtree_tabs_open_on_console_startup=1
noremap <F10> :NERDTreeToggle <CR>

" Lightline Setup
set laststatus=2

" Code Folding Shortcuts
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
nnoremap <F8> zM
nnoremap <F9> zR

" Tab Shortcuts
nnoremap <F2> gt

" Python Autocompletion
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = 0
let g:jedi#use_splits_not_buffers = "right"

" Java Autocompletion
autocmd FileType java setlocal omnifunc=javacomplete#Complete
