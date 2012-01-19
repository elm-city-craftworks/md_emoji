module MdEmoji
  class Render < Redcarpet::Render::HTML
    def normal_text(text)
      return if text.nil?

      text.gsub(/:(\S+):/) do |emoji|
        if MdEmoji::EMOJI.include?($1)
          file_name    = "#{$1.gsub('+', 'plus')}.png"
          default_size = %{height="20" width="20"}

          %{<img src="/assets/emojis/#{file_name}" class="emoji" } +
            %{title="#{emoji}" alt="#{emoji} #{default_size}">}
        else
          emoji
        end
      end
    end
  end
end
