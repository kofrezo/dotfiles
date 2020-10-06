if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
    Plug 'doums/darcula'
    Plug 'itchyny/lightline.vim'
call plug#end()

syntax on
set expandtab
set number
set enc=utf-8
set tabstop=4
set shiftwidth=4
set colorcolumn=80

colorscheme darcula
set termguicolors
set laststatus=2
