require 'spec_helper'

describe Post do
  it "should not save post without title" do
    post = FactoryGirl.build(:post, :title => '').should_not be_valid
  end

  it "should not save post without title" do
    post = FactoryGirl.build(:post, :body => '').should_not be_valid
  end

  it "should save post" do
    post = FactoryGirl.build(:post).should be_valid
  end
end