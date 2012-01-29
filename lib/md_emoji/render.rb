module MdEmoji
  class Render < Redcarpet::Render::HTML
    def normal_text(text)
      if include_emoji?(text)
        replace_emoji(text)
      else
        text
      end
    end

    # Replaces valid emoji characters, ie :smile:, with img tags
    #
    # Valid emoji charaters are listed in +MdEmoji::EMOJI+
    def replace_emoji(text)
      text.gsub(/:(\S+):/) do |emoji|
        if MdEmoji::EMOJI.include?($1)
          file_name    = "#{$1.gsub('+', 'plus')}.png"
          default_size = %{height="20" width="20"}

          %{<img src="/assets/emojis/#{file_name}" class="emoji" } +
            %{title="#{emoji}" alt="#{emoji}" #{default_size}>}
        else
          emoji
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
