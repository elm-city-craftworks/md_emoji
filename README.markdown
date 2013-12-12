# Markdown Emoji for Rails

Want to include [emoji](http://www.emoji-cheat-sheet.com/) in your rails app?
Well now you can!

![:balloon:][balloon]
![:smile:][smile]
![:balloon:][balloon]

Markdown Emoji was designed to work with the
[Redcarpet](https://github.com/tanoku/redcarpet) markdown processor and
[Rails 3.1](https://github.com/rails/rails) with the asset pipeline enabled.

**Warning** This gem does some scary stuff under the hood, so please check out
the code, test first, and don't hesitate to ask questions. If you'd like a less insane way to add Emoji to your project, check out the [http-pipeline][http-pipeline] gem.

[![Build Status](https://secure.travis-ci.org/elm-city-craftworks/md_emoji.png?branch=master)](http://travis-ci.org/elm-city-craftworks/md_emoji)

## Installation

Add the following line to your Gemfile

```
gem 'md_emoji'
```

## Using

When creating a new markdown renderer, just use `MdEmoji::Render`

```ruby
markdown = Redcarpet::Markdown.new(MdEmoji::Render, :no_intra_emphasis => true)

markdown.render("Hello :smile: world!")
```

__Please take note__ that due to inconsistencies with the RedCarpet gem,
`:no_intra_emphasis => true` is required for emoji with multiple underscores:
`:eight_pointed_black_star:`

Emoji assets will automatically be picked up by the asset pipeline and made
available to your app at:

`/assets/emojis/<EMOJI_NAME>.png`

For a full list of supported emoji, just run `MdEmoji::EMOJI` in your console.

## Contributing

See our [CONTRIBUTING.md](/elm-city-craftworks/md_emoji/blob/master/CONTRIBUTING.md)
document for more details.

## Authorship

Emoji images are from [emoji-cheat-sheet.com](http://emoji-cheat-sheet.com)'s
[github project](https://github.com/arvida/emoji-cheat-sheet.com). This project
was inspired by [GitHub's emoji implementation](https://github.com/blog/816-emoji)
and hacked together by [Jordan Byron](http://jordanbyron.com).

## License

Copyright (c) 2011 Jordan Byron

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

[balloon]: https://github.com/elm-city-craftworks/md_emoji/raw/master/vendor/assets/images/emojis/balloon.png
[smile]: https://github.com/elm-city-craftworks/md_emoji/raw/master/vendor/assets/images/emojis/smile.png
[http-pipeline]: https://github.com/jch/html-pipeline
