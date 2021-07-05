" Vundle manage
set nocompatible
filetype off  " be iMproved, required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" 安装插件
Plugin 'majutsushi/tagbar'  " Tag bar
Plugin 'scrooloose/nerdtree'
Plugin 'w0rp/ale'
Plugin 'ycm-core/YouCompleteMe'

Plugin 'ludovicchabant/vim-gutentags'
call vundle#end()
filetype plugin indent on


" noremap K 5k 
" noremap J 5j


set nu! " 显示行号
set tabstop=4

syntax enable
syntax on
colorscheme desert

set hlsearch 
set incsearch


set showmatch
set ignorecase
set smartcase

let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
