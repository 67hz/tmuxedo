set nocp
syntax enable
"set packpath+=$HOME/.vim/pack/

" Debugging only
"set verbose=1
"set verbosefile=vim_verbose.log

packadd! YouCompleteMe
packadd! tagbar
packadd! vim-cpp-enhanced-highlight
packadd! ctrlp.vim
packadd! cobra

"packadd! vim-lldb
packadd! ultisnips
packadd! vim-snippets
colorscheme cobra

nnoremap <leader>ll :packadd vim-lldb<CR>
nnoremap <leader>y "*y<CR>

nnoremap <F1> :echo 'foo'<CR>
nnoremap <F2> :echo 'bar'<CR>

nnoremap <leader>m :make <CR>


let g:cpp_posix_standard=1

" Don't show the intro message on startup
set shortmess=I                        

" set t_Co=256
set mouse=a



"set clipboard=unnamed

"set noruler
set number

"
" status line
"
set laststatus=2
set statusline=%f  " path to file
set statusline+=/
set statusline+=buf:
set statusline+=%n  " buffer number
set statusline+=/    " separator
set statusline+=%y      " ft of file

"let g:lldb_python_interpreter_path = '/usr/bin/python3'
"let g:lldb_path = '/usr/local/bin/lldb'
"let g:lldb_width = 5
"let g:lldb_rows = 4
let g:lldb_orientation = 1

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
let g:ycm_global_ycm_extra_conf = '~/global_ycm_extra_conf.py'
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

"
" Languages
"

" Assembly
let asmsyntax = "nasm"

" disable highlighting after search
nnoremap <silent><cr> :noh<CR><CR>



" ctrl+u toggles undotree
"noremap <C-u> :UndotreeToggle<CR>

" ctrl+t toggles tagbar
noremap <C-t> :TagbarToggle<CR>

" Clipboard: F1 copies, F2 pastes
nnoremap <leader>y "*y<CR>
nnoremap <leader>p "*p<CR>


" Ignore these files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip 


" only check a file when loaded or saved
let g:gitgutter_eager = 0
let g:gitgutter_realtime = 0



" All things buffer
nnoremap <silent> <Leader>bb :buffers<Cr>
nnoremap <leader>bn :buffer<space>

" tab to move through buffers - shift+tab to go back
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>


set autoindent
filetype plugin indent on


set foldmethod=manual



"
" customize netrw
"

nnoremap <C-n> :Lex<CR>
let g:netrw_banner=0
let g:netrw_browse_split=4 "open in previous window
"let g:netrw_altv=1
"let g:netrw_winsize=25
let g:netrw_liststyle=3

" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END


" generic helpers
:inoremap <c-d> <esc> ddi




set tabstop=4
set shiftwidth=4
set expandtab " spaces for tabs


if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

set backupdir=~/.vim/backup/
set directory=~/.vim/swap/
set undodir=~/.vim/undo/


" toggle paste mode
set pastetoggle=<F3>

let g:termdebug_use_prompt=1

nnoremap <Leader>c :messages clear<Cr>


" gdb
nnoremap <Leader>db :packadd testdebug<Cr> :Termdebug<Cr>


augroup filetype_vim
    set tabstop=2
    set shiftwidth=2
    set expandtab " spaces for tabs
augroup end

augroup filetype_cpp
    " :autocmd FileType cpp setlocal comments-=:<space>*<space>
    :autocmd FileType cpp vnoremap <buffer> <localleader>cm I/*<space><esc><s-a><space>*/<esc>

    :autocmd FileType c nnoremap <buffer> <localleader>cm I/*<space><esc><s-a><space>*/<esc>
    :autocmd FileType cpp UltiSnipsAddFiletypes cpp_
augroup end

" get better highlighting for json files
augroup filetype_json
    autocmd BufNewFile,BufRead *.json set ft=javascript
augroup END

nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr> <c-w><c-r>

:iabbrev @@ aaron@avenue6creative.com


" file search
" find files and populate the quickfix list
fun! FindFiles(filename)
    let error_file = tempname()
    silent exe '!find . -name "'.a:filename.'" | xargs file | sed "s/:/:1:/" > '.error_file
    set errorformat=%f:%l:%m
    exe "cfile ". error_file
    copen
    call delete(error_file)
endfun
command! -nargs=1 FindFile call FindFiles(<q-args>)

nnoremap <C-x> :FindFile<space>


""
" cscope stuff - see help for more
"
" C symbol
map <leader>cs :cs find s <C-R>=expand("<cword>")<CR><CR>
"definition
nnoremap <leader>cg :cs find g<space>
" functions called by this function
nnoremap <leader>cd :cs find d <C-R>=expand("<cword>")<CR><CR>
" functions calling this function
nnoremap <leader>cc :cs find c <C-R>=expand("<cword>")<CR><CR>
" symbol assigned
nnoremap <leader>ca :cs find a <C-R>=expand("<cword>")<CR><CR>

"file
nnoremap <leader>cf :cs find f<space>
"string
nnoremap <leader>ct :cs find t<space>
"egrep
nnoremap <leader>ce :cs find e<space>

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

"
" snippets
"
" Ultisnips
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"
nnoremap <leader>ur :call UltiSnips#RefreshSnippets()<Cr>





if has('syntax') && has('eval')
  packadd! matchit
endif

"watch and auto-reload .vimrc when it changes
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }



