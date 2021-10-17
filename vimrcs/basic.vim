" url: https://github.com/isyuanyin/vimrc
" auhthor: Yuanyin Zhang
" mail: isyuanyin@gmail.com
" description: An example for .vimrc file.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Manually Settings
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"- general -------------------------------------------------
set nocompatible

" encode & decode
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

" keyboard settings
let mapleader = " "

" autocmd BufWritePost $MYVIMRC source $MYVIMRC

" time switch mode

" set timeoutlen=0

autocmd InsertEnter * set timeoutlen=0
autocmd InsertLeave * set timeoutlen=0

"- display -------------------------------------------------

" color scheme
colorscheme desert

" display the line and column info.
set ruler
" displaye the number of line.
set number
" the width of tab key.
set tabstop=8
" the width of new line.
set shiftwidth=8

set autoindent
set smartindent

set cindent

autocmd FileType javascript,html,css,xml set tabstop=2
autocmd FileType javascript,html,css,xml set shiftwidth=2
autocmd FileType javascript,html,css,xml set softtabstop=2

autocmd FileType python,shell,bash set tabstop=4
autocmd FileType python,shell,bash set shiftwidth=4
autocmd FileType python,shell,bash set softtabstop=4

set list
set listchars=tab:>-,trail:-

" hightlight the key words of current syntax.
syntax enable
syntax on

" highlight the column where the cursor is.
" set cursorcolumn
set cursorline
highlight CursorLine term=bold cterm=bold ctermbg=237

"- motion & operator ------------------------------------------------

set linebreak

set whichwrap=b,s,<,>,[,] " cursor auto come to the next line.

set foldmethod=syntax
set nofoldenable

" record the position of the cursor.
set viewoptions=cursor
au BufWinLeave ?* mkview
au VimEnter ?* silent loadview

" mouse usage
" !To be care. This setting will cause many expected behavior of vim.
" set mouse
" set selection=exclusive
" set selectmode=mouse,key

" set paste

set wildmenu

"- search & match ------------------------------------------

set hlsearch
set incsearch

set showmatch

set ignorecase
set smartcase

"- tab & window & buffer ---------------------------------------

set splitbelow
set splitright

" Disable highlight when <leader><cr> is pressed
" nnoremap <silent> <leader><cr> :noh<cr>

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


nnoremap <leader>\ :vsplit<CR>
nnoremap <leader>- :split<CR>
