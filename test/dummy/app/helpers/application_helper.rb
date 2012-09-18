module ApplicationHelper
  def md(text)
    markdown = Redcarpet::Markdown.new(MdEmoji::Render,
      :no_intra_emphasis => true)

    markdown.render(text).html_safe
  end
end
