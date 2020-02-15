set nocompatible  " be iMproved, required
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" -------
" Plugins
" -------

" Navigation
Plugin 'kien/ctrlp.vim'
"Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'craigemery/vim-autotag'
" Bundle 'jlanzarotta/bufexplorer' // starting to prefer ctrlP's buffer view

" UI Stuff
Plugin 'airblade/vim-gitgutter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'scrooloose/nerdtree'
Plugin 'mbbill/undotree'
Plugin 'jszakmeister/vim-togglecursor'
Plugin 'majutsushi/tagbar'
Plugin 'benjaminwhite/Benokai'
Plugin 'whatyouhide/vim-gotham'
" Plugin 'junegunn/vim-easy-align'

" Commands
" Plugin 'tpope/vim-fugitive'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'
" Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-obsession'

" Automatic Helpers
" Plugin 'xolox/vim-session'
Plugin 'scrooloose/syntastic'
" Plugin 'mtscout6/syntastic-local-eslint.vim'
" Plugin 'Valloric/MatchTagAlways'
" Plugin 'Quramy/vim-js-pretty-template'
" Plugin 'jason0x43/vim-js-indent'


" run npm install in plugin dir if reinstalling
" Plugin 'ternjs/tern_for_vim'

"" Autocompletion
Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Bundle 'honza/vim-snippets'

Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'


" Language Additions
Plugin 'shirk/vim-gas'
Plugin 'justmao945/vim-clang'
" Plugin 'posva/vim-vue'
Plugin 'sheerun/vim-polyglot'
" Plugin 'elixir-lang/vim-elixir'
" Plugin 'pangloss/vim-javascript'
" Plugin 'othree/yajs.vim' " if this slows performance, use jelera instead
" Plugin 'jelera/vim-javascript-syntax'
" Plugin 'othree/javascript-libraries-syntax.vim'
" Plugin 'isRuslan/vim-es6'
Plugin 'leshill/vim-json'
" Plugin 'leafgarland/typescript-vim'
" Disable below if perf is slowed
" Plugin 'Quramy/tsuquyomi' 
" Plugin 'fatih/vim-go'
" Plugin 'chrisbra/Colorizer'

Plugin 'dansomething/vim-eclim'

" Plugin 'jplaut/vim-arduino-ino'
" Plugin 'sudar/vim-arduino-syntax'
" Bundle 'sudar/vim-arduino-snippets'

"   HTML
Plugin 'nono/vim-handlebars'
Plugin 'othree/html5.vim'
Plugin 'indenthtml.vim'

" Misc Languages
" Plugin 'msanders/cocoa.vim'
Plugin 'mutewinter/nginx.vim'
" Plugin 'hail2u/vim-css3-syntax'
Plugin 'mutewinter/vim-tmux'
" Plugin 'plasticboy/vim-markdown'
" Plugin 'groenewege/vim-less'
" Plugin 'wavded/vim-stylus'
Plugin 'JamshedVesuna/vim-markdown-preview'

" MatchIt
Plugin 'matchit.zip'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'

"Libraries
Plugin 'L9'
Plugin 'tpope/vim-repeat'
Plugin 'mattn/webapi-vim'
Plugin 'xolox/vim-misc'

call vundle#end()

colorscheme dobro

" set shortmess=I                        " Don't show the intro message on startup

set background=dark
set t_Co=256
set mouse=a
set laststatus=2
set clipboard=unnamed


" commenting below, the default '\' works well with my ergodox - get one
" if you don't have one, then comma is much easier so uncomment
"c let mapleader=','

" set line guide at 80
set colorcolumn=80

" show leader key when active
set showcmd

" buffer screen updates
set lazyredraw

" make backspace behave like other apps
set backspace=2

" ctrl+n toggles netrw
map <C-n> :NERDTreeToggle<CR>

" ctrl+u toggles undotree
map <C-u> :UndotreeToggle<CR>

" ctrl+t toggles tagbar
map <C-t> :TagbarToggle<CR>

" Clipboard: F1 copies, F2 pastes
nmap <F1> :.w !pbcopy<CR><CR>
vmap <F1> :w !pbcopy<CR><CR>
nmap <F2> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
imap <F2> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>

"jk to exit insert mode - removing this to undo bad habits - must caps escape
" imap jk <Esc>

""" AIRLINE AND BUFFERS
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline_theme="distinguished"

" Ignore these files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip 

""" CTRLP
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn|DS_STORE|node_modules|dist)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" only check a file when loaded or saved
let g:gitgutter_eager = 0
let g:gitgutter_realtime = 0


" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>


" tab to move through buffers - shift+tab to go back
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" was 202 for burnt oj
hi Directory guifg=#ffff87 ctermfg=228

" line number
hi CursorLineNr guifg=#050505

" set tab colors

hi TabLineSel ctermfg=red ctermbg=black
hi Title ctermfg=LightBlue ctermbg=none

" status line
hi StatusLine ctermfg=black ctermbg=black
hi StatusLineNC ctermfg=black ctermbg=black
hi VertSplit ctermfg=black ctermbg=black
set fillchars=stl:-,stlnc:-,vert:\|

" Popup menu
hi Pmenu ctermfg=red ctermbg=black
hi PmenuSbar ctermfg=lightblue ctermbg=black
hi PmenuThumb ctermfg=red ctermbg=black
hi PmenuSel ctermfg=lightblue ctermbg=darkgray

" Code Folding
hi Folded ctermbg=black ctermfg=lightblue


" set autoindent
filetype plugin indent on

set omnifunc=syntaxcomplete#Complete

let vim_markdown_preview_toggle=1
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-m>'

let g:vim_markdown_folding_disabled=1 " Markdown

" enable jsdoc syntax highlighting from vim-javascript
let g:javascript_plugin_jsdoc = 1
set foldmethod=indent " or syntax

" allow custom theming for vim-indent-guides
let g:indent_guides_auto_colors = 0

" ignore angular directives in syntastic
" let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute"]
" let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-","proprietary attribute \"eb-","proprietary attribute \"action"]
let g:syntastic_javascript_checkers = ['eslint']

" integrate with TypeScript
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']

" show linting errors immediately
let g:syntastic_check_on_open = 1

"swap ack for ag
let g:ackprg = 'ag --nogroup --nocolor --column'

" customize netrw
" let g:netrw_banner=0
" let g:netrw_liststyle=3
" let g:netrw_browse_split=4 "open in previous window
" let g:netrw_altv=1
" let g:netrw_winsize=25

" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END



" javascript-libraries-syntax explicit library adds
let g:used_javascript_libs = 'underscore,jquery,react,flux,requirejs,chai,handlebars,vue,d3'

" close youcompleteme docs window after selection.  obviously.
" let g:ycm_autoclose_preview_window_after_completion=1

"==============================================================================
"neocomplete
" Disable AutoComplPop
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 0
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
" let g:neocomplete#enable_refresh_always = 1

" uncomment to close on select: 0 by default
" let g:neocomplete#enable_auto_close_preview = 1

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><s-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 0

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
"==============================================================================


"==============================================================================
"neo-snippet====================================================================

" Plugin key-mappings.
" C-n and C-p to select snippets
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
"==============================================================================


syntax on
set ruler
set number

set tabstop=2
set shiftwidth=2
set expandtab

" Backup Files
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" toggle paste mode
set pastetoggle=<F3>

let g:clang_cpp_options = '-std=c++14'
let g:clang_auto = 1
:nnoremap <F12> :ClangSyntaxCheck<CR>



" Close Vi if Nerdtree is the only window left open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" get better highlighting for json files
autocmd BufNewFile,BufRead *.json set ft=javascript

"vim-easy-align
" imap ga     <Plug>(EasyAlign)
" smap ga     <Plug>(EasyAlign)
" xmap ga     <Plug>(EasyAlign)


"watch and auto-reload .vimrc when it changes
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
