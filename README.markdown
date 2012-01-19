# Markdown Emoji for Rails

Want to include [emoji](http://www.emoji-cheat-sheet.com/) in your rails app? Well now you can!

:balloon: :smile: :balloon:

This plugin requires `redcarpet` and `rails` >= 3.1 with the asset pipeline enabled.

## Installation

Add the following line to your Gemfile

```
gem 'md_emoji'
```

## Using

When creating a new markdown renderer, just use `MdEmoji::Render`

```ruby
markdown = Redcarpet::Markdown.new(MdEmoji::Render)

markdown.render("Hello :smile: world!")
```

## Contributing

Features and bugs are tracked through [Github Issues](https://github.com/mendicant-university/md_emoji/issues).

Contributors retain copyright to their work but must agree to release their
contributions under the same terms as this project. For details, please see the LICENSE file.

If you would like to help with developing MD Emoji, please get in touch!
Contact Jordan through [GitHub (@jordanbyron)](https://github.com/jordanbyron) or [Twitter (@jordan_byron)](http://twitter.com/jordan_byron)

### Submitting a Pull Request

1. If a ticket doesn't exist for your bug or feature, create one on GitHub.
    - **NOTE:** Don't be afraid to get feedback on your idea before you begin development work. In fact it is encouraged.
2. Fork the project.
3. Create a topic branch.
4. Implement your feature or bug fix.
5. Add documentation for your feature or bug fix.
6. Add tests for your feature or bug fix.
7. Run `rake test`. If your changes are not 100% covered, go back to step 6.
8. If your change affects something in this README, please update it
9. Commit and push your changes.
10. Submit a pull request.

## License

Copyright (c) 2011 Jordan Byron

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

---

MD Emoji - a [Mendicant University](http://mendicantuniversity.org) project