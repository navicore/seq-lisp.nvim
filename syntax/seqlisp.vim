" Vim syntax file
" Language: SeqLisp
" Maintainer: Ed Sweeney
" Latest Revision: 2024

if exists("b:current_syntax")
  finish
endif

" Comments
syn match seqlispComment ";.*$" contains=seqlispTodo
syn keyword seqlispTodo contained TODO FIXME XXX NOTE HACK

" Strings
syn region seqlispString start=/"/ skip=/\\"/ end=/"/ contains=seqlispEscape
syn match seqlispEscape contained /\\[nrt"\\]/

" Numbers
syn match seqlispNumber "\<-\?\d\+\>"
syn match seqlispFloat "\<-\?\d\+\.\d\+\>"

" Booleans
syn keyword seqlispBoolean #t #f

" Quoted symbols
syn match seqlispQuote "'" nextgroup=seqlispSymbol
syn match seqlispQuasiquote "`" nextgroup=seqlispSymbol
syn match seqlispUnquote ",@\?" nextgroup=seqlispSymbol

" ============================================================================
" Special Forms
" ============================================================================

syn keyword seqlispSpecial define lambda let if cond begin
syn keyword seqlispSpecial quote quasiquote unquote unquote-splicing
syn keyword seqlispSpecial defmacro try

" ============================================================================
" Builtins
" ============================================================================

" Arithmetic
syn keyword seqlispArith + - * / abs min max modulo

" Comparison
syn keyword seqlispCompare < > <= >= = equal?

" List operations
syn keyword seqlispList cons car cdr list append reverse length
syn keyword seqlispList null? list? nth last take drop
syn keyword seqlispList map filter fold apply

" Type predicates
syn keyword seqlispPredicate number? integer? float? string? symbol? boolean?

" I/O
syn keyword seqlispIO print display read-line exit

" String operations
syn keyword seqlispString string-length string-append substring

" JSON
syn keyword seqlispJSON json-parse json-encode

" LSP support
syn keyword seqlispLSP parse-with-errors eval-with-errors

" Macros
syn keyword seqlispMacro gensym

" Parentheses matching
syn region seqlispList matchgroup=seqlispParen start="(" end=")" contains=ALL

" ============================================================================
" Highlighting
" ============================================================================

hi def link seqlispComment Comment
hi def link seqlispTodo Todo
hi def link seqlispString String
hi def link seqlispEscape SpecialChar
hi def link seqlispNumber Number
hi def link seqlispFloat Float
hi def link seqlispBoolean Boolean
hi def link seqlispQuote Special
hi def link seqlispQuasiquote Special
hi def link seqlispUnquote Special

hi def link seqlispSpecial Keyword
hi def link seqlispArith Operator
hi def link seqlispCompare Operator
hi def link seqlispList Function
hi def link seqlispPredicate Type
hi def link seqlispIO Function
hi def link seqlispJSON Function
hi def link seqlispLSP Function
hi def link seqlispMacro Macro
hi def link seqlispParen Delimiter

let b:current_syntax = "seqlisp"
