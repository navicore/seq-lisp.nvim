" Vim indent file
" Language: SeqLisp

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetSeqLispIndent()
setlocal indentkeys+=0)
setlocal lisp
setlocal lispwords=define,lambda,let,if,cond,begin,defmacro,try

if exists("*GetSeqLispIndent")
  finish
endif

function! GetSeqLispIndent()
  let lnum = prevnonblank(v:lnum - 1)
  if lnum == 0
    return 0
  endif

  let prev_line = getline(lnum)
  let curr_line = getline(v:lnum)
  let ind = indent(lnum)

  " Count unclosed parens on previous line
  let open_parens = count(prev_line, '(') - count(prev_line, ')')

  if open_parens > 0
    let ind += shiftwidth() * open_parens
  endif

  " Decrease indent for closing parens
  let close_parens = 0
  let i = 0
  while i < len(curr_line) && curr_line[i] =~ '[\s)]'
    if curr_line[i] == ')'
      let close_parens += 1
    endif
    let i += 1
  endwhile

  if close_parens > 0
    let ind -= shiftwidth() * close_parens
  endif

  return ind < 0 ? 0 : ind
endfunction
