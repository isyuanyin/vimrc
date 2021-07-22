""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugin Manager: vim-plug
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" grep tools
" Plug 'vim-scripts/grep.vim'

" hex mode for binary file
Plug 'fidian/hexmode'

" arm assembly language
Plug 'ARM9/arm-syntax-vim'

" automatically generate tags in specified location
" e.g. .cache directory.
Plug 'ludovicchabant/vim-gutentags'

" Markdown writting prlugin
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'jcf/vim-latex'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" () [] {} match
Plug 'Raimondi/delimitMate'

" highlight errors and warnings.
Plug 'w0rp/ale'

" for tmux
Plug 'edkolev/tmuxline.vim'

" status-line format and color scheme
Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

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
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" To find file, press <C-p> please.
Plug 'kien/ctrlp.vim'

" fzf is a general-purpose command-line fuzzy finder.
Plug 'junegunn/fzf', {'do': './install --all' }

" taglist
Plug 'vim-scripts/taglist.vim'

" Tag bar
Plug 'majutsushi/tagbar'

" cscope
Plug 'vim-scripts/cscope.vim'

" Initialize plugin system
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugin Configuration
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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


"- nerdtree ------------------------------------------------

nnoremap <silent> <leader>n :NERDTreeToggle<CR>

"- vim-interestingwords ------------------------------------

let g:interestingWordsGUIColors = ['#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF']
let g:interestingWordsTermColors = ['154', '121', '211', '137', '214', '222']
let g:interestingWordsRandomiseColors = 1

"- delimitmate ---------------------------------------------

let g:delimitMate_expand_cr = 1

"- markdown preview ----------------------------------------

let vim_markdown_preview_github=1

" Markdown preview.
Plug 'JamshedVesuna/vim-markdown-preview'

"- vim-latex -----------------------------------------------

filetype indent on
let g:tex_flavor='latex'
set iskeyword+=:
let g:Tex_CompileRule_pdf='xelatex -interaction=nonstopmode $*'
let g:Tex_DefaultTargetFormat="pdf"
let g:Tex_ViewRule_pdf = 'okular --unique'
let g:livepreview_previewer = 'okular --unique'
autocmd Filetype tex setl updatetime=1

nnoremap <silent> <leader>p <Esc>:LLPStartPreview<CR>

"- ctrlp ---------------------------------------------------

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"- ctags ---------------------------------------------------

let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']


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

"- hexmode -------------------------------------------------

let g:hexmode_patterns = '*.bin,*.exe,*.dat,*.o,*.out,*.img,*iso'

"- arm-syntax-vim ------------------------------------------

au BufNewFile,BufRead *.s,*.S set filetype=arm " arm = armv6/7

"- new plugin ----------------------------------------------

