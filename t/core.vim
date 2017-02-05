describe 'wordword#break'
  it '在中英文字間增加空白'
    Expect wordword#break('但是all何night') == '但是 all 何 night'
  end

  it '在中文和數字間增加空白'
    Expect wordword#break('車6平4') == '車 6 平 4'
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

  it '在小數點後增加空白（預設行為）'
    Expect wordword#break('11.22.33.44.55')   == '11. 22. 33. 44. 55'
    Expect wordword#break('11. 22.33.44. 55') == '11. 22. 33. 44. 55'
    Expect wordword#break('aa.22.33.bb.55')   == 'aa. 22. 33. bb. 55'
  end

  it '保留重複的標點或空白'
    Expect wordword#break('foo,bar,,baz,  qux,   hoge...piyo!?') == 'foo, bar,, baz,  qux,   hoge... piyo!?'
  end

  describe 'no break on decimal point'
    before
      let g:wordword_no_break_on_decimal_point = 1
    end

    it '不要在小數點後增加空白'
      Expect wordword#break('11.22.33.44.55')   == '11.22. 33.44. 55'
      Expect wordword#break('11. 22.33.44. 55') == '11. 22.33. 44. 55'
      Expect wordword#break('aa.22.33.bb.55')   == 'aa. 22.33. bb. 55'
    end

    describe '不影響 non-digit 狀況的標點處理'
      it '在文字與標點符號之間增加空白'
        Expect wordword#break('Take,your.stinking;paws:off?me!you-damn(dirty)ape!!') == 'Take, your. stinking; paws: off? me! you-damn (dirty) ape!!'
      end

      it '在「中文 + 標點」後增加空白'
        Expect wordword#break('一,二.三;四:五?六!七-八_九(十)一') == '一, 二. 三; 四: 五? 六! 七-八_九 (十) 一'
      end

      it '保留重複的標點或空白'
        Expect wordword#break('foo,bar,,baz,  qux,   hoge...piyo!?') == 'foo, bar,, baz,  qux,   hoge... piyo!?'
      end
    end
  end
end
