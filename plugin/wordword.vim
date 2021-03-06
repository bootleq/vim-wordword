if exists('g:loaded_wordword')
  finish
endif
let g:loaded_wordword = 1
let s:save_cpo = &cpoptions
set cpoptions&vim


" Interface: {{{

silent! call operator#user#define('wordword', 'operator#wordword#break')

" }}} Interface


" Finish:  {{{

let &cpoptions = s:save_cpo
unlet s:save_cpo

" }}} Finish


" modeline {{{
" vim: expandtab softtabstop=2 shiftwidth=2 foldmethod=marker
