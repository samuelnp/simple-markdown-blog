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
#  slug       :string(255)
#

require 'spec_helper'

describe Post do
  it "should not save post without title" do
    post = FactoryGirl.build(:post, :title => '').should_not be_valid
  end

  it "should not save post without title" do
    post = FactoryGirl.build(:post, :body => '').should_not be_valid
  end

  it "should save post with empty tags" do
    post = FactoryGirl.build(:post, :tag_list => '').should be_valid
  end
  it "should save post with tags" do
    post = FactoryGirl.build(:post, :tag_list => 'example').should be_valid
  end

  it "should save post" do
    post = FactoryGirl.build(:post).should be_valid
  end
end
