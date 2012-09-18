require 'test_helper'

class RendererTest < ActiveSupport::TestCase

  def setup
    @markdown = Redcarpet::Markdown.new(MdEmoji::Render,
      :fenced_code_blocks  => true,
      :no_intra_emphasis   => true)
  end

  test "adds emoji to text when the emoji exists" do
    text = "Hello :smile: world!"

    parsed_text = @markdown.render(text)

    assert_emoji 'smile', parsed_text
  end

  test "works with +1 emoji" do
    text = ":+1:"

    parsed_text = @markdown.render(text)

    assert_emoji '+1', parsed_text
  end

  test "works on emoji with underscores" do
    text = "This is tense :sweat_drops:"

    parsed_text = @markdown.render(text)

    assert_emoji 'sweat_drops', parsed_text
  end

  test "extreme underscores" do
    text = "This is extreme :arrow_double_down:"

    parsed_text = @markdown.render(text)

    assert_emoji 'arrow_double_down', parsed_text
  end

  test "works within list items" do
    text = "- wow :smile:\n- amazing"

    parsed_text = @markdown.render(text)

    assert_emoji 'smile', parsed_text
  end

  test "skips emoji which aren't supported" do
    text = "Hello :jordan_byron: world!"

    parsed_text = @markdown.render(text)

    assert_equal %{<p>Hello :jordan_byron: world!</p>\n}, parsed_text
  end

  test "works with autolink enabled" do
    @markdown = Redcarpet::Markdown.new(MdEmoji::Render, :autolink => true)

    text        = ":wink2: http://www.jordanbyron.com"
    parsed_text = @markdown.render(text)

    assert_emoji 'wink2', parsed_text
    assert parsed_text.include?(%{<a href="http://www.jordanbyron.com"}),
           "Hyperlink not present in parsed text: #{parsed_text}"
  end

  test "works with no_styles enabled" do
    @markdown = Redcarpet::Markdown.new(MdEmoji::Render.new(:no_styles => true))

    text        = ":wink2: <a style='color: red;'></a>"
    parsed_text = @markdown.render(text)

    assert_emoji 'wink2', parsed_text
  end

  test "works with hard_wrap enabled" do
    @markdown = Redcarpet::Markdown.new(MdEmoji::Render.new(:hard_wrap => true))

    text        = ":wink2:\nline"
    parsed_text = @markdown.render(text)

    assert_emoji 'wink2', parsed_text
    assert parsed_text.include?(%{<br>}),
           "<br> not present in parsed text: #{parsed_text}"
  end

  test "does not render emoji in codeblocks" do
    text = %{```ruby
def hello
  :wink:
end
```
Everything is ok :smile: `:wink2`

```
:fireengine:
```}

    parsed_text = @markdown.render(text)

    assert_emoji 'smile', parsed_text
    refute_emoji 'wink',  parsed_text
  end

end
