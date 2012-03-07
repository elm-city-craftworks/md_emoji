module MdEmoji
  class Render < Redcarpet::Render::HTML
    def paragraph(text)
      "<p>#{replace_emoji(text)}</p>\n"
    end

    def list_item(text, list_type)
      "<li>#{replace_emoji(text)}</li>"
    end

    # Replaces valid emoji characters, ie :smile:, with img tags
    #
    # Valid emoji charaters are listed in +MdEmoji::EMOJI+
    def replace_emoji(text)
      text.gsub(/:(\S+):/) do |emoji|

        emoji_code = emoji #.gsub("|", "_")
        emoji      = emoji_code.gsub(":", "")

        if MdEmoji::EMOJI.include?(emoji)
          file_name    = "#{emoji.gsub('+', 'plus')}.png"
          default_size = %{height="20" width="20"}

          %{<img src="/assets/emojis/#{file_name}" class="emoji" } +
            %{title="#{emoji_code}" alt="#{emoji_code}" #{default_size}>}
        else
          emoji_code
        end
      end
    end

    private

    # Returns +true+ if emoji are present in +text+, otherwise returns +false+
    def include_emoji?(text)
      text && text[/:\S+:/]
    end
  end
end
