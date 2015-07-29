let s:text = ''


function! operator#wordword#break(motionwise) "{{{
  let v = operator#user#visual_command_from_wise_name(a:motionwise)
  call s:yank(v)
  let text = s:text
  let text = wordword#break(text)
  call s:paste(text, v)
endfunction "}}}


function! s:yank(v) "{{{
  call wordword#_#save_reg('a')
  execute 'normal!' '`[' . a:v . '`]"ay'
  let s:text = @a
  call wordword#_#restore_reg('a')
endfunction "}}}


function! s:paste(text, v) "{{{
  call wordword#_#save_reg('a')
  call setreg('a', a:text, a:v)
  silent normal! gv"ap
  call wordword#_#restore_reg('a')
endfunction "}}}
