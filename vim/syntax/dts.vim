" Syntax highlighting for Device Tree files

if exists("b:current_syntax")
  finish
endif

syn keyword dtsKeyword /memreserve/ /delete-node/ /delete-property/
syn keyword dtsKeyword /omit-if-no-ref/

syn region dtsNode start=+[^;{]/+ end=+{+ contains=dtsKeyword fold

syn region dtsProperty start=+^\s*+ matchgroup=dtsPropertyName skipwhite end=+;+ keepend contains=dtsString,dtsNumber

syn match dtsString +\"\(\\.\|[^"]\)*\"+
syn match dtsNumber +\<0x[0-9A-Fa-f]\+\>+
syn match dtsNumber +\<[0-9]\+\>+

highlight link dtsKeyword Keyword
highlight link dtsNode Structure
highlight link dtsPropertyName Identifier
highlight link dtsString String
highlight link dtsNumber Number

let b:current_syntax = "dts"

