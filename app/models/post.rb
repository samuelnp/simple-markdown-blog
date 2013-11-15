# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#  html       :text
#

class Post < ActiveRecord::Base
  validates_presence_of :title, :body
  before_save :render_markdown

  def render_markdown
    require 'redcarpet'
    renderer = PygmentizeHTML
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    self.html = redcarpet.render self.body
  end

  class PygmentizeHTML < Redcarpet::Render::HTML
    def block_code(code, language)
      require 'pygmentize'
      Pygmentize.process(code, language)
    end
  end
end
