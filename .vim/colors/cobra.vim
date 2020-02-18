" Vim color file -- Cobra
" Maintainer:   Aaron Hinojosa
" Version: 1.1.0

" cobra.vim {{{
  set t_Co=256
  let g:colors_name = "cobra"
  let bgcolor = &background
  highlight clear SignColumn
" }}}

" Colors: {{{
  if bgcolor == "light"
  endif
  if bgcolor == "dark"
    let Black = "guifg=#585858 guibg=NONE gui=NONE ctermfg=240 ctermbg=NONE cterm=NONE"
    let Orange = "guifg=#ffaf00 guibg=NONE gui=NONE ctermfg=214 ctermbg=NONE cterm=NONE"
    let NeonOrange = "guifg=#ffaf00 guibg=NONE gui=NONE ctermfg=226 ctermbg=NONE cterm=NONE"
    let Lime = "guifg=#ffaf00 guibg=NONE gui=NONE ctermfg=119 ctermbg=NONE cterm=NONE"
    let Peach = "guifg=#ffd787 guibg=NONE gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE"
    let LightPeach = "guifg=#ffffaf guibg=NONE gui=NONE ctermfg=229 ctermbg=NONE cterm=NONE"
    let LightestPeach = "guifg=#ffffd7 guibg=NONE gui=NONE ctermfg=230 ctermbg=NONE cterm=NONE"
    let Red = "guifg=#ff5f5f guibg=NONE gui=NONE ctermfg=203 ctermbg=NONE cterm=NONE"

  endif

  let Green = "guifg=#87af5f guibg=NONE gui=NONE ctermfg=107 ctermbg=NONE cterm=NONE"
  let SpotGreen = "guifg=#00af5f guibg=NONE gui=NONE ctermfg=35 ctermbg=NONE cterm=NONE"
  let Gray = "guifg=#bcbcbc guibg=NONE gui=NONE ctermfg=250 ctermbg=NONE cterm=NONE"
  let Blue = "guifg=#5fafdf guibg=NONE gui=NONE ctermfg=74 ctermbg=NONE cterm=NONE"
  let DarkBlue = "guifg=#005fff guibg=NONE gui=NONE ctermfg=27 ctermbg=NONE cterm=NONE"
  let Pink = "guifg=#ff5faf guibg=NONE gui=NONE ctermfg=205 ctermbg=NONE cterm=NONE"
  let HotPink = "guifg=#ff00ff guibg=NONE gui=NONE ctermfg=201 ctermbg=NONE cterm=NONE"


  let DarkPurple = "guibg=NONE gui=NONE ctermfg=55 ctermbg=NONE cterm=NONE"
  let MintBlue = "guibg=NONE gui=NONE ctermfg=51 ctermbg=NONE cterm=NONE"
  let FadedRed = "guibg=NONE gui=NONE ctermfg=52 ctermbg=NONE cterm=NONE"
  let Purple = "guifg=#af87ff guibg=NONE gui=NONE ctermfg=141 ctermbg=NONE cterm=NONE"
  let HotPurple = "guibg=NONE gui=NONE ctermfg=99 ctermbg=NONE cterm=NONE"
  let CoolPurple = "guibg=NONE gui=NONE ctermfg=105 ctermbg=NONE cterm=NONE"
  let CoolBlue = "guibg=NONE gui=NONE ctermfg=25 ctermbg=NONE cterm=NONE"
  let MidBlue = "guibg=NONE gui=NONE ctermfg=33 ctermbg=NONE cterm=NONE"
  let LightBlue = "guibg=NONE gui=NONE ctermfg=33 ctermbg=NONE cterm=NONE"
  let DarkRed = "guibg=NONE gui=NONE ctermfg=124 ctermbg=NONE cterm=NONE"
  let CoolRed = "guibg=NONE gui=NONE ctermfg=210 ctermbg=NONE cterm=NONE"
  let DarkTeal = "guibg=NONE gui=NONE ctermfg=18 ctermbg=NONE cterm=NONE"
  let Teal = "guibg=NONE gui=NONE ctermfg=29 ctermbg=NONE cterm=NONE"
  let LightTeal = "guibg=NONE gui=NONE ctermfg=38 ctermbg=NONE cterm=NONE"
  let DarkGreen = "guibg=NONE gui=NONE ctermfg=22 ctermbg=NONE cterm=NONE"



  let Silver = "guifg=#8a8a8a guibg=NONE gui=NONE ctermfg=245 ctermbg=NONE cterm=NONE"
  let SilverWhite = "guifg=#dadada guibg=NONE gui=NONE ctermfg=253 ctermbg=NONE cterm=NONE"
  let LightSilver = "guibg=NONE gui=NONE ctermfg=251 ctermbg=NONE cterm=NONE"
  let White = "guifg=#eeeeee guibg=NONE gui=NONE ctermfg=255 ctermbg=NONE cterm=NONE"
  let Yellow= "guifg=#dd7f00 guibg=NONE gui=NONE ctermfg=190 ctermbg=NONE cterm=NONE"
  let CoolYellow = "guibg=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE"

" }}}

" Light Background: {{{
  if bgcolor == "light"
  endif
" }}}
" Dark Background: {{{
  if bgcolor == "dark"
    exe "hi Boolean "         .Red

    exe "hi Character "       .Green
    exe "hi Comment "         .DarkGreen

    exe "hi Debug "           .Black
    exe "hi Define "          .Purple

    exe "hi Exception "       .Peach
    exe "hi Float "           .Pink

    exe "hi Identifier "      .LightestPeach
    exe "hi Ignore "          .Blue
    exe "hi Include "         .DarkPurple
    exe "hi Keyword "         .Blue
    exe "hi Label "           .LightPeach
    exe "hi LineNr "          .Black
    exe "hi Macro "           .SilverWhite

    " LightSilver
    exe "hi Normal "          .LightSilver
    exe "hi Noise "           .White

    exe "hi Operator "        .Peach
    exe "hi PreCondit "       .Purple
    exe "hi PreProc "         .Purple
    exe "hi Repeat "          .Peach

    exe "hi Special "         .Pink
    exe "hi SpecialChar "     .Pink
    exe "hi SpecialComment "  .Pink


    " i.e. const
    exe "hi StorageClass "    .DarkRed
    exe "hi Structure "       .HotPink
    exe "hi TypeDef "         .Lime
    exe "hi Type "            .CoolRed
    exe "hi Function "        .MintBlue
    " i.e. std
    exe "hi Constant "        .LightTeal
    exe "hi Modifier "        .Yellow

    exe "hi Conditional "     .NeonOrange

    exe "hi Delimiter "       .LightestPeach
    exe "hi Statement "       .CoolYellow

    exe "hi Number "          .Green

    exe "hi String "          .CoolPurple


    exe "hi Tag "             .LightestPeach
    exe "hi Todo "            .SpotGreen

    " Error color
    exe "hi SpellBad "        .Red



    hi CursorLine   guifg=NONE      guibg=#1c1c1c   gui=NONE      ctermfg=NONE      ctermbg=234       cterm=NONE
    hi ColorColumn  guifg=#ff0000   guibg=#1c1c1c   gui=NONE      ctermfg=203       ctermbg=234       cterm=NONE
    hi Visual guifg=NONE guibg=#ffffff ctermfg=234 ctermbg=255
  endif
" }}}


hi Underlined   guifg=NONE      guibg=NONE      gui=underline ctermfg=NONE      ctermbg=NONE      cterm=underline

" IndentGuides
exe "hi IndentGuidesOdd " .DarkBlue
exe "hi IndentGuidesOdd " .LightestPeach
"
" was 202 for burnt oj
hi Directory guifg=#ffff87 ctermfg=202

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


" YCM
exe "hi YcmErrorSign " .Red
exe "hi WarningSign " .Yellow
exe "hi YcmErrorLine " .Silver
exe "hi YcmWarningLine " .Yellow

" MIT LICENSE {{{
" The MIT License (MIT)
" Copyright 2020 Aaron Hinojosa, http://www.avenue6creative.com
"
" Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}

" vim:foldmethod=marker:foldlevel=0
