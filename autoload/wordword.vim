function! wordword#break(text)
  let t = a:text
  let t = substitute(t, '\>\<', '\0 ', 'g')
  return t
endfunction
