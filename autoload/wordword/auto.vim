function! wordword#auto#insert_char_pre() "{{{
  let prev = matchstr(
        \   getline('.'),
        \   printf('.\%%%sc', col('.'))
        \ )
  let text = prev . v:char
  let broken = wordword#break(text)

  if text != broken
    let v:char = strpart(broken, len(prev))
  endif
endfunction "}}}


function! wordword#auto#insert_leave() "{{{
  let text = matchstr(
        \   getline('.'),
        \   printf('\%%>%sc..', col('.') - 1)
        \ )
  let broken = wordword#break(text)

  if text != broken
    call wordword#_#save_reg('a')
    call setreg('a', ' ', 'v')
    silent normal! "ap
    call wordword#_#restore_reg('a')
  endif
endfunction "}}}
