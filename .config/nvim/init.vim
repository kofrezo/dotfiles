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
