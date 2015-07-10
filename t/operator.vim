runtime! plugin/wordword.vim

describe 'Key mapping'
  it 'is available in proper modes'
    let lhs = '<Plug>(operator-wordword)'
    Expect maparg(lhs, 'n') =~# 'operator#wordword#break'
    Expect maparg(lhs, 'v') =~# 'operator#wordword#break'
    Expect maparg(lhs, 'o') ==# 'g@'
    Expect maparg(lhs, 'i') ==# ''
    Expect maparg(lhs, 'c') ==# ''
  end
end

describe '<Plug>(operator-wordword)'
  before
    let bad  = readfile('t/fixtures/bad.md')
    tabedit 
    0 put = bad
  end

  after
    tabclose!
  end

  it 'converts Visual selected lines'
    call search('2 為什麼thou就是不能加4個空格呢？')
    execute 'normal' "Vj\<Plug>(operator-wordword)"

    Expect getline('.') == '2 為什麼 thou 就是不能加 4 個空格呢？'

    normal! j
    Expect getline('.') == '3 為什麼 thou 就是不能加 4 個空格呢？'

    normal! 2k
    Expect getline('.') == '1 為什麼thou就是不能加4個空格呢？'
  end

  it 'converts text in upcoming movement'
    call search('2 為什麼thou就是不能加4個空格呢？')
    execute 'normal' "\<Plug>(operator-wordword)2j"

    Expect getline('.') == '2 為什麼 thou 就是不能加 4 個空格呢？'

    normal! j
    Expect getline('.') == '3 為什麼 thou 就是不能加 4 個空格呢？'

    normal! 2k
    Expect getline('.') == '1 為什麼thou就是不能加4個空格呢？'
  end
end
