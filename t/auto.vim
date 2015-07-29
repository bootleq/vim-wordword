runtime! plugin/wordword.vim

describe 'Autocmd'
  before
    tabedit 
  end

  after
    tabclose!
  end

  it 'adds spaces when insert'
    call setline(1, 'fix word中文')
    execute 'normal!' 'Ifoo一二bar  baz三四'
    Expect getline('.') == 'foo 一二 bar  baz 三四 fix word中文'
  end

  it 'adds spaces when append'
    call setline(1, 'fix word中文')
    execute 'normal!' 'Afoo一二bar  baz三四'
    Expect getline('.') == 'fix word中文 foo 一二 bar  baz 三四'
  end

  it 'respects break_on_punctuation option'
    let g:wordword_break_on_punctuation = 1
    execute 'normal!' 'ifoo,bar'
    Expect getline('.') == 'foo, bar'
  end
end
