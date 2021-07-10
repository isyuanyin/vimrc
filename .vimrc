set nocompatible


filetype off  " be iMproved, required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
""               Vundle Plugin Manager               ""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin 'majutsushi/tagbar'  " Tag bar

Plugin 'ycm-core/YouCompleteMe'

" Plugin 'ludovicchabant/vim-gutentags'

call vundle#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" vim-plug manager """""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Markdown preview.
" Plug 'iamcco/mathjax-support-for-mkdp'
" Plug 'iamcco/markdown-preview.vim'

" () [] {} match
Plug 'Raimondi/delimitMate'

Plug 'w0rp/ale'

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
""""“”“”“”“”“”“”“”“ Plugin settings ”“”“”“”“”“”“”“”“”“”“”“
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'

" nerdtree
nnoremap <silent> <leader>n :NERDTreeToggle<CR>

" interesting words
let g:interestingWordsGUIColors = ['#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF']
let g:interestingWordsTermColors = ['154', '121', '211', '137', '214', '222']
let g:interestingWordsRandomiseColors = 1

" vim-airline
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1

"ale
let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'

let g:ale_lint_on_text_changed = 0 " don't hint when change file 
let g:ale_lint_on_save = 1 " hint when save file

" taglist
nnoremap <silent> <leader>t <Esc>:TlistToggle<Cr>
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_One_File = 1
let Tlist_Auto_Open=0
let Tlist_Use_Right_Window = 0

" delimitmate
let g:delimitMate_expand_cr = 1

" markdown preview
" noremap <silent> <F8> <Plug>MarkdownPreview        " for normal mode
" noremap <silent> <F8> <Plug>StopMarkdownPreview    " for normal mode
