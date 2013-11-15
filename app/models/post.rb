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
end
