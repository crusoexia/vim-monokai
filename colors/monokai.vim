" File:       monokai.vim
" Maintainer: Crusoe Xia (crusoexia)
" URL:        https://github.com/crusoexia/vim-monokai
" License:    MIT
"
" The colour palette is from http://www.colourlovers.com/
" The original code is from https://github.com/w0ng/vim-hybrid
"
" Configuration:
"
"   * Enable italic:
"
"       let g:monokai_italic = 1
"
"   * Use thick window border:
"
"       let g:monokai_thick_border = 1
"
"   * Use zen tree:
"
"       let g:monokai_zentree = 1

" Initialisation
" --------------

if !has("gui_running") && &t_Co < 256
  finish
endif

if ! exists("g:monokai_italic")
    let g:monokai_italic = 0
endif

if ! exists("g:monokai_thick_border")
    let g:monokai_thick_border = 0
endif

if ! exists("g:monokai_zentree")
    let g:monokai_zentree = 0
endif

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "monokai"

" Palettes
" --------

if has("gui_running")
  let s:vmode      = "gui"
  let s:background = "#272822"
  let s:foreground = "#E8E8E3"
  let s:window     = "#64645e"
  let s:line       = "#383a3e"
  let s:linenr     = "#8F908A"
  let s:lncolumn   = "#2F312B"
  let s:darkcolumn = "#211F1C"
  let s:selection  = "#575b61"
  let s:comment    = "#75715E"
  let s:error      = "#5f0000"
  let s:zentree    = "#8f8f8f"
  
  let s:pink       = "#F92772"
  let s:green      = "#A6E22D"
  let s:aqua       = "#66d9ef"
  let s:yellow     = "#E6DB74"
  let s:orange     = "#FD9720"
  let s:purple     = "#ae81ff"
  let s:red        = "#e73c50"

  let s:addfg      = "#d7ffaf"
  let s:addbg      = "#5f875f"
  let s:delbg      = "#f75f5f"
  let s:changefg   = "#d7d7ff"
  let s:changebg   = "#5f5f87"
else
  let s:vmode      = "cterm"
  let s:background = "234"
  let s:foreground = "252"
  let s:window     = "239"
  let s:line       = "236"
  let s:linenr     = "243"
  let s:lncolumn   = "235"
  let s:darkcolumn = "233"
  let s:selection  = "237"
  let s:comment    = "59"
  let s:error      = "52"
  let s:zentree    = "242"
  
  let s:pink       = "197"
  let s:green      = "148"
  let s:aqua       = "81"
  let s:yellow     = "186"
  let s:orange     = "208"
  let s:purple     = "141"
  let s:red        = "196"

  let s:addfg      = "193"
  let s:addbg      = "65"
  let s:delbg      = "167"
  let s:changefg   = "189"
  let s:changebg   = "60"
endif

" Formatting Options
" ------------------

let s:none   = "NONE"
let s:t_none = "NONE"
let s:n      = "NONE"
let s:c      = ",undercurl"
let s:r      = ",reverse"
let s:s      = ",standout"
let s:b      = ",bold"
let s:u      = ",underline"
let s:i      = ",italic"

" Highlighting Primitives
" -----------------------

exe "let s:bg_none       = ' ".s:vmode."bg=".s:none      ."'"
exe "let s:bg_foreground = ' ".s:vmode."bg=".s:foreground."'"
exe "let s:bg_background = ' ".s:vmode."bg=".s:background."'"
exe "let s:bg_selection  = ' ".s:vmode."bg=".s:selection ."'"
exe "let s:bg_line       = ' ".s:vmode."bg=".s:line      ."'"
exe "let s:bg_linenr     = ' ".s:vmode."bg=".s:linenr    ."'"
exe "let s:bg_lncolumn   = ' ".s:vmode."bg=".s:lncolumn  ."'"
exe "let s:bg_comment    = ' ".s:vmode."bg=".s:comment   ."'"
exe "let s:bg_red        = ' ".s:vmode."bg=".s:red       ."'"
exe "let s:bg_orange     = ' ".s:vmode."bg=".s:orange    ."'"
exe "let s:bg_yellow     = ' ".s:vmode."bg=".s:yellow    ."'"
exe "let s:bg_green      = ' ".s:vmode."bg=".s:green     ."'"
exe "let s:bg_aqua       = ' ".s:vmode."bg=".s:aqua      ."'"
exe "let s:bg_purple     = ' ".s:vmode."bg=".s:purple    ."'"
exe "let s:bg_pink       = ' ".s:vmode."bg=".s:pink      ."'"
exe "let s:bg_window     = ' ".s:vmode."bg=".s:window    ."'"
exe "let s:bg_darkcolumn = ' ".s:vmode."bg=".s:darkcolumn."'"
exe "let s:bg_addbg      = ' ".s:vmode."bg=".s:addbg     ."'"
exe "let s:bg_addfg      = ' ".s:vmode."bg=".s:addfg     ."'"
exe "let s:bg_delbg      = ' ".s:vmode."bg=".s:delbg     ."'"
exe "let s:bg_changebg   = ' ".s:vmode."bg=".s:changebg  ."'"
exe "let s:bg_changefg   = ' ".s:vmode."bg=".s:changefg  ."'"
exe "let s:bg_error      = ' ".s:vmode."bg=".s:error     ."'"
exe "let s:bg_zentree    = ' ".s:vmode."bg=".s:zentree   ."'"

exe "let s:fg_none       = ' ".s:vmode."fg=".s:none      ."'"
exe "let s:fg_foreground = ' ".s:vmode."fg=".s:foreground."'"
exe "let s:fg_background = ' ".s:vmode."fg=".s:background."'"
exe "let s:fg_selection  = ' ".s:vmode."fg=".s:selection ."'"
exe "let s:fg_line       = ' ".s:vmode."fg=".s:line      ."'"
exe "let s:fg_linenr     = ' ".s:vmode."fg=".s:linenr    ."'"
exe "let s:fg_lncolumn   = ' ".s:vmode."fg=".s:lncolumn  ."'"
exe "let s:fg_comment    = ' ".s:vmode."fg=".s:comment   ."'"
exe "let s:fg_red        = ' ".s:vmode."fg=".s:red       ."'"
exe "let s:fg_orange     = ' ".s:vmode."fg=".s:orange    ."'"
exe "let s:fg_yellow     = ' ".s:vmode."fg=".s:yellow    ."'"
exe "let s:fg_green      = ' ".s:vmode."fg=".s:green     ."'"
exe "let s:fg_aqua       = ' ".s:vmode."fg=".s:aqua      ."'"
exe "let s:fg_purple     = ' ".s:vmode."fg=".s:purple    ."'"
exe "let s:fg_pink       = ' ".s:vmode."fg=".s:pink      ."'"
exe "let s:fg_window     = ' ".s:vmode."fg=".s:window    ."'"
exe "let s:fg_darkcolumn = ' ".s:vmode."fg=".s:darkcolumn."'"
exe "let s:fg_addbg      = ' ".s:vmode."fg=".s:addbg     ."'"
exe "let s:fg_addfg      = ' ".s:vmode."fg=".s:addfg     ."'"
exe "let s:fg_delbg      = ' ".s:vmode."fg=".s:delbg     ."'"
exe "let s:fg_changebg   = ' ".s:vmode."fg=".s:changebg  ."'"
exe "let s:fg_changefg   = ' ".s:vmode."fg=".s:changefg  ."'"
exe "let s:fg_error      = ' ".s:vmode."fg=".s:error     ."'"
exe "let s:fg_zentree    = ' ".s:vmode."fg=".s:zentree   ."'"

exe "let s:fmt_none      = ' ".s:vmode."=NONE".          " term=NONE"        ."'"
exe "let s:fmt_bold      = ' ".s:vmode."=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_bldi      = ' ".s:vmode."=NONE".s:b.s:i.  " term=NONE".s:b.s:i."'"
exe "let s:fmt_undr      = ' ".s:vmode."=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_undb      = ' ".s:vmode."=NONE".s:u.s:b.  " term=NONE".s:u.s:b."'"
exe "let s:fmt_undi      = ' ".s:vmode."=NONE".s:u.s:i.  " term=NONE".s:u.s:i."'"
exe "let s:fmt_curl      = ' ".s:vmode."=NONE".s:c.      " term=NONE".s:c    ."'"
exe "let s:fmt_ital      = ' ".s:vmode."=NONE".s:i.      " term=NONE".s:i    ."'"
exe "let s:fmt_stnd      = ' ".s:vmode."=NONE".s:s.      " term=NONE".s:s    ."'"
exe "let s:fmt_revr      = ' ".s:vmode."=NONE".s:r.      " term=NONE".s:r    ."'"
exe "let s:fmt_revb      = ' ".s:vmode."=NONE".s:r.s:b.  " term=NONE".s:r.s:b."'"

" Highlighting 
" ------------

" editor
exe "hi! Normal"          .s:fg_foreground  .s:bg_background  .s:fmt_none
exe "hi! ColorColumn"     .s:fg_none        .s:bg_line        .s:fmt_none
exe "hi! CursorColumn"    .s:fg_none        .s:bg_line        .s:fmt_none
exe "hi! CursorLine"      .s:fg_none        .s:bg_line        .s:fmt_none
exe "hi! NonText"         .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! StatusLine"      .s:fg_comment     .s:bg_background  .s:fmt_revr
exe "hi! StatusLineNC"    .s:fg_window      .s:bg_comment     .s:fmt_revr
exe "hi! TabLine"         .s:fg_foreground  .s:bg_darkcolumn  .s:fmt_revr
exe "hi! Visual"          .s:fg_none        .s:bg_selection   .s:fmt_none
exe "hi! Search"          .s:fg_background  .s:bg_yellow      .s:fmt_none
exe "hi! MatchParen"      .s:fg_background  .s:bg_purple      .s:fmt_none
exe "hi! Question"        .s:fg_yellow      .s:bg_none        .s:fmt_none
exe "hi! ModeMsg"         .s:fg_yellow      .s:bg_none        .s:fmt_none
exe "hi! MoreMsg"         .s:fg_yellow      .s:bg_none        .s:fmt_none
exe "hi! ErrorMsg"        .s:fg_background  .s:bg_red         .s:fmt_stnd
exe "hi! WarningMsg"      .s:fg_red         .s:bg_none        .s:fmt_none

if g:monokai_thick_border == 1
    exe "hi! VertSplit"       .s:fg_window      .s:bg_darkcolumn  .s:fmt_none
    exe "hi! LineNr"          .s:fg_linenr      .s:bg_lncolumn    .s:fmt_none
    exe "hi! CursorLineNr"    .s:fg_orange      .s:bg_none        .s:fmt_none
    exe "hi! SignColumn"      .s:fg_none        .s:bg_lncolumn    .s:fmt_none
else
    exe "hi! VertSplit"       .s:fg_window      .s:bg_none        .s:fmt_none
    exe "hi! LineNr"          .s:fg_linenr      .s:bg_none        .s:fmt_none
    exe "hi! CursorLineNr"    .s:fg_orange      .s:bg_none        .s:fmt_bold
    exe "hi! SignColumn"      .s:fg_none        .s:bg_darkcolumn  .s:fmt_none
endif

" misc
exe "hi! SpecialKey"      .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! Title"           .s:fg_yellow      .s:bg_none        .s:fmt_none
exe "hi! Directory"       .s:fg_aqua        .s:bg_none        .s:fmt_none

" diff
exe "hi! DiffAdd"         .s:fg_addfg       .s:bg_addbg       .s:fmt_none
exe "hi! DiffDelete"      .s:fg_background  .s:bg_delbg       .s:fmt_none
exe "hi! DiffChange"      .s:fg_changefg    .s:bg_changebg    .s:fmt_none
exe "hi! DiffText"        .s:fg_background  .s:bg_aqua        .s:fmt_none

" fold
exe "hi! Folded"          .s:fg_comment     .s:bg_darkcolumn  .s:fmt_none
exe "hi! FoldColumn"      .s:fg_none        .s:bg_darkcolumn  .s:fmt_none
"        Incsearch"

" popup menu
exe "hi! Pmenu"           .s:fg_lncolumn    .s:bg_foreground   .s:fmt_none
exe "hi! PmenuSel"        .s:fg_aqua        .s:bg_background   .s:fmt_revb
exe "hi! PmenuThumb"      .s:fg_lncolumn    .s:bg_linenr       .s:fmt_none
"        PmenuSbar"

" Generic Syntax Highlighting
" ---------------------------

if g:monokai_italic == 1
    exe "hi! Constant"    .s:fg_purple      .s:bg_none        .s:fmt_ital
else
    exe "hi! Constant"    .s:fg_purple      .s:bg_none        .s:fmt_none
endif

exe "hi! Number"          .s:fg_purple      .s:bg_none        .s:fmt_none
exe "hi! Float"           .s:fg_purple      .s:bg_none        .s:fmt_none
exe "hi! Boolean"         .s:fg_purple      .s:bg_none        .s:fmt_none
exe "hi! Character"       .s:fg_yellow      .s:bg_none        .s:fmt_none
exe "hi! String"          .s:fg_yellow      .s:bg_none        .s:fmt_none

if g:monokai_italic == 1
    exe "hi! Type"        .s:fg_aqua        .s:bg_none        .s:fmt_ital
    exe "hi! Structure"   .s:fg_pink        .s:bg_none        .s:fmt_ital
    exe "hi! StorageClass".s:fg_pink        .s:bg_none        .s:fmt_ital
    exe "hi! Typedef"     .s:fg_pink        .s:bg_none        .s:fmt_ital
else
    exe "hi! Type"        .s:fg_aqua        .s:bg_none        .s:fmt_none
    exe "hi! Structure"   .s:fg_pink        .s:bg_none        .s:fmt_none
    exe "hi! StorageClass".s:fg_pink        .s:bg_none        .s:fmt_none
    exe "hi! Typedef"     .s:fg_pink        .s:bg_none        .s:fmt_none
endif
    
exe "hi! Identifier"      .s:fg_green       .s:bg_none        .s:fmt_none
exe "hi! Function"        .s:fg_green       .s:bg_none        .s:fmt_none

exe "hi! Statement"       .s:fg_pink        .s:bg_none        .s:fmt_none
exe "hi! Operator"        .s:fg_pink        .s:bg_none        .s:fmt_none
exe "hi! Label"           .s:fg_pink        .s:bg_none        .s:fmt_none
exe "hi! Keyword"         .s:fg_aqua        .s:bg_none        .s:fmt_none
"        Conditional"
"        Repeat"
"        Exception"

exe "hi! PreProc"         .s:fg_green       .s:bg_none        .s:fmt_none
exe "hi! Include"         .s:fg_pink        .s:bg_none        .s:fmt_none
exe "hi! Define"          .s:fg_pink        .s:bg_none        .s:fmt_none
exe "hi! Macro"           .s:fg_green       .s:bg_none        .s:fmt_none
exe "hi! PreCondit"       .s:fg_green       .s:bg_none        .s:fmt_none

exe "hi! Special"         .s:fg_aqua        .s:bg_none        .s:fmt_none
exe "hi! SpecialChar"     .s:fg_pink        .s:bg_none        .s:fmt_none
exe "hi! Delimiter"       .s:fg_pink        .s:bg_none        .s:fmt_none
exe "hi! SpecialComment"  .s:fg_aqua        .s:bg_none        .s:fmt_none
exe "hi! Tag"             .s:fg_pink        .s:bg_none        .s:fmt_none
"        Debug"

exe "hi! Underlined"      .s:fg_green       .s:bg_none        .s:fmt_none
exe "hi! Ignore"          .s:fg_none        .s:bg_none        .s:fmt_none
exe "hi! Error"           .s:fg_red         .s:bg_error       .s:fmt_none

if g:monokai_italic == 1
    exe "hi! Todo"            .s:fg_orange      .s:bg_none        .s:fmt_bldi
    exe "hi! Comment"         .s:fg_comment     .s:bg_none        .s:fmt_ital
else
    exe "hi! Todo"            .s:fg_orange      .s:bg_none        .s:fmt_bold
    exe "hi! Comment"         .s:fg_comment     .s:bg_none        .s:fmt_none
endif

" NerdTree
" --------

exe "hi! NERDTreeOpenable"          .s:fg_yellow      .s:bg_none        .s:fmt_none
exe "hi! NERDTreeClosable"          .s:fg_yellow      .s:bg_none        .s:fmt_none
exe "hi! NERDTreeHelp"              .s:fg_yellow      .s:bg_none        .s:fmt_none
exe "hi! NERDTreeBookmarksHeader"   .s:fg_pink        .s:bg_none        .s:fmt_none
exe "hi! NERDTreeBookmarksLeader"   .s:fg_background  .s:bg_none        .s:fmt_none
exe "hi! NERDTreeBookmarkName"      .s:fg_yellow      .s:bg_none        .s:fmt_none
exe "hi! NERDTreeCWD"               .s:fg_pink        .s:bg_none        .s:fmt_none
exe "hi! NERDTreeUp"                .s:fg_foreground  .s:bg_none        .s:fmt_none
exe "hi! NERDTreeDirSlash"          .s:fg_background  .s:bg_none        .s:fmt_none

if g:monokai_zentree == 1
    exe "hi! NERDTreeDir"               .s:fg_zentree     .s:bg_none        .s:fmt_none
else
    exe "hi! NERDTreeDir"               .s:fg_aqua        .s:bg_none        .s:fmt_none
endif

" Syntastic
" ---------

hi! link SyntasticErrorSign Error
if g:monokai_thick_border == 1
    exe "hi! SyntasticWarningSign"  .s:fg_lncolumn    .s:bg_orange      .s:fmt_none
else
    exe "hi! SyntasticWarningSign"  .s:fg_orange      .s:bg_darkcolumn  .s:fmt_none
endif

" Language highlight
" ------------------

" Java properties
exe "hi! jpropertiesIdentifier"     .s:fg_pink          .s:bg_none          .s:fmt_none

" Vim command
exe "hi! vimCommand"                .s:fg_pink          .s:bg_none          .s:fmt_none

" Javascript
exe "hi! jsFuncName"                .s:fg_green         .s:bg_none          .s:fmt_none
exe "hi! jsThis"                    .s:fg_pink          .s:bg_none          .s:fmt_none
exe "hi! jsFunctionKey"             .s:fg_green         .s:bg_none          .s:fmt_none
exe "hi! jsFuncAssignIdent"         .s:fg_green         .s:bg_none          .s:fmt_none
exe "hi! jsPrototype"               .s:fg_aqua          .s:bg_none          .s:fmt_none
exe "hi! jsGlobalObjects"           .s:fg_aqua          .s:bg_none          .s:fmt_none
exe "hi! jsExceptions"              .s:fg_aqua          .s:bg_none          .s:fmt_none
exe "hi! jsFutureKeys"              .s:fg_aqua          .s:bg_none          .s:fmt_none
exe "hi! jsBuiltins"                .s:fg_aqua          .s:bg_none          .s:fmt_none

if g:monokai_italic == 1
    exe "hi! jsFuncArgs"            .s:fg_orange        .s:bg_none          .s:fmt_ital
    exe "hi! jsFuncAssignObjChain"  .s:fg_aqua          .s:bg_none          .s:fmt_ital
    exe "hi! jsStorageClass"        .s:fg_aqua          .s:bg_none          .s:fmt_ital
    exe "hi! jsDocTags"             .s:fg_aqua          .s:bg_none          .s:fmt_ital
else
    exe "hi! jsFuncArgs"            .s:fg_orange        .s:bg_none          .s:fmt_none
    exe "hi! jsFuncAssignObjChain"  .s:fg_aqua          .s:bg_none          .s:fmt_none
    exe "hi! jsStorageClass"        .s:fg_aqua          .s:bg_none          .s:fmt_none
    exe "hi! jsDocTags"             .s:fg_aqua          .s:bg_none          .s:fmt_none
endif

exe "hi! javaScriptFunction"        .s:fg_aqua          .s:bg_none          .s:fmt_none
exe "hi! javaScriptIdentifier"      .s:fg_pink          .s:bg_none          .s:fmt_none
exe "hi! javaScriptLabel"           .s:fg_pink          .s:bg_none          .s:fmt_none
exe "hi! javaScriptBraces"          .s:fg_none          .s:bg_none          .s:fmt_none

" Html
exe "hi! htmlTag"                   .s:fg_foreground    .s:bg_none          .s:fmt_none
exe "hi! htmlEndTag"                .s:fg_foreground    .s:bg_none          .s:fmt_none
exe "hi! htmlTagName"               .s:fg_pink          .s:bg_none          .s:fmt_none
exe "hi! htmlArg"                   .s:fg_green         .s:bg_none          .s:fmt_none
exe "hi! htmlSpecialChar"           .s:fg_purple        .s:bg_none          .s:fmt_none

" Xml
exe "hi! xmlTag"                    .s:fg_pink          .s:bg_none          .s:fmt_none
exe "hi! xmlEndTag"                 .s:fg_pink          .s:bg_none          .s:fmt_none
exe "hi! xmlTagName"                .s:fg_orange        .s:bg_none          .s:fmt_none
exe "hi! xmlAttrib"                 .s:fg_green         .s:bg_none          .s:fmt_none

" CSS
exe "hi! cssProp"                   .s:fg_yellow        .s:bg_none       .s:fmt_none
exe "hi! cssUIAttr"                 .s:fg_yellow        .s:bg_none       .s:fmt_none
exe "hi! cssFunctionName"           .s:fg_aqua          .s:bg_none       .s:fmt_none
exe "hi! cssColor"                  .s:fg_purple        .s:bg_none       .s:fmt_none
exe "hi! cssPseudoClassId"          .s:fg_purple        .s:bg_none       .s:fmt_none
exe "hi! cssClassName"              .s:fg_green         .s:bg_none       .s:fmt_none
exe "hi! cssValueLength"            .s:fg_purple        .s:bg_none       .s:fmt_none
exe "hi! cssCommonAttr"             .s:fg_pink          .s:bg_none       .s:fmt_none
exe "hi! cssBraces"                 .s:fg_foreground    .s:bg_none       .s:fmt_none
exe "hi! cssClassNameDot"           .s:fg_pink          .s:bg_none       .s:fmt_none

if g:monokai_italic == 1
    exe "hi! cssURL"                .s:fg_orange       .s:bg_none          .s:fmt_undi
else
    exe "hi! cssURL"                .s:fg_orange       .s:bg_none          .s:fmt_undr
endif

" ruby
exe "hi! rubyInterpolationDelimiter"    .s:fg_none         .s:bg_none          .s:fmt_none
exe "hi! rubyInstanceVariable"          .s:fg_none         .s:bg_none          .s:fmt_none
exe "hi! rubyGlobalVariable"            .s:fg_none         .s:bg_none          .s:fmt_none
exe "hi! rubyClassVariable"             .s:fg_none         .s:bg_none          .s:fmt_none
exe "hi! rubyPseudoVariable"            .s:fg_none         .s:bg_none          .s:fmt_none
exe "hi! rubyFunction"                  .s:fg_green        .s:bg_none          .s:fmt_none
exe "hi! rubyStringDelimiter"           .s:fg_yellow       .s:bg_none          .s:fmt_none
exe "hi! rubyRegexp"                    .s:fg_yellow       .s:bg_none          .s:fmt_none
exe "hi! rubyRegexpDelimiter"           .s:fg_yellow       .s:bg_none          .s:fmt_none
exe "hi! rubySymbol"                    .s:fg_purple       .s:bg_none          .s:fmt_none
exe "hi! rubyEscape"                    .s:fg_purple       .s:bg_none          .s:fmt_none
exe "hi! rubyInclude"                   .s:fg_pink         .s:bg_none          .s:fmt_none
exe "hi! rubyOperator"                  .s:fg_pink         .s:bg_none          .s:fmt_none
exe "hi! rubyControl"                   .s:fg_pink         .s:bg_none          .s:fmt_none
exe "hi! rubyClass"                     .s:fg_pink         .s:bg_none          .s:fmt_none
exe "hi! rubyDefine"                    .s:fg_pink         .s:bg_none          .s:fmt_none
exe "hi! rubyException"                 .s:fg_pink         .s:bg_none          .s:fmt_none
exe "hi! rubyRailsARAssociationMethod"  .s:fg_orange       .s:bg_none          .s:fmt_none
exe "hi! rubyRailsARMethod"             .s:fg_orange       .s:bg_none          .s:fmt_none
exe "hi! rubyRailsRenderMethod"         .s:fg_orange       .s:bg_none          .s:fmt_none
exe "hi! rubyRailsMethod"               .s:fg_orange       .s:bg_none          .s:fmt_none

if g:monokai_italic == 1
    exe "hi! rubyConstant"              .s:fg_aqua         .s:bg_none          .s:fmt_ital
    exe "hi! rubyBlockArgument"         .s:fg_orange       .s:bg_none          .s:fmt_ital
    exe "hi! rubyBlockParameter"        .s:fg_orange       .s:bg_none          .s:fmt_ital
else
    exe "hi! rubyConstant"              .s:fg_orange       .s:bg_none          .s:fmt_none
    exe "hi! rubyBlockArgument"         .s:fg_orange       .s:bg_none          .s:fmt_none
    exe "hi! rubyBlockParameter"        .s:fg_orange       .s:bg_none          .s:fmt_none
endif

" eruby
exe "hi! erubyDelimiter"                .s:fg_none         .s:bg_none          .s:fmt_none
exe "hi! erubyRailsMethod"              .s:fg_aqua         .s:bg_none          .s:fmt_none

" c
exe "hi! cLabel"                        .s:fg_pink          .s:bg_none          .s:fmt_none
exe "hi! cStructure"                    .s:fg_pink          .s:bg_none          .s:fmt_none
exe "hi! cStorageClass"                 .s:fg_pink          .s:bg_none          .s:fmt_none
exe "hi! cInclude"                      .s:fg_green         .s:bg_none          .s:fmt_none
exe "hi! cDefine"                       .s:fg_green         .s:bg_none          .s:fmt_none
