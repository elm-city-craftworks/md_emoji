module MdEmoji
  class Render < Redcarpet::Render::HTML
    def preprocess(document)
      if include_emoji?(document)
        replace_emoji(document)
      else
        document
      end
    end

    def block_code(text, lang)
      "<pre><code#{%{ class="#{lang}"} if lang}>#{revert_emoji(text)}</code></pre>"
    end

    def codespan(text)
      "<code>#{revert_emoji(text)}</code>"
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

    # Replaces emoji images with plain text
    def revert_emoji(text)
      text.gsub(/<[^>]+class="emoji"\stitle="(:\S+:)"[^>]+>/) do |emoji|
        ":#{$1}:"
      end
    end
  end
end
