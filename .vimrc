" Vim Editor Setup
"
" author : daniel.kroeger@kofrezo.io
" version: 12.03.2016

" Enable pathogen plugin autoloader
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Enable filetype plugins
<<<<<<< HEAD
"filetype plugin indent on
=======
" filetype plugin indent on
>>>>>>> dfab76ff2146e3239aaa667d4536ea799c83bc32

" Setup basic appereance
syntax enable
set expandtab
set enc=utf-8
set tabstop=4
set shiftwidth=4
set colorcolumn=80
colorscheme darcula

" Setup vim-jedi autocompletion
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0

" Setup vim-lightline statusbar
set laststatus=2
let g:lightline = { 'colorscheme': 'powerline', }

" Setup vim-nerdtree sidebar
autocmd vimenter * NERDTree

