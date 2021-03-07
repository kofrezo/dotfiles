call plug#begin()
    Plug 'arcticicestudio/nord-vim'
    Plug 'itchyny/lightline.vim'
call plug#end()

colorscheme nord
set laststatus=2
let g:lightline = {
    \'colorscheme': 'nord',
    \}

" Show a colored column at 80 characters as inidcator
set colorcolumn=80

" New lines inherit the indentation of previous lines
set autoindent

" Convert tabs to spaces
set expandtab

" Enable indentation rules that are file-type specific
filetype on
filetype plugin indent on

" When shifting lines, round the indentation to the nearest multiple of
" “shiftwidth.”
set shiftround

" When shifting, indent using four spaces.
set shiftwidth=4

" Insert “tabstop” number of spaces when the “tab” key is pressed.
set smarttab

" Indent using four spaces.
set tabstop=4

" Enable search highlighting
set hlsearch

" Map <ctrl> + <l> to longer highlight search results
nnoremap <C-l> :nohl<CR><C-l>

" Ignore case when searching
set ignorecase

" Automatically be case sensitive when search query contains uppercase letters
set smartcase

" Highlight the line currently under cursor
set cursorline

" Show line numbers on the left sidebar
set number

" Flash thescreen instead of beeping on errors
set visualbell

" Display a confirmation dialog when closing an unsaved file
set confirm

" Direcoty where *.swp files are saved to
set dir=~/.cache/vim

" Directory where backup files are saved to
set backupdir=~/.cache/vim

" Delete comment characters when joining lines
set formatoptions+=j

" Increase the undo limit
set history=1000

" Enable spell checking
set spell
