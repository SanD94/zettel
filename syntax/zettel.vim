" Vim syntax file
" Language:     zettel
" Maintainer:   Safa Andac
" Filenames:    *.md
" Last Change:  2020 May 08

if exists("b:current_syntax")
  finish
endif

if !exists('main_syntax')
  let main_syntax = 'zettel'
endif

runtime! syntax/markdown.vim
unlet! b:current_syntax


syn match FileTagDelimiter /\(\[\[\|\]\]\)/
syn match CitationTagDelimiter /\(\[#\|\]\)/
syn match zettelTag /\v\@(\k|-)+/
syn region zettelFileTag matchgroup=FileTagDelimiter start=/\[\[/  end=/\]\]/ concealends
syn region zettelCitationTag matchgroup=CitationTagDelimiter start=/\[#/ end=/\]/ concealends


hi def link zettelTag                   String
hi def link zettelCitationTag           markdownFootnote
hi def link zettelFileTag               markdownUrl

let b:current_syntax = "zettel"
if main_syntax ==# 'zettel'
  unlet main_syntax
endif

