Word Word
=========

Reading words without dividing is uncomfortable.

    word文字word

Add word-boundry spaces to rescue.

    word 文字 word


Background
----------

Space is widely used as a [word divider][],
while in Chinese/Japanese writing, there are no separation between words.

When mixing two systems, for example `word文字word`, many people believe some
spacing should appear between `word` and `文字` for readability, lead it seems
like `word 文字 word`.

We haven't developed a good solution so far, and have to add whitespace by
hand.  This plugin comes to help us adding these word-boundary spaces easier.


Features
--------

- A `wordword#break()` function which takes string and converts it with space added.
- User operator (require [kana/vim-textobj-user][]).
- (Optional) add space between word and punctuation, e.g.: `foo,bar` to `foo, bar`.


Related / Reference
-------------------

- [為什麼你們就是不能加個空格呢？][vinta/paranoid-auto-spacing]
- CSS 4 unofficial proposal draft [text-spacing][css4-text-spacing] 
- [中文文案排版指北][]
- [hotoo/pangu.vim][]


License
-------

Release to public domain.


[vinta/paranoid-auto-spacing]: https://github.com/vinta/paranoid-auto-spacing
[hotoo/panguvim]: https://github.com/hotoo/pangu.vim
[css4-text-spacing]: http://dev.w3.org/csswg/css-text-4/#text-spacing-property
[中文文案排版指北]: https://github.com/sparanoid/chinese-copywriting-guidelines
[Space (punctuation)]: https://en.wikipedia.org/wiki/Space_%28punctuation%29
[word divider]: https://en.wikipedia.org/wiki/Word_divider
[kana/vim-textobj-user]: https://github.com/kana/vim-textobj-user
