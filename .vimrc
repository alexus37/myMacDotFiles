" Determines filetype from name to allow intelligent auto-indenting, etc.
filetype indent plugin on

" Enable syntax highlighting
syntax on

" Better command-line completion
set wildmenu

" Use case insensitive search except when using capital letters
set ignorecase
set smartcase

" When opening a new line and no file-specific indenting is enabled,
" keep same indent as the line you're currently on
set autoindent

" Display line numbers on the left
set number

" Indentation options, change according to personal preference

" Number of visual spaces per TAB
set tabstop=2

" Convert TABs to spaces
set expandtab
" disable the swapfile"
set noswapfile 
" highlight all the results"
set hlsearch 
" show search results as you type"
set incsearch 
" Remove newbie crutches in Command Mode"
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
