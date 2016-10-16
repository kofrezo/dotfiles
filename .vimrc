" Vim Editor Setup
"
" author : daniel.kroeger@kofrezo.io
" version: 14.07.2016

" Enable pathogen plugin autoloader
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Enable filetype plugins
" filetype plugin indent on

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

" Run python flake8 check on every save
autocmd BufWritePost *.py call Flake8()

" Run PHP syntax check on every save
setlocal makeprg=php\ -l\ %
setlocal errorformat=%m\ in\ %f\ on\ line\ %l,%-GErrors\ parsing\ %f,%-G
nnoremap <buffer> <silent> <F6> :update<bar>sil! make<bar>cwindow<cr>
