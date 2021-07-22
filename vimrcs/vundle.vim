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
set runtimepath+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" 
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" complete inputs
Plugin 'ycm-core/YouCompleteMe'

" Markdown preview.
Plugin 'JamshedVesuna/vim-markdown-preview'

call vundle#end()

filetype plugin indent on


"- YouCompleteMe -------------------------------------------

" open syntax complete
let g:ycm_seed_identifiers_with_syntax=1

set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0

let g:ycm_min_num_identifier_candidate_chars = 2 " the min num chars for trigger completement.
let g:ycm_complete_in_comments = 1  " complete in comments
let g:ycm_complete_in_strings = 1   " complete in strings

" diagnostics information display
let g:ycm_show_diagnostics_ui = 0
" let g:ycm_enable_diagnostic_highlighting = 1

let g:ycm_error_symbol = '>'
let g:ycm_warning_symbol = '-'

let g:ycm_server_python_interpreter='/usr/bin/python'

" let g:ycm_confirm_extra_conf=0
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'


