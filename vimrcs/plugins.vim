""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugin Manager: vim-plug
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" a super plugin for complete code
Plug 'ycm-core/YouCompleteMe'

" to add some bookmarks
Plug 'MattesGroeger/vim-bookmarks'

" add buffer info tu status line and cmd line
Plug 'bling/vim-bufferline'

" light plugin for echo git commit info.
Plug 'zivyangll/git-blame.vim'

" Plug 'othree/xml.vim'

" HTML plugin
" Plug 'mattn/emmet-vim'

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

" plugin for latex coding
" Plug 'jcf/vim-latex'

" plugin for latex preview
" Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

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

"
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } |
	\ Plug 'scrooloose/nerdcommenter' |
	\ Plug 'Xuyuanp/nerdtree-git-plugin' |
	\Plug 'ryanoasis/vim-devicons'

" 
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

Plug 'nathanaelkane/vim-indent-guides'

" Generate config file for YouCompleteMe plugin.
" Use :YcmGenerateConfig or :CCGenerateConfig
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

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
let Tlist_Use_Right_Window = 1


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

" detect whether ~/.cache/tags exits.
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

"- cscope.vim ----------------------------------------------

nnoremap <leader>fa :call cscope#findInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>

" s: Find this C symbol
" nnoremap  <leader>fs :call cscope#find('s', expand('<cword>'))<CR>
" g: Find this definition
" nnoremap  <leader>fg :call cscope#find('g', expand('<cword>'))<CR>
" d: Find functions called by this function
" nnoremap  <leader>fd :call cscope#find('d', expand('<cword>'))<CR>
" c: Find functions calling this function
" nnoremap  <leader>fc :call cscope#find('c', expand('<cword>'))<CR>
" t: Find this text string
" nnoremap  <leader>ft :call cscope#find('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
" nnoremap  <leader>fe :call cscope#find('e', expand('<cword>'))<CR>
" f: Find this file
" nnoremap  <leader>ff :call cscope#find('f', expand('<cword>'))<CR>
" i: Find files #including this file
" nnoremap  <leader>fi :call cscope#find('i', expand('<cword>'))<CR>

"- cscope --------------------------------------------------

" set quickfix
set cscopequickfix=s-,c-,d-,i-,t-,e-,a-

" use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
set cscopetag

" check cscope for definition of a symbol before checking ctags: set to 1
" if you want the reverse search order.
set csto=0

" add any cscope database in current directory
if filereadable("cscope.out")
	cs add cscope.out
" else add the database pointed to by environment variable
elseif $CSCOPE_DB != ""
	cs add $CSCOPE_DB
endif

" show msg when any other cscope db added
set cscopeverbose

" keymap for cscope
nnoremap <leader>fs :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>fg :cs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>fc :cs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>fd :cs find d <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>ft :cs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>fe :cs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>ff :cs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap <leader>fi :cs find i ^<C-R>=expand("<cfile>")<CR><CR>

nnoremap <leader>ss :scs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>sg :scs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>sc :scs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>sd :scs find d <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>st :scs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>se :scs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>sf :scs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap <leader>si :scs find i <C-R>=expand("<cfile>")<CR><CR>

nnoremap <leader>vs :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>vg :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>vc :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>vt :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>ve :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>vi :vert scs find i <C-R>=expand("<cfile>")<CR><CR>
nnoremap <leader>vd :vert scs find d <C-R>=expand("<cword>")<CR><CR>

"F6 for open quickfix
nnoremap <F6> :cw<CR>

"Ctrl+F6 for close quickfix
nnoremap <C-F6> :ccl<CR>

"F7 for select next quickfix
nnoremap <F7> :cn<CR>

"F8 for select last quickfix
nnoremap <F8> :cp<CR>


"- hexmode -------------------------------------------------

let g:hexmode_patterns = '*Image,*.bin,*.exe,*.dat,*.o,*.out,*.img,*iso'

"- arm-syntax-vim ------------------------------------------

autocmd BufNewFile,BufRead *.s,*.S set filetype=arm " arm = armv6/7

"- emmet ---------------------------------------------------
let g:user_emmet_install_global = 0
autocmd FileType html,css,mm EmmetInstall

"- git-blame.vim -------------------------------------------

nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

"- vim-bookmarks -------------------------------------------

nmap <Leader>mm <Plug>BookmarkToggle
nmap <Leader>mi <Plug>BookmarkAnnotate
nmap <Leader>ma <Plug>BookmarkShowAll
nmap <Leader>mj <Plug>BookmarkNext
nmap <Leader>mk <Plug>BookmarkPrev
nmap <Leader>mc <Plug>BookmarkClear
nmap <Leader>mx <Plug>BookmarkClearAll
nmap <Leader>mK <Plug>BookmarkMoveUp
nmap <Leader>mJ <Plug>BookmarkMoveDown
nmap <Leader>mg <Plug>BookmarkMoveToLine

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

"- new plugin ----------------------------------------------

