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

set cursorcolumn


"- operator ------------------------------------------------

"set foldmethod=syntax
set nofoldenable

" record the position of the cursor.
set viewoptions=cursor
au BufWinLeave ?* mkview
au VimEnter ?* silent loadview

" mouse usage
set mouse=a
" set selection=exclusive
" set selectmode=mouse,key
set paste

"- search & match ------------------------------------------

set hlsearch
set incsearch

set showmatch

set ignorecase
set smartcase

"- tab & window & buffer ---------------------------------------

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Auto Install
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Install vim-plug if it's not already installed.
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.github.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install Vudnle if it's not already installed.
if empty(glob('~/.vim/bundle/Vundle.vim'))
	silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	autocmd VimEnter * PluginInstall --sync | source $MYVIMRC
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugin Manager: Vundle
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype off  " be iMproved, required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin 'majutsushi/tagbar'  " Tag bar

Plugin 'ycm-core/YouCompleteMe'

" Markdown preview.
Plugin 'JamshedVesuna/vim-markdown-preview'

call vundle#end()

filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugin Manager: vim-plug
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" hex mode for binary file
Plug 'fidian/hexmode'

" automatically generate tags in specified location
Plug 'ludovicchabant/vim-gutentags'

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" () [] {} match
Plug 'Raimondi/delimitMate'

Plug 'w0rp/ale'

Plug 'edkolev/tmuxline.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" A simple plugin show the last file user has open
Plug 'mhinz/vim-startify' 

" High light the word at all place.
Plug 'lfv89/vim-interestingwords'

" A Git wrapper
Plug 'tpope/vim-fugitive'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'

Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

Plug 'nathanaelkane/vim-indent-guides'

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" To find file, press <C-p> please.
Plug 'kien/ctrlp.vim'

" A plugin for Go language.
" Plug 'fatih/vim-go', { 'tag': '*' }

" An autocompletion daemon for the Go programming language.
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" fzf is a general-purpose command-line fuzzy finder.
Plug 'junegunn/fzf', {'do': './install --all' }

" Initialize plugin system
call plug#end()



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugin Configuration
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"- YouCompleteMe -------------------------------------------

let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'

"- nerdtree ------------------------------------------------

nnoremap <silent> <leader>n :NERDTreeToggle<CR>

"- vim-interestingwords ------------------------------------

let g:interestingWordsGUIColors = ['#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF']
let g:interestingWordsTermColors = ['154', '121', '211', '137', '214', '222']
let g:interestingWordsRandomiseColors = 1

"- vim-airline ---------------------------------------------

let g:airline_theme='bubblegum'
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1

let g:airline#extensions#tmuxline#enabled = 1

"- ale -----------------------------------------------------

let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'

let g:ale_lint_on_text_changed = 0 " don't hint when change file
let g:ale_lint_on_save = 1 " hint when save file

"- taglist -------------------------------------------------

nnoremap <silent> <leader>t <Esc>:TlistToggle<Cr>
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_One_File = 1
let Tlist_Auto_Open=0
let Tlist_Use_Right_Window = 0

"- delimitmate ---------------------------------------------

let g:delimitMate_expand_cr = 1

"- markdown preview ----------------------------------------

let vim_markdown_preview_github=1

"- ctrlp ---------------------------------------------------

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"- gutentags -----------------------------------------------

" stop when meeting such directory.
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

" generate file name.
let g:gutentags_ctags_tagfile = '.tags'

" move generated tags to ~/.cache/tags directory to avoid pollute project directory.
let s:vim_tags = expand('~/.cache/tags')

let g:gutentags_cache_dir = s:vim_tags

" detect wheter ~/.cache/tags exits.
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

"- ctags ---------------------------------------------------

let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

"- hexmode -------------------------------------------------

let g:hexmode_patterns = '*.bin,*.exe,*.dat,*.o,*.out,*.img,*iso'

"- new plugin ----------------------------------------------
