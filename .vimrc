set nocompatible "required for Vundle
filetype off "required for Vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Someday I will categorize these plugins ;]
Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'rust-lang/rust.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mhinz/vim-startify'
Plugin 'tpope/vim-fugitive'
"Plugin 'L9'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/syntastic'
Plugin 'shougo/vimshell.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'dracula/vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'rhysd/vim-clang-format'
Plugin 'dylanaraps/wal.vim'

call vundle#end() 
filetype plugin indent on


set autoread

"font for gvim
set guifont=Source\ Code\ Pro\ for\ Powerline\ 9
set guifont=FiraCode\ 9

"colorscheme
set t_Co=256
syntax on
"colorscheme dracula 
colorscheme wal
"display line numbers
set number	

"line breaking
set wrap
set linebreak	
set showbreak=+++ 	
"set textwidth=100	

"matching brackets
set showmatch	

set visualbell	
 
"higlight when searching
set hlsearch	

"self-explanatory
set ignorecase
set smartcase	
set incsearch	
set autoindent	
set expandtab	
set shiftwidth=3	
set tabstop=3	
set smartindent	
set smarttab	
set noshowmode

set magic
 
set ruler	

set undolevels=1000	
set backspace=indent,eol,start	
set whichwrap+=<,>,h,l
set laststatus=2

set ai

set nobackup
set nowb
set noswapfile

set autochdir
set viminfo^=%
"filetype on

"can have unwritten changes to a file and open another buffer ; ]
set hidden

:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
":set guioptions-=M

noremap <C-n> :NERDTreeToggle<CR>
noremap <silent> <F5> :noh<cr>

nnoremap <silent> <F2> :bprevious <CR>
nnoremap <silent> <F3> :bnext <CR>

"inoremap <c-d> <esc>0d$i
"nnoremap <c-d> 0d$
"inoremap <c-u> <esc>bveU<esc>i

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

let g:airline_mode_map = {
   \ '__' : '-',
   \ 'n'  : 'N',
   \ 'i'  : 'I',
   \ 'R'  : 'R',
   \ 'c'  : 'C',
   \ 'v'  : 'V',
   \ 'V'  : 'V',
   \ '' : 'V',
   \ 's'  : 'S',
   \ 'S'  : 'S',
   \ '' : 'S',
   \ }


let g:syntastic_python_checkers=['']


"hi Normal guibg=NONE ctermbg=NONE

"youcompleteme preview window disable
set completeopt-=preview
