set nocp
set packpath+=$HOME/.vim/pack/
set packpath+=$HOME/.vim/pack/ext/
set packpath+=$HOME/.vim/pack/mine/

packadd! YouCompleteMe
packadd! vim-cobra


" Don't show the intro message on startup
set shortmess=I                        

" set t_Co=256
set mouse=a
set laststatus=2
set clipboard=unnamed
filetype on


" let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
let g:ycm_clangd_binary_path = exepath("clangd")

let g:ycm_python_interpreter_path = '/usr/bin/python3'
let g:ycm_python_sys_path = ['system']
" let g:ycm_python_sys_path = ['/Applications/Xcode.app/Contents/SharedFrameworks/LLDB.framework/Resources/Python3']
let g:ycm_extra_conf_vim_data = [
  \ 'g:ycm_python_interpreter_path',
  \ 'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

" close youcompleteme docs window after selection.  obviously.
let g:ycm_autoclose_preview_window_after_completion=1

let g:ycm_enable_diagnostic_signs=1

" collect identifiers from whole project instead of visited files only
let g:ycm_collect_identifiers_from_tags_files = 1

" YCM Shortcuts
nnoremap <Leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <Leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>gr :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>gt :YcmCompleter GetType<CR>
nnoremap <Leader>gd :YcmCompleter GetDoc<CR>
nnoremap <Leader>rr :YcmCompleter RefactorRename<space>
nnoremap <Leader>ft :YcmCompleter Format<CR>
nnoremap <Leader>fx :YcmCompleter FixIt<CR>


" enable for ergodox
"c let mapleader=','

" set line guide at 80
set colorcolumn=80

" show leader key when active
set showcmd

" buffer screen updates
set lazyredraw

" make backspace behave like other apps
set backspace=2

" disable highlighting after search
nnoremap <silent><cr> :noh<CR><CR>

" ctrl+n toggles netrw
noremap <C-n> :Lex<CR>

" ctrl+u toggles undotree
noremap <C-u> :UndotreeToggle<CR>

" ctrl+t toggles tagbar
noremap <C-t> :TagbarToggle<CR>

" Clipboard: F1 copies, F2 pastes
noremap <F1> :.w !pbcopy<CR><CR>
vnoremap <F1> :w !pbcopy<CR><CR>
noremap <F2> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
inoremap <F2> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>


""" AIRLINE AND BUFFERS
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline_theme="distinguished"

" Ignore these fil
set wildignore+=*/tmp/*,*.so,*.swp,*.zip 


" only check a file when loaded or saved
let g:gitgutter_eager = 0
let g:gitgutter_realtime = 0

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
nnoremap <leader>ur :call UltiSnips#RefreshSnippets()<Cr>>

nnoremap <silent> <Leader>bb :buffers<Cr>

" tab to move through buffers - shift+tab to go back
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>


" set autoindent
filetype plugin indent on


set foldmethod=indent


" customize netrw
let g:netrw_banner=0
" let g:netrw_browse_split=4 "open in previous window
let g:netrw_altv=1
let g:netrw_winsize=25
let g:netrw_liststyle=3

" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END


" generic helpers
:inoremap <c-d> <esc> ddi


syntax on
set ruler
set number

set tabstop=2
set shiftwidth=2
set expandtab " spaces for tabs

" Backup Files
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" toggle paste mode
set pastetoggle=<F3>





" gdb
nnoremap <Leader>db :packadd termdebug<Cr> :Termdebug<Cr>



augroup filetype_cpp
    " :autocmd FileType cpp setlocal comments-=:<space>*<space>
    " :autocmd FileType cpp setlocal comments+=:<space>*<space>

    :autocmd FileType cpp nnoremap <buffer> <localleader>c I//<space><esc>
    :autocmd FileType cpp vnoremap <buffer> <localleader>c I/*<space><esc><s-a><space>*/

    :autocmd FileType c nnoremap <buffer> <localleader>c I//<space><esc>
    :autocmd FileType c nnoremap <buffer> <localleader>c I/*<space><esc><s-a><space>*/

augroup end

" get better highlighting for json files
augroup filetype_json
    autocmd BufNewFile,BufRead *.json set ft=javascript
augroup END

:nnoremap <leader>sv :source $MYVIMRC<cr>
:nnoremap <leader>ev :vsplit $MYVIMRC<cr> <c-w><c-r>

:iabbrev @@ aaron@avenue6creative.com


" cscope stuff - see help for more

map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>

if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=0
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
  endif
  set csverb
endif


"watch and auto-reload .vimrc when it changes
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

