" @url: https://github.com/isyuanyin/vimrc
" @auhthor: Yuanyin Zhang
" @mail: isyuanyin@gmail.com
" @description: An example .vimrc file.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Manually Settings
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"- general -------------------------------------------------
set nocompatible

" keyboard settings
let mapleader = " "

" autocmd BufWritePost $MYVIMRC source $MYVIMRC

"- display -------------------------------------------------

" color scheme
colorscheme desert

set ruler

set number

" indent
set tabstop=4
set shiftwidth=4
set autoindent

autocmd FileType java,javascript,html,css,xml set tabstop=2
autocmd FileType java,javascript,html,css,xml set shiftwidth=2
autocmd FileType java,javascript,html,css,xml set softtabstop=2

autocmd FileType python,shell,bash set tabstop=4
autocmd FileType python,shell,bash set shiftwidth=4
autocmd FileType python,shell,bash set softtabstop=4

set list
set listchars=tab:>-,trail:-

" syntax
syntax enable
syntax on

" highlight the column where the cursor is.
set cursorcolumn


"- operator ------------------------------------------------

set foldmethod=syntax
set nofoldenable

" record the position of the cursor.
set viewoptions=cursor
au BufWinLeave ?* mkview
au VimEnter ?* silent loadview

" mouse usage
" !To be care. This setting will cause many expected behavior of vim.
set mouse=n
" set selection=exclusive
" set selectmode=mouse,key
" set paste

"- search & match ------------------------------------------

set hlsearch
set incsearch

set showmatch

set ignorecase
set smartcase

"- tab & window & buffer ---------------------------------------

" Disable highlight when <leader><cr> is pressed
nnoremap <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Close the current buffer
nnoremap <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
nnoremap <leader>ba :bufdo bd<cr>

nnoremap <leader>l :bnext<cr>
nnoremap <leader>h :bprevious<cr>

" Useful mappings for managing tabs
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>to :tabonly<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>tm :tabmove 
nnoremap <leader>t<leader> :tabnext

