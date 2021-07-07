set nocompatible


filetype off  " be iMproved, required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
""               Vundle Plugin Manager               ""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" 
" " let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'
" Plugin 'majutsushi/tagbar'  " Tag bar
" Plugin 'scrooloose/nerdtree'
" Plugin 'w0rp/ale'
" Plugin 'ycm-core/YouCompleteMe'
" 
" Plugin 'ludovicchabant/vim-gutentags'
" call vundle#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" vim-plug manager """""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

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
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()


filetype plugin indent on

" display
set number 
set tabstop=4

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

" keyboard settings
let mapleader = ","




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""“”“”“”“”“”“”“”“ Plugin settings ”“”“”“”“”“”“”“”“”“”“”“
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:ycm_server_python_interpreter='/usr/bin/python'
" let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'

" nerdtree
nnoremap <silent> <leader>n :NERDTreeToggle<CR>

" interesting words 
let g:interestingWordsGUIColors = ['#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF']
let g:interestingWordsTermColors = ['154', '121', '211', '137', '214', '222']
let g:interestingWordsRandomiseColors = 1

" vim-airline

