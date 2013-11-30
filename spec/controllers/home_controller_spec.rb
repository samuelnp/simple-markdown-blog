require 'spec_helper'

describe HomeController do
  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end

    it "should get posts collection" do
      post = FactoryGirl.create(:post)
      get 'index'
      assigns(:posts).should eq([post])
    end

    it "should paginate results" do

      12.times do
        post = FactoryGirl.create(:post)
      end
      get 'index', page: 2
      assigns(:posts).length.should == 2
    end
  end

  describe "GET 'tag'" do
    it "should not be successfull whithout params" do
      get 'tagged', tag: ''
      response.should be_success
    end

    it "should get posts collection with example tag" do
      post = FactoryGirl.create(:post, tag_list: 'example')
      get 'tagged', tag: 'example'
      assigns(:posts).should eq([post])
    end
  end

  describe "GET 'feed'" do
    it "should get rss feed" do
      get 'index', format: :rss
      response.should be_success
    end
  end
end
