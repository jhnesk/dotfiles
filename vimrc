""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASICS:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

set history=400 " how many lines of history to remember, default 20
set showcmd		" Show (partial) command in status line.
set autowrite		" Automatically save before commands like :next and :make

filetype plugin on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INTERFACE:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set background=dark
syntax on
filetype on
set laststatus=2 " always show statusline
set ruler " show the ruler
set virtualedit+=block " allow virtual block mode to go outside lines
set relativenumber
set number

" jump to last position when reopening a file:
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SEARCHING:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set magic " use expressions in patterns by default
set hlsearch " highlight search terms
set incsearch		" Incremental search
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MOVING:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a		" Enable mouse usage (all modes)
set scrolloff=4 " keep the cursor atleast x rows from the edge when scrolling
set backspace=2 " backspace can join lines

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INDENTING:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set shiftwidth=4
set noexpandtab " tabs are tabs, not spaces
set autoindent
set smartindent
set cindent
set smarttab
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SHORTCUTS:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F5> :make<CR>
map <F12> :ctags -R .<CR>

" fold/unfold all folds...
map F :let &fen = !&fen<CR>

" Open quick fix window on error
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
