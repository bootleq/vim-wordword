runtime! plugin/wordword.vim
runtime! t/helpers.vim

describe 'Pause'
  it 'toggles'
    Expect wordword#auto#paused() to_be_false
    call wordword#auto#off()
    Expect wordword#auto#paused() to_be_true
    call wordword#auto#on()
    Expect wordword#auto#paused() to_be_false
  end
end

describe 'Setting'
  it 'defaults without any events'
    Expect exists('#wordword#InsertCharPre') to_be_false
    Expect exists('#wordword#InsertLeave')   to_be_false
  end

  it 'registers each event'
    call wordword#auto#register('InsertCharPre')
    let m = Capture('autocmd wordword InsertCharPre <buffer>')
    Expect m =~# 'call wordword#auto#insert_char_pre()'
    Expect exists('#wordword#InsertLeave')   to_be_false

    call wordword#auto#register('InsertLeave')
    let m = Capture('autocmd wordword InsertLeave <buffer>')
    Expect m =~# 'call wordword#auto#insert_leave()'

    call wordword#auto#unregister('InsertLeave')
    Expect exists('#wordword#InsertLeave')   to_be_false
    Expect exists('#wordword#InsertCharPre') to_be_true

    call wordword#auto#unregister('InsertCharPre')
    Expect exists('#wordword#InsertLeave')   to_be_false
    Expect exists('#wordword#InsertCharPre') to_be_false
  end

  it 'support snake_case event name'
    call wordword#auto#register('insert_leave')
    Expect exists('#wordword#InsertLeave') to_be_true

    call wordword#auto#unregister('insert_leave')
    Expect exists('#wordword#InsertLeave') to_be_false
  end

  it 'registers all events once'
    call wordword#auto#register()
    Expect exists('#wordword#InsertLeave')   to_be_true
    Expect exists('#wordword#InsertCharPre') to_be_true
    call wordword#auto#unregister()
    Expect exists('#wordword#InsertLeave')   to_be_false
    Expect exists('#wordword#InsertCharPre') to_be_false
  end
end

describe 'Autocmd'
  before
    tabedit 
    call wordword#auto#register()
    call wordword#auto#on()
  end

  after
    tabclose!
  end

  it 'adds spaces when Insert'
    call setline(1, 'fix word中文')
    execute 'normal!' 'Ifoo一二bar  baz三四'
    Expect getline('.') == 'foo 一二 bar  baz 三四 fix word中文'
  end

  it 'adds spaces when Append'
    call setline(1, 'fix word中文')
    execute 'normal!' 'Afoo一二bar  baz三四'
    Expect getline('.') == 'fix word中文 foo 一二 bar  baz 三四'
  end

  it 'respects break_on_punctuation option'
    let g:wordword_break_on_punctuation = 1
    execute 'normal!' 'ifoo,bar'
    Expect getline('.') == 'foo, bar'
  end

  it 'do nothing when off'
    call wordword#auto#off()
    execute 'normal!' 'ifoo一二bar  baz三四'
    Expect getline('.') == 'foo一二bar  baz三四'
  end
end
