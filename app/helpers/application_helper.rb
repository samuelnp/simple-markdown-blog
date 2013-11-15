module ApplicationHelper
  def render_markdown(text)
    require 'redcarpet'
    # renderer = Redcarpet::Render::HTML.new
    renderer = PygmentizeHTML
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    text = redcarpet.render text
    raw text
  end

  class PygmentizeHTML < Redcarpet::Render::HTML
    def block_code(code, language)
      require 'pygmentize'
      Pygmentize.process(code, language)
    end
end
