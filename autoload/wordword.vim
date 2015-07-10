" Constants: {{{

let s:PUNCTUATIONS = {
      \   'before_space': [
      \     '!',
      \     ')',
      \     ',',
      \     '.',
      \     ':',
      \     ';',
      \     '?'
      \   ],
      \   'after_space': [
      \     '('
      \   ]
      \ }

" }}} Constants


function! wordword#break(text)
  let t = a:text
  let iskeyword = &l:iskeyword
  setlocal iskeyword=@

  if get(g:, 'wordword_break_on_punctuation')
    let pattern = printf('\>[%s]\?\<', join(s:PUNCTUATIONS.before_space, ''))
  else
    let pattern = '\>\<'
  endif

  let t = substitute(
        \   t,
        \   pattern,
        \   '\0 ',
        \   'g'
        \ )

  if get(g:, 'wordword_break_on_punctuation')
    let pattern = printf('\>[%s]\<', join(s:PUNCTUATIONS.after_space, ''))
    let t = substitute(
          \   t,
          \   pattern,
          \   ' \0',
          \   'g'
          \ )
  endif

  let &l:iskeyword = iskeyword
  return t
endfunction
