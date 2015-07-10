let s:text = ''


function! operator#wordword#break(motionwise) "{{{
  let v = operator#user#visual_command_from_wise_name(a:motionwise)
  call s:yank(v)
  let text = s:text
  let text = wordword#break(text)
  call s:paste(text, v)
endfunction "}}}


function! s:yank(v) "{{{
  call s:save_reg('a')
  execute 'normal!' '`[' . a:v . '`]"ay'
  let s:text = @a
  call s:restore_reg('a')
endfunction "}}}


function! s:paste(text, v) "{{{
  call s:save_reg('a')
  call setreg('a', a:text, a:v)
  silent normal! gv"ap
  call s:restore_reg('a')
endfunction "}}}


function! s:save_reg(name) "{{{
  let s:save_reg = [getreg(a:name), getregtype(a:name)]
endfunction "}}}


function! s:restore_reg(name) "{{{
  if exists('s:save_reg')
    call setreg(a:name, s:save_reg[0], s:save_reg[1])
  endif
endfunction "}}}
