describe 'wordword#break'
  it '在中英文字間增加空白'
    Expect wordword#break('但是all何night') == '但是 all 何 night'
  end

  it 'does not change iskeyword option value'
    setlocal iskeyword=A,B
    Expect wordword#break('但是all何night') == '但是 all 何 night'
    Expect &iskeyword   == 'A,B'
    Expect &l:iskeyword == 'A,B'
  end
end

describe 'break word and punctuation'
  before
    let g:wordword_break_on_punctuation = 1
  end

  it '在文字與標點符號之間增加空白'
    Expect wordword#break('Take,your.stinking;paws:off?me!you-damn(dirty)ape!!') == 'Take, your. stinking; paws: off? me! you-damn (dirty) ape!!'
    let g:wordword_break_on_punctuation = 0
    Expect wordword#break('Take,your.stinking;paws:off?me!you-damn(dirty)ape!!') == 'Take,your.stinking;paws:off?me!you-damn(dirty)ape!!'
  end

  it '在「中文 + 標點」後增加空白'
    Expect wordword#break('一,二.三;四:五?六!七-八_九(十)一') == '一, 二. 三; 四: 五? 六! 七-八_九 (十) 一'
    let g:wordword_break_on_punctuation = 0
    Expect wordword#break('一,二.三;四:五?六!七-八_九(十)一') == '一,二.三;四:五?六!七-八_九(十)一'
  end

  it '不要在「中文 + 全形標點」後增加空白'
    Expect wordword#break('一，二。三；四：五？六！七－八＿九（十）一') == '一，二。三；四：五？六！七－八＿九（十）一'
  end

  it '不要在撇號（apostrophe）後增加空白'
    Expect wordword#break("Don't Panic") == "Don't Panic"
  end

  it '考慮重複的標點或空白'
    Expect wordword#break('foo,bar,,baz,  qux,   hoge...piyo!?') == 'foo, bar,, baz,  qux,   hoge... piyo!?'
  end
end
