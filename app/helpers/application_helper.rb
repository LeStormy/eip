module ApplicationHelper
  def markdown(text)
    options = {
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true
    }

    renderer = CustomRender.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
end

class CustomRender < Redcarpet::Render::HTML
  def image(link, title, alt_text)
    if link.include?('=youtube')
      %(<div style='text-align: center'><iframe src='https://www.youtube.com/embed/#{link.split('=youtube')[1].split('v=')[1]}' frameborder='0' allowfullscreen width='640px' style='max-width: 100%' height='360px'></iframe></div>)
    else
      %(<img src="#{link}" width="100%" height="100%" alt="#{alt_text} />")
    end
  end
end
