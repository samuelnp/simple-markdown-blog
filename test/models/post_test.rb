require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "must have a title" do
    p = Post.new
    assert !p.save, "Post was saved without a title"
  end

  test "must have a body" do
    p = Post.new
    assert !p.save, "Post was saved without a body"
  end
end
