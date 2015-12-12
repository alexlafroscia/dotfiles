" Vim color file
" Converted from Textmate theme Oceanic Next using Coloration v0.3.3 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "Oceanic Next"

hi Cursor ctermfg=17 ctermbg=152 cterm=NONE guifg=#1b2b34 guibg=#c0c5ce gui=NONE
hi Visual ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#4f5b66 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=23 cterm=NONE guifg=NONE guibg=#2d3c45 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=23 cterm=NONE guifg=NONE guibg=#2d3c45 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=23 cterm=NONE guifg=NONE guibg=#2d3c45 gui=NONE
hi LineNr ctermfg=102 ctermbg=23 cterm=NONE guifg=#747f89 guibg=#2d3c45 gui=NONE
hi VertSplit ctermfg=59 ctermbg=59 cterm=NONE guifg=#4f5c65 guibg=#4f5c65 gui=NONE
hi MatchParen ctermfg=176 ctermbg=NONE cterm=underline guifg=#c594c5 guibg=NONE gui=underline
hi StatusLine ctermfg=188 ctermbg=59 cterm=bold guifg=#cdd3de guibg=#4f5c65 gui=bold
hi StatusLineNC ctermfg=188 ctermbg=59 cterm=NONE guifg=#cdd3de guibg=#4f5c65 gui=NONE
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#4f5b66 gui=NONE
hi IncSearch ctermfg=17 ctermbg=114 cterm=NONE guifg=#1b2b34 guibg=#99c794 gui=NONE
hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi Directory ctermfg=114 ctermbg=NONE cterm=NONE guifg=#99c794 guibg=NONE gui=NONE
hi Folded ctermfg=60 ctermbg=17 cterm=NONE guifg=#65737e guibg=#1b2b34 gui=NONE

hi Normal ctermfg=188 ctermbg=17 cterm=NONE guifg=#cdd3de guibg=#1b2b34 gui=NONE
hi Boolean ctermfg=209 ctermbg=NONE cterm=NONE guifg=#f99157 guibg=NONE gui=NONE
hi Character ctermfg=209 ctermbg=NONE cterm=NONE guifg=#f99157 guibg=NONE gui=NONE
hi Comment ctermfg=60 ctermbg=NONE cterm=NONE guifg=#65737e guibg=NONE gui=NONE
hi Conditional ctermfg=176 ctermbg=NONE cterm=NONE guifg=#c594c5 guibg=NONE gui=NONE
hi Constant ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Define ctermfg=176 ctermbg=NONE cterm=NONE guifg=#c594c5 guibg=NONE gui=NONE
hi DiffAdd ctermfg=188 ctermbg=64 cterm=bold guifg=#cdd3de guibg=#44840f gui=bold
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#89090a guibg=NONE gui=NONE
hi DiffChange ctermfg=188 ctermbg=23 cterm=NONE guifg=#cdd3de guibg=#1e3b5e gui=NONE
hi DiffText ctermfg=188 ctermbg=24 cterm=bold guifg=#cdd3de guibg=#204a87 gui=bold
hi ErrorMsg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi WarningMsg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Float ctermfg=209 ctermbg=NONE cterm=NONE guifg=#f99157 guibg=NONE gui=NONE
hi Function ctermfg=68 ctermbg=NONE cterm=NONE guifg=#6699cc guibg=NONE gui=NONE
hi Identifier ctermfg=176 ctermbg=NONE cterm=NONE guifg=#c594c5 guibg=NONE gui=NONE
hi Keyword ctermfg=176 ctermbg=NONE cterm=NONE guifg=#c594c5 guibg=NONE gui=NONE
hi Label ctermfg=114 ctermbg=NONE cterm=NONE guifg=#99c794 guibg=NONE gui=NONE
hi NonText ctermfg=60 ctermbg=23 cterm=NONE guifg=#65737e guibg=#24333d gui=NONE
hi Number ctermfg=209 ctermbg=NONE cterm=NONE guifg=#f99157 guibg=NONE gui=NONE
hi Operator ctermfg=73 ctermbg=NONE cterm=NONE guifg=#5fb3b3 guibg=NONE gui=NONE
hi PreProc ctermfg=176 ctermbg=NONE cterm=NONE guifg=#c594c5 guibg=NONE gui=NONE
hi Special ctermfg=188 ctermbg=NONE cterm=NONE guifg=#cdd3de guibg=NONE gui=NONE
hi SpecialKey ctermfg=60 ctermbg=23 cterm=NONE guifg=#65737e guibg=#2d3c45 gui=NONE
hi Statement ctermfg=176 ctermbg=NONE cterm=NONE guifg=#c594c5 guibg=NONE gui=NONE
hi StorageClass ctermfg=176 ctermbg=NONE cterm=NONE guifg=#c594c5 guibg=NONE gui=NONE
hi String ctermfg=114 ctermbg=NONE cterm=NONE guifg=#99c794 guibg=NONE gui=NONE
hi Tag ctermfg=167 ctermbg=NONE cterm=NONE guifg=#eb606b guibg=NONE gui=NONE
hi Title ctermfg=188 ctermbg=NONE cterm=bold guifg=#cdd3de guibg=NONE gui=bold
hi Todo ctermfg=60 ctermbg=NONE cterm=inverse,bold guifg=#65737e guibg=NONE gui=inverse,bold
hi Type ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=176 ctermbg=NONE cterm=NONE guifg=#c594c5 guibg=NONE gui=NONE
hi rubyFunction ctermfg=68 ctermbg=NONE cterm=NONE guifg=#6699cc guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=114 ctermbg=NONE cterm=NONE guifg=#99c794 guibg=NONE gui=NONE
hi rubyConstant ctermfg=221 ctermbg=NONE cterm=NONE guifg=#fac863 guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=114 ctermbg=NONE cterm=NONE guifg=#99c794 guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=209 ctermbg=NONE cterm=NONE guifg=#f99157 guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ec5f67 guibg=NONE gui=italic
hi rubyInclude ctermfg=68 ctermbg=NONE cterm=NONE guifg=#6699cc guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=188 ctermbg=NONE cterm=NONE guifg=#cdd3de guibg=NONE gui=NONE
hi rubyRegexp ctermfg=73 ctermbg=NONE cterm=NONE guifg=#5fb3b3 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=73 ctermbg=NONE cterm=NONE guifg=#5fb3b3 guibg=NONE gui=NONE
hi rubyEscape ctermfg=73 ctermbg=NONE cterm=NONE guifg=#5fb3b3 guibg=NONE gui=NONE
hi rubyControl ctermfg=176 ctermbg=NONE cterm=NONE guifg=#c594c5 guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=188 ctermbg=NONE cterm=NONE guifg=#cdd3de guibg=NONE gui=NONE
hi rubyOperator ctermfg=73 ctermbg=NONE cterm=NONE guifg=#5fb3b3 guibg=NONE gui=NONE
hi rubyException ctermfg=68 ctermbg=NONE cterm=NONE guifg=#6699cc guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ec5f67 guibg=NONE gui=italic
hi rubyRailsUserClass ctermfg=221 ctermbg=NONE cterm=NONE guifg=#fac863 guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=68 ctermbg=NONE cterm=NONE guifg=#6699cc guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=68 ctermbg=NONE cterm=NONE guifg=#6699cc guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=68 ctermbg=NONE cterm=NONE guifg=#6699cc guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=68 ctermbg=NONE cterm=NONE guifg=#6699cc guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=209 ctermbg=NONE cterm=NONE guifg=#f99157 guibg=NONE gui=NONE
hi erubyComment ctermfg=60 ctermbg=NONE cterm=NONE guifg=#65737e guibg=NONE gui=NONE
hi erubyRailsMethod ctermfg=68 ctermbg=NONE cterm=NONE guifg=#6699cc guibg=NONE gui=NONE
hi htmlTag ctermfg=73 ctermbg=NONE cterm=NONE guifg=#5fb3b3 guibg=NONE gui=NONE
hi htmlEndTag ctermfg=73 ctermbg=NONE cterm=NONE guifg=#5fb3b3 guibg=NONE gui=NONE
hi htmlTagName ctermfg=73 ctermbg=NONE cterm=NONE guifg=#5fb3b3 guibg=NONE gui=NONE
hi htmlArg ctermfg=73 ctermbg=NONE cterm=NONE guifg=#5fb3b3 guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=209 ctermbg=NONE cterm=NONE guifg=#f99157 guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=176 ctermbg=NONE cterm=NONE guifg=#c594c5 guibg=NONE gui=NONE
hi javaScriptRailsFunction ctermfg=68 ctermbg=NONE cterm=NONE guifg=#6699cc guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=167 ctermbg=NONE cterm=NONE guifg=#eb606b guibg=NONE gui=NONE
hi yamlAnchor ctermfg=188 ctermbg=NONE cterm=NONE guifg=#cdd3de guibg=NONE gui=NONE
hi yamlAlias ctermfg=188 ctermbg=NONE cterm=NONE guifg=#cdd3de guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=114 ctermbg=NONE cterm=NONE guifg=#99c794 guibg=NONE gui=NONE
hi cssURL ctermfg=209 ctermbg=NONE cterm=NONE guifg=#f99157 guibg=NONE gui=NONE
hi cssFunctionName ctermfg=68 ctermbg=NONE cterm=NONE guifg=#6699cc guibg=NONE gui=NONE
hi cssColor ctermfg=73 ctermbg=NONE cterm=NONE guifg=#5fb3b3 guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=139 ctermbg=NONE cterm=NONE guifg=#bb80b3 guibg=NONE gui=NONE
hi cssClassName ctermfg=139 ctermbg=NONE cterm=NONE guifg=#bb80b3 guibg=NONE gui=NONE
hi cssValueLength ctermfg=209 ctermbg=NONE cterm=NONE guifg=#f99157 guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=209 ctermbg=NONE cterm=NONE guifg=#f99157 guibg=NONE gui=NONE
hi cssBraces ctermfg=73 ctermbg=NONE cterm=NONE guifg=#5fb3b3 guibg=NONE gui=NONE