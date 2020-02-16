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
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
" Plugin 'kien/ctrlp.vim'
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
Plugin 'tpope/vim-obsession'

" Automatic Helpers
" Plugin 'xolox/vim-session'
" Plugin 'scrooloose/syntastic'
" Plugin 'Valloric/MatchTagAlways'



Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'


" Language Additions
Plugin 'shirk/vim-gas'
Plugin 'ycm-core/YouCompleteMe'
" Plugin 'justmao945/vim-clang'
" Plugin 'sheerun/vim-polyglot'
Plugin 'leshill/vim-json'
" Plugin 'chrisbra/Colorizer'

Plugin 'dansomething/vim-eclim'

" Plugin 'jplaut/vim-arduino-ino'
" Plugin 'sudar/vim-arduino-syntax'
" Bundle 'sudar/vim-arduino-snippets'

" Plugin 'msanders/cocoa.vim'
Plugin 'mutewinter/nginx.vim'
Plugin 'mutewinter/vim-tmux'
" Plugin 'plasticboy/vim-markdown'
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


" let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
let g:ycm_clangd_binary_path = exepath("clangd")

let g:ycm_python_interpreter_path = '/usr/bin/python'
let g:ycm_python_sys_path = ['system']
let g:ycm_extra_conf_vim_data = [
  \ 'g:ycm_python_interpreter_path',
  \ 'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'

" close youcompleteme docs window after selection.  obviously.
let g:ycm_autoclose_preview_window_after_completion=1

let g:ycm_enable_diagnostic_signs=1

" YCM Shortcuts
nnoremap <Leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <Leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>gr :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>gt :YcmCompleter GetType<CR>
nnoremap <Leader>gd :YcmCompleter GetDoc<CR>
nnoremap <Leader>rr :YcmCompleter RefactorRename<space>
nnoremap <Leader>ft :YcmCompleter Format<CR>
nnoremap <Leader>fx :YcmCompleter FixIt<CR>





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
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/](\.(git|hg|svn|DS_STORE|node_modules|dist)|\_site)$',
"   \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
" \}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports .svn, .hg, .bzr.
" let g:ctrlp_working_path_mode = 'r'

" only check a file when loaded or saved
let g:gitgutter_eager = 0
let g:gitgutter_realtime = 0


" Use a leader instead of the actual named binding
" nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
" nmap <leader>bb :CtrlPBuffer<cr>
" nmap <leader>bm :CtrlPMixed<cr>
" nmap <leader>bs :CtrlPMRU<cr>


let g:fzf_buffers_jump = 1
nnoremap <silent> <Leader>b :Buffers<Cr>
nnoremap <silent> <Leader>g :GFiles?
nnoremap <silent> <Leader>m :Marks<Cr>


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
hi Pmenu ctermfg=blue ctermbg=black
hi PmenuSbar ctermfg=lightblue ctermbg=black
hi PmenuThumb ctermfg=red ctermbg=black
hi PmenuSel ctermfg=lightblue ctermbg=darkgray

" Code Folding
hi Folded ctermbg=black ctermfg=lightblue


" set autoindent
filetype plugin indent on

let vim_markdown_preview_toggle=1
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-m>'

let g:vim_markdown_folding_disabled=1 " Markdown

set foldmethod=indent " or syntax

" allow custom theming for vim-indent-guides
let g:indent_guides_auto_colors = 0



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





nnoremap <C-p> :Files<Cr>

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/bundle/fzf.vim/bin/preview.sh {}']}, <bang>0)


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

" let g:clang_cpp_options = '-std=c++14'
" let g:clang_auto = 1
" :nnoremap <F12> :ClangSyntaxCheck<CR>



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
