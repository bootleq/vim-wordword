Word Word
=========
[![Build Status](https://travis-ci.org/bootleq/vim-wordword.svg?branch=master)](https://travis-ci.org/bootleq/vim-wordword)

Reading words without dividing is uncomfortable.

    word文字word

Add word-boundary spaces to rescue.

    word 文字 word


Background
----------

Space is widely used as a [word divider][],
while in Chinese/Japanese writing, there are no separation inter words.

When mixing two systems, for example `word文字word`, many people believe some
spacing should appear between `word` and `文字` for readability, lead it seems
like `word 文字 word`.

We haven't developed a good solution for it yet, have to add whitespace by
hand.  This plugin just comes to help doing it easier.


Features
--------

- A `wordword#break()` function takes string and converts it into space-added version.
- User operator (require [vim-textobj-user][] plugin by @kana).
- Optionally try adding spaces between words and punctuations,
  e.g.: `foo,bar` to `foo, bar`.


Related / Reference
-------------------

- [為什麼你們就是不能加個空格呢？][vinta/paranoid-auto-spacing]
- [關於「中英文間是否需要一格空白」的討論 • MozTW 討論區][中英文間是否需要一格空白 - MozTW 討論區]
- CSS4 [text spacing][css4-text-spacing] (unofficial proposal draft)
- [中文文案排版指北][]
- [hotoo/pangu.vim][]


License
-------

Release to public domain.


[word divider]: https://en.wikipedia.org/wiki/Word_divider
[vinta/paranoid-auto-spacing]: https://github.com/vinta/paranoid-auto-spacing
[css4-text-spacing]: http://dev.w3.org/csswg/css-text-4/#spacing
[中文文案排版指北]: https://github.com/sparanoid/chinese-copywriting-guidelines
[vim-textobj-user]: https://github.com/kana/vim-textobj-user
[hotoo/pangu.vim]: https://github.com/hotoo/pangu.vim
[中英文間是否需要一格空白 - MozTW 討論區]: https://forum.moztw.org/viewtopic.php?t=20449&amp;start=0
