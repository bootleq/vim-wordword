function! Capture(command) "{{{
  redir => output
  silent execute a:command
  redir END
  return output
endfunction "}}}
