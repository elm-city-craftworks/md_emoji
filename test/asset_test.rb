require 'test_helper'

class AssetTest < ActionDispatch::IntegrationTest

  test "emojis are rendered to the page" do
    visit root_path

    MdEmoji::EMOJI.each do |emoji|
      assert_emoji emoji, page.body
    end
  end

  test "emoji assets are present" do
    MdEmoji::EMOJI.each do |emoji|
      emoji = emoji.gsub('+', 'plus')
      assert Dummy::Application.assets.find_asset("emojis/#{emoji}.png"),
        "Emoji (#{emoji}) asset missing"
    end
  end
end
