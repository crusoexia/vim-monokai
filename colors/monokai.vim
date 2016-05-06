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
" Initialisation
" --------------

if !has("gui_running") && &t_Co < 256
  finish
endif

if ! exists("g:monokai_italic")
    let g:monokai_italic = 0
endif

if !exists("g:monokai_termcolors")
  let g:monokai_termcolors = 256
endif

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "monokai"

function! s:h(group, style)
  if g:monokai_italic == 0 && has_key(a:style, "format")
    let a:style.format = substitute(a:style.format, ",italic", "", "")
    let a:style.format = substitute(a:style.format, "italic,", "", "")
    let a:style.format = substitute(a:style.format, "italic", "", "")
  endif
  if g:monokai_termcolors == 16
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm16 : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm16 : "NONE")
  else
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm : "NONE")
  end
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")      ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")      ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")      ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "format") && !empty(a:style["format"]) ? "NONE".a:style.format   : "NONE")
    \ "ctermfg=" . l:ctermfg
    \ "ctermbg=" . l:ctermbg
    \ "cterm="   (has_key(a:style, "format") && !empty(a:style["format"]) ? "NONE".a:style.format   : "NONE")
endfunction

" Palettes
" --------

let s:background = { "gui": "#272822", "cterm": "234" }
let s:foreground = { "gui": "#E8E8E3", "cterm": "252" }
let s:window     = { "gui": "#64645e", "cterm": "239" }
let s:line       = { "gui": "#383a3e", "cterm": "236" }
let s:linenr     = { "gui": "#8F908A", "cterm": "243" }
let s:lncolumn   = { "gui": "#2F312B", "cterm": "235" }
let s:darkcolumn = { "gui": "#211F1C", "cterm": "233" }
let s:selection  = { "gui": "#575b61", "cterm": "237" }
let s:comment    = { "gui": "#75715E", "cterm": "59" }
let s:error      = { "gui": "#5f0000", "cterm": "52" }
let s:zentree    = { "gui": "#8f8f8f", "cterm": "242" }

let s:pink       = { "gui": "#F92772", "cterm": "197" }
let s:green      = { "gui": "#A6E22D", "cterm": "148" }
let s:aqua       = { "gui": "#66d9ef", "cterm": "81" }
let s:yellow     = { "gui": "#E6DB74", "cterm": "186" }
let s:orange     = { "gui": "#FD9720", "cterm": "208" }
let s:purple     = { "gui": "#ae81ff", "cterm": "141" }
let s:red        = { "gui": "#e73c50", "cterm": "196" }

let s:addfg      = { "gui": "#d7ffaf", "cterm": "193" }
let s:addbg      = { "gui": "#5f875f", "cterm": "65" }
let s:delbg      = { "gui": "#f75f5f", "cterm": "167" }
let s:changefg   = { "gui": "#d7d7ff", "cterm": "189" }
let s:changebg   = { "gui": "#5f5f87", "cterm": "60" }

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

" Highlighting 
" ------------

" editor
call s:h("Normal",        { "fg": s:foreground, "bg": s:background })
call s:h("ColorColumn",   {                     "bg": s:line })
call s:h("CursorColumn",  {                     "bg": s:line })
call s:h("CursorLine",    {                     "bg": s:line })
call s:h("NonText",       { "fg": s:selection })
call s:h("StatusLine",    { "fg": s:comment,    "bg": s:background,   "format": "reverse" })
call s:h("StatusLineNC",  { "fg": s:window,     "bg": s:comment,      "format": "reverse" })
call s:h("TabLine",       { "fg": s:foreground, "bg": s:darkcolumn,   "format": "reverse" })
call s:h("Visual",        {                     "bg": s:selection })
call s:h("Search",        { "fg": s:background, "bg": s:yellow })
call s:h("MatchParen",    { "fg": s:background, "bg": s:purple })
call s:h("Question",      { "fg": s:yellow })
call s:h("ModeMsg",       { "fg": s:yellow })
call s:h("MoreMsg",       { "fg": s:yellow })
call s:h("ErrorMsg",      { "fg": s:background, "bg": s:red,          "format": "standout" })
call s:h("WarningMsg",    { "fg": s:red })
call s:h("VertSplit",     { "fg": s:window,     "bg": s:darkcolumn })
call s:h("LineNr",        { "fg": s:linenr,     "bg": s:lncolumn })
call s:h("CursorLineNr",  { "fg": s:orange })
call s:h("SignColumn",    {                     "bg": s:lncolumn })

" misc
call s:h("SpecialKey",    { "fg": s:selection })
call s:h("Title",         { "fg": s:yellow })
call s:h("Directory",     { "fg": s:aqua })

" diff
call s:h("DiffAdd",       { "fg": s:addfg,      "bg": s:addbg })
call s:h("DiffDelete",    { "fg": s:background, "bg": s:delbg })
call s:h("DiffChange",    { "fg": s:changefg,   "bg": s:changebg })
call s:h("DiffText",      { "fg": s:background, "bg": s:aqua })

" fold
call s:h("Folded",        { "fg": s:comment,    "bg": s:darkcolumn })
call s:h("FoldColumn",    { "bg": s:darkcolumn })
"        Incsearch"

" popup menu
call s:h("Pmenu",         { "fg": s:lncolumn,   "bg": s:foreground })
call s:h("PmenuSel",      { "fg": s:aqua,       "bg": s:background,   "format": "reverse,bold" })
call s:h("PmenuThumb",    { "fg": s:lncolumn,   "bg": s:linenr })
"        PmenuSbar"

" Generic Syntax Highlighting
" ---------------------------

call s:h("Constant",      { "fg": s:purple,                           "format": "italic" })
call s:h("Number",        { "fg": s:purple })
call s:h("Float",         { "fg": s:purple })
call s:h("Boolean",       { "fg": s:purple })
call s:h("Character",     { "fg": s:yellow })
call s:h("String",        { "fg": s:yellow })

call s:h("Type",          { "fg": s:aqua,                             "format": "italic" })
call s:h("Structure",     { "fg": s:pink,                             "format": "italic" })
call s:h("StorageClass",  { "fg": s:pink,                             "format": "italic" })
call s:h("Typedef",       { "fg": s:pink,                             "format": "italic" })
    
call s:h("Identifier",    { "fg": s:green })
call s:h("Function",      { "fg": s:green })
                         
call s:h("Statement",     { "fg": s:pink })
call s:h("Operator",      { "fg": s:pink })
call s:h("Label",         { "fg": s:pink })
call s:h("Keyword",       { "fg": s:aqua })
"        Conditional"
"        Repeat"
"        Exception"

call s:h("PreProc",       { "fg": s:green })
call s:h("Include",       { "fg": s:aqua })
call s:h("Define",        { "fg": s:aqua })
call s:h("Macro",         { "fg": s:green })
call s:h("PreCondit",     { "fg": s:green })
                           
call s:h("Special",       { "fg": s:aqua })
call s:h("SpecialChar",   { "fg": s:pink })
call s:h("Delimiter",     { "fg": s:pink })
call s:h("SpecialComment",  { "fg": s:aqua })
call s:h("Tag",           { "fg": s:pink })
"        Debug"

call s:h("Todo",          { "fg": s:orange,                           "format": "bold,italic" })
call s:h("Comment",       { "fg": s:comment,                          "format": "italic" })
                         
call s:h("Underlined",    { "fg": s:green })
call s:h("Ignore",        {})
call s:h("Error",         { "fg": s:red, "bg": s:error })

" NerdTree
" --------

call s:h("NERDTreeOpenable",        { "fg": s:yellow })
call s:h("NERDTreeClosable",        { "fg": s:yellow })
call s:h("NERDTreeHelp",            { "fg": s:yellow })
call s:h("NERDTreeBookmarksHeader", { "fg": s:pink })
call s:h("NERDTreeBookmarksLeader", { "fg": s:background })
call s:h("NERDTreeBookmarkName",    { "fg": s:yellow })
call s:h("NERDTreeCWD",             { "fg": s:pink })
call s:h("NERDTreeUp",              { "fg": s:foreground })
call s:h("NERDTreeDirSlash",        { "fg": s:zentree })
call s:h("NERDTreeDir",             { "fg": s:zentree })

" Syntastic
" ---------

hi! link SyntasticErrorSign Error
call s:h("SyntasticWarningSign",    { "fg": s:lncolumn, "bg": s:orange })

" Language highlight
" ------------------

" Java properties
call s:h("jpropertiesIdentifier",   { "fg": s:pink })

" Vim command
call s:h("vimCommand",              { "fg": s:pink })

" Javascript
call s:h("jsFuncName",          { "fg": s:green })
call s:h("jsThis",              { "fg": s:pink })
call s:h("jsFunctionKey",       { "fg": s:green })
call s:h("jsFuncAssignIdent",   { "fg": s:green })
call s:h("jsPrototype",         { "fg": s:aqua })
call s:h("jsGlobalObjects",     { "fg": s:aqua })
call s:h("jsExceptions",        { "fg": s:aqua })
call s:h("jsFutureKeys",        { "fg": s:aqua })
call s:h("jsBuiltins",          { "fg": s:aqua })
                                 
call s:h("jsFuncArgs",          { "fg": s:orange, "format": "italic" })
call s:h("jsFuncAssignObjChain",{ "fg": s:aqua,   "format": "italic" })
call s:h("jsStorageClass",      { "fg": s:aqua,   "format": "italic" })
call s:h("jsDocTags",           { "fg": s:aqua,   "format": "italic" })
                                 
call s:h("javaScriptFunction",  { "fg": s:aqua })
call s:h("javaScriptIdentifier",{ "fg": s:pink })
call s:h("javaScriptLabel",     { "fg": s:pink })
call s:h("javaScriptBraces",    {})

" Html
call s:h("htmlTag",             { "fg": s:foreground })
call s:h("htmlEndTag",          { "fg": s:foreground })
call s:h("htmlTagName",         { "fg": s:pink })
call s:h("htmlArg",             { "fg": s:green })
call s:h("htmlSpecialChar",     { "fg": s:purple })

" Xml
call s:h("xmlTag",              { "fg": s:pink })
call s:h("xmlEndTag",           { "fg": s:pink })
call s:h("xmlTagName",          { "fg": s:orange })
call s:h("xmlAttrib",           { "fg": s:green })

" CSS
call s:h("cssProp",             { "fg": s:yellow })
call s:h("cssUIAttr",           { "fg": s:yellow })
call s:h("cssFunctionName",     { "fg": s:aqua })
call s:h("cssColor",            { "fg": s:purple })
call s:h("cssPseudoClassId",    { "fg": s:purple })
call s:h("cssClassName",        { "fg": s:green })
call s:h("cssValueLength",      { "fg": s:purple })
call s:h("cssCommonAttr",       { "fg": s:pink })
call s:h("cssBraces" ,          { "fg": s:foreground })
call s:h("cssClassNameDot",     { "fg": s:pink })
call s:h("cssURL",              { "fg": s:orange,   "format": "underline,italic" })

" ruby
call s:h("rubyInterpolationDelimiter",  {})
call s:h("rubyInstanceVariable",        {})
call s:h("rubyGlobalVariable",          {})
call s:h("rubyClassVariable",           {})
call s:h("rubyPseudoVariable",          {})
call s:h("rubyFunction",                { "fg": s:green })
call s:h("rubyStringDelimiter",         { "fg": s:yellow })
call s:h("rubyRegexp",                  { "fg": s:yellow })
call s:h("rubyRegexpDelimiter",         { "fg": s:yellow })
call s:h("rubySymbol",                  { "fg": s:purple })
call s:h("rubyEscape",                  { "fg": s:purple })
call s:h("rubyInclude",                 { "fg": s:pink })
call s:h("rubyOperator",                { "fg": s:pink })
call s:h("rubyControl",                 { "fg": s:pink })
call s:h("rubyClass",                   { "fg": s:pink })
call s:h("rubyDefine",                  { "fg": s:pink })
call s:h("rubyException",               { "fg": s:pink })
call s:h("rubyRailsARAssociationMethod",{ "fg": s:orange })
call s:h("rubyRailsARMethod",           { "fg": s:orange })
call s:h("rubyRailsRenderMethod",       { "fg": s:orange })
call s:h("rubyRailsMethod",             { "fg": s:orange })
call s:h("rubyConstant",                { "fg": s:aqua,   "format": "italic" })
call s:h("rubyBlockArgument",           { "fg": s:orange, "format": "italic" })
call s:h("rubyBlockParameter",          { "fg": s:orange, "format": "italic" })

" eruby
call s:h("erubyDelimiter",              {})
call s:h("erubyRailsMethod",            { "fg": s:aqua })

" c
call s:h("cLabel",                      { "fg": s:pink })
call s:h("cStructure",                  { "fg": s:pink })
call s:h("cStorageClass",               { "fg": s:pink })
call s:h("cInclude",                    { "fg": s:green })
call s:h("cDefine",                     { "fg": s:green })
