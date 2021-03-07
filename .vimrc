call plug#begin()
    Plug 'arcticicestudio/nord-vim'
    Plug 'itchyny/lightline.vim'
call plug#end()

colorscheme nord
set laststatus=2
let g:lightline = {
    \'colorscheme': 'nord',
    \}

" Insert spaces when pressing tab
set expandtab

" Show a colored column at 80 characters as inidcator
set colorcolumn=80
