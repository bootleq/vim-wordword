if exists('g:loaded_wordword')
  finish
endif
let g:loaded_wordword = 1
let s:save_cpo = &cpoptions
set cpoptions&vim


" Interface: {{{

silent! call operator#user#define('wordword', 'operator#wordword#break')

augroup wordword
  autocmd!
  if exists("##InsertCharPre")
    autocmd InsertCharPre * call wordword#auto#insert_char_pre()
  endif

  if exists("##InsertLeave")
    autocmd InsertLeave * call wordword#auto#insert_leave()
  endif
augroup END

" }}} Interface


" Finish:  {{{

let &cpoptions = s:save_cpo
unlet s:save_cpo

" }}} Finish


" modeline {{{
" vim: expandtab softtabstop=2 shiftwidth=2 foldmethod=marker
