set nocp
syntax enable
"set packpath+=$HOME/.vim/pack/mine/opt

" Debugging only
"set verbose=1
"set verbosefile=vim_verbose.log

packadd! tagbar
packadd! vim-cpp-enhanced-highlight
packadd! ctrlp.vim


"packadd! vim-lldb
packadd! ultisnips
packadd! vim-snippets
colorscheme cobra

nnoremap <leader>ll :packadd vim-lldb<CR>
nnoremap <leader>y "*y<CR>

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
set statusline+=%n:  " buffer number
set statusline+=%c  " buffer number
set statusline+=/    " separator
set statusline+=%y      " ft of file

"let g:lldb_python_interpreter_path = '/usr/bin/python3'
"let g:lldb_path = '/usr/local/bin/lldb'
"let g:lldb_width = 5
"let g:lldb_rows = 4
let g:lldb_orientation = 1

" LSP
packadd vim-lsp
"  packadd vim-lsp-settings
packadd asyncomplete.vim
packadd asyncomplete-lsp.vim
packadd vim-lsp-snippets
packadd vim-lsp-ultisnips



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


"set tabstop=4
"set shiftwidth=4
"set expandtab " spaces for tabs


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


augroup filetype_cpp
    " :autocmd FileType cpp setlocal comments-=:<space>*<space>
    :autocmd FileType cpp vnoremap <buffer> <localleader>cm I/*<space><esc><s-a><space>*/<esc>

    :autocmd FileType c nnoremap <buffer> <localleader>cm I/*<space><esc><s-a><space>*/<esc>
    ":autocmd FileType cpp UltiSnipsAddFiletypes cpp_
    :autocmd BufRead,BufNewFile,BufEnter *.cpp,*.h,*.c,*.hpp set tabstop=2 shiftwidth=2 expandtab
augroup end

" get better highlighting for json files
augroup filetype_json
    autocmd BufNewFile,BufRead *.json set ft=javascript
augroup END

nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr> <c-w><c-r>

:iabbrev @@ 67hz@protonmail.com


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
nnoremap <leader>cg :cs find g<space><C-R>=expand("<cword>")<CR><CR>
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
  set csre
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
"let g:UltiSnipsExpandTrigger="<c-l>"
"let g:UltiSnipsJumpForwardTrigger="<c-k>"
"let g:UltiSnipsJumpBackwardTrigger="<c-j>"
"nnoremap <leader>ur :call UltiSnips#RefreshSnippets()<Cr>

" Highlight trailing spaces
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


" Enable OmniCompletion
" http://vim.wikia.com/wiki/Omni_completion

if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd', '-background-index']},
                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                    \ })
        autocmd FileType c,cpp,objc,objcpp setlocal omnifunc=lsp#complete
"        autocmd FileType cpp setlocal omnifunc=lsp#complete
"        autocmd FileType objc setlocal omnifunc=lsp#complete
"        autocmd FileType objcpp setlocal omnifunc=lsp#complete
    augroup end
endif


function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gs <plug>(lsp-document-symbol-search)
  nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation)
  nmap <buffer> gt <plug>(lsp-type-definition)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> [g <plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <plug>(lsp-next-diagnostic)
  nmap <buffer> K <plug>(lsp-hover)
  nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
  nnoremap <buffer> <expr><c-d> lsp#scroll(-4)
  nmap <buffer> <leader>le <plug>(lsp-document-diagnostics)

  let g:lsp_format_sync_timeout = 1000
  autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

  " refer to doc to add more commands
endfunction

augroup lsp_install
  au!
  " call s:on_lsp_buffer_enabled only for languages that has the server registered.
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

noremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"filetype plugin on
"set omnifunc=syntaxcomplete#Complete
"
"" Configure menu behavior
"" http://vim.wikia.com/wiki/VimTip1386
"set completeopt=longest,menuone
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"
"" Use Ctrl+Space for omni-completion
"" https://stackoverflow.com/questions/510503/ctrlspace-for-omni-and-keyword-completion-in-vim
"inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
"  \ "\<lt>C-n>" :
"  \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
"  \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
"  \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
"imap <C-@> <C-Space>

" Popup menu hightLight Group
"highlight Pmenu ctermbg=13 guibg=LightGray
"highlight PmenuSel ctermbg=7 guibg=DarkBlue guifg=White
"highlight PmenuSbar ctermbg=7 guibg=DarkGray
"highlight PmenuThumb guibg=Black

fu g:KernelAddTags()
 packadd! vim-linux-coding-style
 exe 'cscope add /code/open_source/linux'
 exe 'set tags=./TAGS\ /code/open_source/linux'
endfu

if has('syntax') && has('eval')
  packadd! matchit
endif

"watch and auto-reload .vimrc when it changes
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }



