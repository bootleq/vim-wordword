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

We haven't developed a good solution to add space yet, but have to add
whitespace by hand.  This plugin just comes to make it easier.


Features
--------

- A `wordword#break()` function to convert string with spaces added.
- User operator (require [vim-textobj-user][] plugin by @kana).
- Add spaces between words and punctuations,
  e.g.: `foo,bar` to `foo, bar`.
- Automatically add spaces when typing.

Most features were disabled by default, please read doc to configure yourself.

Related / Reference
-------------------

- [為什麼你們就是不能加個空格呢？][vinta/paranoid-auto-spacing]
- [關於「中英文間是否需要一格空白」的討論 • MozTW 討論區][中英文間是否需要一格空白 - MozTW 討論區]
- CSS4 [text spacing][css4-text-spacing] (unofficial proposal draft)
- [中文文案排版指北][]
- [hotoo/pangu.vim][]
- [讓你的 emacs 自動在英文與中文之間加入空白 - coldnew's blog][blog coldnew/pangu-spacing.el]


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
[blog coldnew/pangu-spacing.el]: http://coldnew.github.io/blog/2013/05/20_5cbb7.html 
