require 'test_helper'

class MdEmojiTest < ActiveSupport::TestCase

  def setup
    @markdown = Redcarpet::Markdown.new(MdEmoji::Render)
  end

  test "adds emoji to text when the emoji exists" do
    text = "Hello :smile: world!"

    parsed_text = @markdown.render(text)

    assert parsed_text.include? %{<img src="/assets/emojis/smile.png"}

  end

  test "works with +1 emoji" do
    text = ":+1:"

    parsed_text = @markdown.render(text)

    assert parsed_text.include? %{<img src="/assets/emojis/plus1.png"}

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

    assert parsed_text.include?(%{<img src="/assets/emojis/wink2.png"}),
           "Emoji not present in parsed text: #{parsed_text}"
    assert parsed_text.include?(%{<a href="http://www.jordanbyron.com"}),
           "Hyperlink not present in parsed text: #{parsed_text}"
  end
end
