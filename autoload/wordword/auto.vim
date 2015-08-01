let s:paused = 0


function! wordword#auto#on() "{{{
  let s:paused = 0
endfunction "}}}


function! wordword#auto#off() "{{{
  let s:paused = 1
endfunction "}}}


function! wordword#auto#paused() "{{{
  return s:paused
endfunction "}}}


function! wordword#auto#register(...) abort "{{{
  let events = s:parse_events(a:000)

  augroup wordword
    if index(events, 'InsertCharPre') > -1
      autocmd InsertCharPre <buffer> call wordword#auto#insert_char_pre()
    endif

    if index(events, 'InsertLeave') > -1
      autocmd InsertLeave <buffer> call wordword#auto#insert_leave()
    endif
  augroup END
endfunction "}}}


function! wordword#auto#unregister(...) "{{{
  let events = s:parse_events(a:000)

  if index(events, 'InsertCharPre') > -1
    execute 'autocmd! wordword InsertCharPre <buffer>'
  endif

  if index(events, 'InsertLeave') > -1
    execute 'autocmd! wordword InsertLeave <buffer>'
  endif
endfunction "}}}


function! wordword#auto#insert_char_pre() abort "{{{
  if s:paused
    return
  end

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


function! wordword#auto#insert_leave() abort "{{{
  if s:paused
    return
  end

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


function! s:parse_events(args) "{{{
  let events = len(a:args) ?
        \ copy(a:args) :
        \ ['InsertCharPre', 'InsertLeave']

  let events = map(events, 's:camelize(v:val)')
  return events
endfunction "}}}


function! s:camelize(term) "{{{
  let term = substitute(
        \   a:term,
        \   '\%(^\|[^a-zA-Z]\)' . '\@<=' . '[a-z0-9]*',
        \   '\u\0',
        \   'g'
        \ )
  return substitute(term, '\W\|_', '', 'g')
endfunction "}}}
