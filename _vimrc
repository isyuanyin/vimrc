set nocompatible

set termguicolors " to display more color

" tick :help hit-enter to known more
set shortmess=a
set cmdheight=2

set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1

set guifont=Hack:h11
" set guifont=FiraCode\ Nerd\ Font:h11

if has("win32")
	set fileencoding=chinese
else
	set fileencoding=utf-8
endif

"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"解决consle输出乱码
language messages zh_CN.utf-8

filetype off  " be iMproved, required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
""               Vundle Plugin Manager               ""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set the runtime path to include Vundle and initialize
set rtp+=~/vimfiles/bundle/Vundle.vim
call vundle#begin('~/vimfiles/bundle')

Plugin 'VundleVim/Vundle.vim'

" Plugin 'majutsushi/tagbar'  " Tag bar

" Plugin 'ycm-core/YouCompleteMe'

" Plugin 'ludovicchabant/vim-gutentags'

call vundle#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" vim-plug manager """""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/vimfiles/plugged')

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'w0rp/ale'

" Plug 'edkolev/tmuxline.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" A simple plugin show the last file user has open
Plug 'mhinz/vim-startify' 

" High light the word at all place.
Plug 'lfv89/vim-interestingwords'

" A Git wrapper
Plug 'tpope/vim-fugitive'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" A plugin for Go language.
" Plug 'fatih/vim-go', { 'tag': '*' }

" An autocompletion daemon for the Go programming language.
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" fzf is a general-purpose command-line fuzzy finder.
Plug 'junegunn/fzf', {'do': './install --all' }

" Initialize plugin system
call plug#end()

filetype plugin indent on

" display
set number
set tabstop=4
set shiftwidth=4
set autoindent

set foldmethod=syntax
set nofoldenable

set list
set listchars=tab:>-,trail:-

" syntax
syntax enable
syntax on

" color scheme
colorscheme desert

" search and match
set hlsearch 
set incsearch

set showmatch

set ignorecase
set smartcase

" mouse usage
" set mouse=a
" set selection=exclusive
" set selectmode=mouse,key
" set paste

" keyboard settings
let mapleader = " "




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
" let g:ycm_server_python_interpreter='/usr/bin/python'
" let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'

" nerdtree
nnoremap <silent> <leader>n :NERDTreeToggle<CR>

" interesting words
let g:interestingWordsGUIColors = ['#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF']
let g:interestingWordsTermColors = ['154', '121', '211', '137', '214', '222']
let g:interestingWordsRandomiseColors = 1

" vim-airline
let g:airline_theme='bubblegum'
" let g:airline_theme='silver'
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1

" let g:airline#extensions#tmuxline#enabled = 1

"ale
let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'

let g:ale_lint_on_text_changed = 0 " don't hint when change file 
let g:ale_lint_on_save = 1 " hint when save file

" taglist
" nnoremap <silent> <leader>t <Esc>:TlistToggle<Cr>
" let Tlist_Ctags_Cmd = '/usr/bin/ctags'
" let Tlist_Exit_OnlyWindow = 1
" let Tlist_Show_One_File = 1
" let Tlist_Auto_Open=0
" let Tlist_Use_Right_Window = 0
