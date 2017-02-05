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

let s:ISKEYWORD = printf('@,%s-%s', char2nr('0'), char2nr('9'))

" }}} Constants


function! wordword#break(text)
  let t = a:text
  let iskeyword = &l:iskeyword
  execute 'setlocal iskeyword=' . s:ISKEYWORD

  let t = substitute(t, '\>\<.', ' \0', 'g')

  if get(g:, 'wordword_break_on_punctuation')
    let puncts = s:PUNCTUATIONS.before_space

    if get(g:, 'wordword_no_break_on_decimal_point')
      let t = substitute(t, '\D\.\<', '\0 ', 'g') " process non-digit first
      let t = substitute(t, '\v(\d+\.){2}', '\0 ', 'g') " split continuous \d.\d, e.g., 11.22.33 -> 11.22. 33
      let t = substitute(t, '\d\+\.' . '\(\d\)\@!' . '\<', '\0 ', 'g')

      let pattern = printf('[%s]\<', substitute(join(puncts, ''), '\.', '', ''))
      let t = substitute(t, pattern, '\0 ', 'g')
    else
      let pattern = printf('[%s]\<', join(puncts, ''))
      let t = substitute(t, pattern, '\0 ', 'g')
    endif

    let pattern = printf('\>[%s]', join(s:PUNCTUATIONS.after_space, ''))
    let t = substitute(t, pattern, ' \0', 'g')
  endif

  let &l:iskeyword = iskeyword
  return t
endfunction
