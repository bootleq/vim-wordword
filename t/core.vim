describe 'wordword#break'
  it '在中英文字間增加空白'
    Expect wordword#break('但是all何night') == '但是 all 何 night'
  end
end
